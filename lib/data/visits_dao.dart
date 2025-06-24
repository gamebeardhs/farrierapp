import 'package:drift/drift.dart';
import 'database.dart';
import 'models/visit.dart';

part 'visits_dao.g.dart';

@DriftAccessor(tables: [Visits])
class VisitsDao extends DatabaseAccessor<AppDatabase> with _$VisitsDaoMixin {
  VisitsDao(super.db);

  Future<List<Visit>> getAllVisits() => select(db.visits).get();
  Stream<List<Visit>> watchAllVisits() => select(db.visits).watch();

  Future<List<Visit>> getVisitsForHorse(int horseId) =>
      (select(db.visits)..where((v) => v.horseId.equals(horseId))).get();

  Stream<List<Visit>> watchVisitsForHorse(int horseId) =>
      (select(db.visits)..where((v) => v.horseId.equals(horseId))).watch();

  Future<int> insertVisit(VisitsCompanion visit) => into(db.visits).insert(visit);

  // Field-level update, robust for dialog editing
  Future<int> updateVisit(Visit visit) {
    return (update(db.visits)..where((tbl) => tbl.id.equals(visit.id))).write(
      VisitsCompanion(
        date: Value(visit.date),
        type: Value(visit.type),
        notes: Value(visit.notes),
      ),
    );
  }

  // Delete visit by ID
  Future<int> deleteVisit(int id) =>
      (delete(db.visits)..where((v) => v.id.equals(id))).go();
}

// This code defines a VisitsDao class that provides methods to interact with the Visits table in the database.
// It includes methods to get all visits, watch visits for a specific horse, insert, update, and delete visits.
// The VisitsDao class extends DatabaseAccessor and uses Drift's annotations to generate the necessary code for database operations.
// The `getVisitsForHorse` and `watchVisitsForHorse` methods allow querying visits for a specific horse by its ID, while the other methods provide general CRUD operations for visits.
// The `insertVisit`, `updateVisit`, and `deleteVisit` methods allow adding, modifying, and removing visits from the database, respectively.