import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/repository.dart';
import '../data/database.dart';
import 'package:drift/drift.dart';
import 'edit_horse_dialog.dart';
import 'visit_list_screen.dart'; // <-- Import the visits screen

class HorseListScreen extends StatelessWidget {
  const HorseListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final horseRepo = context.watch<HorseRepository>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Horses'),
      ),
      body: FutureBuilder<List<Horse>>(
        future: horseRepo.getAllHorses(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final horses = snapshot.data!;
          if (horses.isEmpty) {
            return const Center(child: Text('No horses found.'));
          }
          return ListView.builder(
            itemCount: horses.length,
            itemBuilder: (context, index) {
              final horse = horses[index];
              return ListTile(
                title: Text(horse.name),
                subtitle: horse.notes != null ? Text(horse.notes!) : null,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => EditHorseDialog(horse: horse),
                  );
                },
                trailing: IconButton(
                  icon: const Icon(Icons.event_note),
                  tooltip: 'View Visits',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => VisitListScreen(
                          horseId: horse.id,
                          horseName: horse.name,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final name = await showDialog<String>(
            context: context,
            builder: (context) {
              String? inputName;
              return AlertDialog(
                title: const Text('Add Horse'),
                content: TextField(
                  autofocus: true,
                  decoration: const InputDecoration(labelText: 'Horse Name'),
                  onChanged: (value) => inputName = value,
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (inputName != null && inputName!.trim().isNotEmpty) {
                        Navigator.pop(context, inputName!.trim());
                      }
                    },
                    child: const Text('Add'),
                  ),
                ],
              );
            },
          );
          if (name != null && name.isNotEmpty) {
            await horseRepo.addHorse(HorsesCompanion(
              name: Value(name),
              ownerId: const Value(1), // TEMP: replace with actual owner selection in the future
              reminderIntervalWeeks: const Value(4),
            ));
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
// This screen displays a list of horses, allows adding new horses, and provides options to edit existing horses or view their visits.
// The `HorseListScreen` uses a `FutureBuilder` to fetch and display horses from the repository.
// Each horse can be tapped to open an edit dialog, and a button is provided to view visits for that horse.
// The floating action button allows adding a new horse by prompting the user for a name.