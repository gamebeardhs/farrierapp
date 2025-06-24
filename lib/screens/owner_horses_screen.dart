import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/database.dart';
import '../data/repository.dart';

class OwnerHorsesScreen extends StatelessWidget {
  final Owner owner;
  const OwnerHorsesScreen({super.key, required this.owner});

  @override
  Widget build(BuildContext context) {
    final horseRepo = context.read<HorseRepository>();

    return Scaffold(
      appBar: AppBar(title: Text('${owner.name}\'s Horses')),
      body: FutureBuilder<List<Horse>>(
        future: horseRepo.getHorsesForOwner(owner.id), // See repo note below!
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final horses = snapshot.data!;
          if (horses.isEmpty) {
            return const Center(child: Text('No horses for this owner.'));
          }
          return ListView.builder(
            itemCount: horses.length,
            itemBuilder: (context, index) {
              final horse = horses[index];
              return ListTile(
                title: Text(horse.name),
                subtitle: horse.notes != null ? Text(horse.notes!) : null,
                // Optionally add onTap for edit/view visits, etc.
              );
            },
          );
        },
      ),
    );
  }
}
// Note: Ensure that your HorseRepository has a method getHorsesForOwner(int ownerId) that fetches horses for a specific owner.
// This method should return a Future<List<Horse>>.