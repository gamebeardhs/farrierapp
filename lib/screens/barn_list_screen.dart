import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as drift;
import '../data/repository.dart';
import '../data/database.dart';
import 'barn_horses_screen.dart';

class BarnListScreen extends StatelessWidget {
  const BarnListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final barnRepo = context.watch<BarnRepository>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Barns'),
      ),
      body: StreamBuilder<List<Barn>>(
        stream: barnRepo.watchAllBarns(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
          final barns = snapshot.data!;
          if (barns.isEmpty) return const Center(child: Text('No barns found.'));
          return ListView.builder(
            itemCount: barns.length,
            itemBuilder: (context, idx) {
              final barn = barns[idx];
              return ListTile(
                title: Text(barn.name ?? ''),
                subtitle: barn.notes != null && barn.notes!.isNotEmpty
                    ? Text(barn.notes!, maxLines: 1, overflow: TextOverflow.ellipsis)
                    : null,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BarnHorsesScreen(barn: barn),
                    ),
                  );
                },
                trailing: IconButton(
                  icon: const Icon(Icons.edit),
                  tooltip: 'Edit Barn',
                  onPressed: () => _showEditBarnDialog(context, barnRepo, barn),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddBarnDialog(context, barnRepo),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddBarnDialog(BuildContext context, BarnRepository barnRepo) {
    final nameController = TextEditingController();
    final notesController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Add Barn'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              autofocus: true,
              decoration: const InputDecoration(labelText: 'Barn Name'),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: notesController,
              decoration: const InputDecoration(labelText: 'Notes'),
              minLines: 1,
              maxLines: 4,
            ),
          ],
        ),
        actions: [
          const TextButton(
            onPressed: null, // Disabled
            child: Text('Delete'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final name = nameController.text.trim();
              final notes = notesController.text.trim();
              if (name.isNotEmpty) {
                barnRepo.addBarn(BarnsCompanion(
                  name: drift.Value(name),
                  notes: drift.Value(notes.isNotEmpty ? notes : null),
                ));
                Navigator.pop(context);
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showEditBarnDialog(BuildContext context, BarnRepository barnRepo, Barn barn) {
    final nameController = TextEditingController(text: barn.name ?? '');
    final notesController = TextEditingController(text: barn.notes ?? '');

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Edit Barn'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              autofocus: true,
              decoration: const InputDecoration(labelText: 'Barn Name'),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: notesController,
              decoration: const InputDecoration(labelText: 'Notes'),
              minLines: 1,
              maxLines: 4,
            ),
          ],
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            onPressed: () async {
              final confirm = await showDialog<bool>(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Delete Barn'),
                  content: Text('Delete "${barn.name}"? This cannot be undone.'),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: const Text('Cancel')),
                    ElevatedButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: const Text('Delete')),
                  ],
                ),
              );
              if (confirm == true) {
                await barnRepo.deleteBarn(barn.id);
                Navigator.pop(context); // close edit dialog
              }
            },
            child: const Text('Delete'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final newName = nameController.text.trim();
              final newNotes = notesController.text.trim();
              if ((newName.isNotEmpty && newName != (barn.name ?? '')) || newNotes != (barn.notes ?? '')) {
                barnRepo.updateBarn(barn.copyWith(
                  name: drift.Value(newName.isNotEmpty ? newName : barn.name),
                  notes: drift.Value(newNotes.isNotEmpty ? newNotes : null),
                ));
              }
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
