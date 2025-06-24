import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' hide Column; // <-- Hide Column to avoid conflict with Flutter's Column
import '../data/database.dart';
import '../data/repository.dart';
import '../data/visits_dao.dart';
import 'add_visits_dialog.dart'; // <-- Import your AddVisitDialog here

class EditHorseDialog extends StatefulWidget {
  final Horse horse;
  const EditHorseDialog({super.key, required this.horse});

  @override
  State<EditHorseDialog> createState() => _EditHorseDialogState();
}

class _EditHorseDialogState extends State<EditHorseDialog> {
  late TextEditingController _nameController;
  int? _selectedOwnerId;
  int? _selectedBarnId;
  late TextEditingController _notesController;

@override
void initState() {
  super.initState();
  _nameController = TextEditingController(text: widget.horse.name);
  _notesController = TextEditingController(text: widget.horse.notes ?? '');
  _selectedOwnerId = widget.horse.ownerId;
  _selectedBarnId = widget.horse.barnId;
}

@override
void dispose() {
  _nameController.dispose();
  _notesController.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    final horseRepo = Provider.of<HorseRepository>(context, listen: false);
    final visitsDao = Provider.of<VisitsDao>(context, listen: false);
    final ownerRepo = Provider.of<OwnerRepository>(context, listen: false);
    final barnRepo = Provider.of<BarnRepository>(context, listen: false);

    return FutureBuilder(
      future: Future.wait([
        ownerRepo.getAllOwners(),
        barnRepo.getAllBarns(),
      ]),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (!snapshot.hasData) {
          return const AlertDialog(
            content: SizedBox(height: 80, child: Center(child: CircularProgressIndicator())),
          );
        }
        final owners = snapshot.data![0] as List<Owner>;
        final barns = snapshot.data![1] as List<Barn>;

        // Defensive: fallback to null if the selected owner/barn no longer exists
        final validOwnerIds = owners.map((o) => o.id).toSet();
        if (_selectedOwnerId != null && !validOwnerIds.contains(_selectedOwnerId)) {
          _selectedOwnerId = null;
        }
        final validBarnIds = barns.map((b) => b.id).toSet();
        if (_selectedBarnId != null && !validBarnIds.contains(_selectedBarnId)) {
          _selectedBarnId = null;
        }

        return AlertDialog(
          title: const Text('Edit Horse'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Horse Name'),
                ),
                    const SizedBox(height: 8),
    TextField(
      controller: _notesController,
      decoration: const InputDecoration(labelText: 'Notes'),
      minLines: 1,
      maxLines: 10,
    ),
                const SizedBox(height: 8),
                DropdownButtonFormField<int>(
                  value: _selectedOwnerId,
                  decoration: const InputDecoration(labelText: 'Owner'),
                  items: [
                    const DropdownMenuItem<int>(
                      value: null,
                      child: Text('Unassigned'),
                    ),
                    ...owners.map((owner) =>
                      DropdownMenuItem<int>(
                        value: owner.id,
                        child: Text(owner.name),
                      ),
                    )
                  ],
                  onChanged: (value) => setState(() => _selectedOwnerId = value),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<int>(
                  value: _selectedBarnId,
                  decoration: const InputDecoration(labelText: 'Barn'),
                  items: [
                    const DropdownMenuItem<int>(
                      value: null,
                      child: Text('Unassigned'),
                    ),
                    ...barns.map((barn) =>
                      DropdownMenuItem<int>(
                        value: barn.id,
                        child: Text(barn.name ?? ''),
                      ),
                    )
                  ],
                  onChanged: (value) => setState(() => _selectedBarnId = value),
                ),
              ],
            ),
          ),
          actions: [
            
            TextButton(
              onPressed: () async {
                // Confirm deletion
                final confirmed = await showDialog<bool>(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Delete Horse'),
                    content: const Text('Are you sure you want to delete this horse?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(ctx).pop(false),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(ctx).pop(true),
                        child: const Text('Delete', style: TextStyle(color: Colors.red)),
                      ),
                    ],
                  ),
                );
                if (confirmed == true) {
                  await horseRepo.deleteHorse(widget.horse.id);
                  Navigator.of(context).pop(); // Close edit dialog
                }
              },
              child: const Text('Delete', style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                final newName = _nameController.text.trim();
                final updatedHorse = widget.horse.copyWith(
                  name: newName.isNotEmpty ? newName : widget.horse.name,
                   notes: Value(_notesController.text.trim()),
                  ownerId: Value(_selectedOwnerId),  // Wrap with Value()
                  barnId: Value(_selectedBarnId),    // Wrap with Value()
                );
                await horseRepo.updateHorse(updatedHorse);
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.add_circle_outline),
              label: const Text('Add Visit'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
              ),
              onPressed: () async {
                final result = await showDialog(
                  context: context,
                  builder: (ctx) => AddVisitDialog(
                    horseId: widget.horse.id,
                    visitsDao: visitsDao,
                  ),
                );
                // Optionally: trigger UI update here
                if (result == true) {
                  // e.g. setState() or parent update
                }
              },
            ),
          ],
        );
      },
    );
  }
}
