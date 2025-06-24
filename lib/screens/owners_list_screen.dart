import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' hide Column;
import '../data/repository.dart';
import '../data/database.dart';
import 'owner_horses_screen.dart';

class OwnerListScreen extends StatelessWidget {
  const OwnerListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ownerRepo = context.watch<OwnerRepository>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Owners'),
      ),
      body: StreamBuilder<List<Owner>>(
        stream: ownerRepo.watchAllOwners(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
          final owners = snapshot.data!;
          if (owners.isEmpty) return const Center(child: Text('No owners found.'));
          return ListView.builder(
            itemCount: owners.length,
            itemBuilder: (context, idx) {
              final owner = owners[idx];
              return ListTile(
                title: Text(owner.name),
                subtitle: owner.notes != null && owner.notes!.isNotEmpty
                    ? Text(owner.notes!, maxLines: 1, overflow: TextOverflow.ellipsis)
                    : null,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => OwnerHorsesScreen(owner: owner),
                    ),
                  );
                },
                trailing: IconButton(
                  icon: const Icon(Icons.edit),
                  tooltip: 'Edit Owner',
                  onPressed: () => _showEditOwnerDialog(context, ownerRepo, owner),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddOwnerDialog(context, ownerRepo),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddOwnerDialog(BuildContext context, OwnerRepository ownerRepo) {
    final nameController = TextEditingController();
    final notesController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Add Owner'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              autofocus: true,
              decoration: const InputDecoration(labelText: 'Owner Name'),
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
                ownerRepo.addOwner(OwnersCompanion(
                  name: Value(name),
                  notes: Value(notes.isNotEmpty ? notes : null),
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

  void _showEditOwnerDialog(BuildContext context, OwnerRepository ownerRepo, Owner owner) {
    final nameController = TextEditingController(text: owner.name);
    final notesController = TextEditingController(text: owner.notes ?? '');

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Edit Owner'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              autofocus: true,
              decoration: const InputDecoration(labelText: 'Owner Name'),
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
                  title: const Text('Delete Owner'),
                  content: Text('Delete "${owner.name}"? This cannot be undone.'),
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
                await ownerRepo.deleteOwner(owner.id);
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
              if ((newName.isNotEmpty && newName != owner.name) || newNotes != (owner.notes ?? '')) {
                ownerRepo.updateOwner(owner.copyWith(
                  name: newName.isNotEmpty ? newName : owner.name,
                  notes: Value(newNotes.isNotEmpty ? newNotes : null),
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
