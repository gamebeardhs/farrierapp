import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/database.dart';
import '../data/repository.dart';

class BarnHorsesScreen extends StatelessWidget {
  final Barn barn;
  const BarnHorsesScreen({super.key, required this.barn});

  @override
  Widget build(BuildContext context) {
    final horseRepo = context.read<HorseRepository>();

    return Scaffold(
      appBar: AppBar(title: Text('${barn.name}\'s Horses')),
      body: FutureBuilder<List<Horse>>(
        future: horseRepo.getHorsesForBarn(barn.id),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final horses = snapshot.data!;
          if (horses.isEmpty) {
            return const Center(child: Text('No horses for this barn.'));
          }
          return ListView.builder(
            itemCount: horses.length,
            itemBuilder: (context, index) {
              final horse = horses[index];
              return ListTile(
                title: Text(horse.name),
                subtitle: horse.notes != null ? Text(horse.notes!) : null,
                // Optionally: add onTap for edit, view visits, etc.
              );
            },
          );
        },
      ),
    );
  }
}
// Note: Ensure that your HorseRepository has a method getHorsesForBarn(int barnId) that fetches horses for a specific barn.
// This method should return a Future<List<Horse>>.