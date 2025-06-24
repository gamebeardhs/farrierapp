import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../data/database.dart';
import '../data/visits_dao.dart';
import 'edit_visits_dialog.dart';

class VisitListScreen extends StatelessWidget {
  final int horseId;
  final String? horseName;

  const VisitListScreen({super.key, required this.horseId, this.horseName});

  @override
  Widget build(BuildContext context) {
    final visitsDao = context.read<VisitsDao>();
    return Scaffold(
      appBar: AppBar(
        title: Text(horseName == null ? 'Visits' : 'Visits for $horseName'),
      ),
      body: StreamBuilder<List<Visit>>(
        stream: visitsDao.watchVisitsForHorse(horseId),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final visits = snapshot.data!;
          if (visits.isEmpty) {
            return const Center(child: Text('No visits yet.'));
          }
          return ListView.builder(
            itemCount: visits.length,
            itemBuilder: (context, idx) {
              final visit = visits[idx];
return ListTile(
  leading: const Icon(Icons.event_note),
  title: Text(visit.type),
  subtitle: Text(
    '${DateFormat.yMd().add_Hm().format(visit.date)}'
    '${visit.notes != null && visit.notes!.isNotEmpty ? "\nNotes: ${visit.notes}" : ""}',
  ),
  trailing: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      IconButton(
        icon: const Icon(Icons.edit),
        onPressed: () async {
          final result = await showDialog(
            context: context,
            builder: (_) => EditVisitDialog(visit: visit, visitsDao: visitsDao),
          );
          // Optionally, you can refresh or setState if needed.
        },
      ),
      IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () async {
          final confirmed = await showDialog<bool>(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Delete Visit'),
              content: const Text('Are you sure you want to delete this visit?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text('Delete', style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
          );
          if (confirmed == true) {
            await visitsDao.deleteVisit(visit.id);
          }
        },
      ),
    ],
  ),
);
            },
          );
        },
      ),
    );
  }
}