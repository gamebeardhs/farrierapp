import 'package:flutter/foundation.dart';
import 'database.dart';
import 'package:drift/drift.dart'; // Import for Value constructor

class HorseRepository extends ChangeNotifier {
  final AppDatabase db;
  HorseRepository(this.db);

  // Stream for real-time updates (listening in Provider)
  Stream<List<Horse>> watchAllHorses() => db.select(db.horses).watch();

  // Fetch once
  Future<List<Horse>> getAllHorses() => db.select(db.horses).get();

  // Insert
  Future<int> addHorse(HorsesCompanion horse) async {
    final id = await db.into(db.horses).insert(horse);
    notifyListeners();
    return id;
  }

  // Update
  Future<bool> updateHorse(Horse horse) async {
    final updated = await db.update(db.horses).replace(horse);
    notifyListeners();
    return updated;
  }

  // Delete
  Future<int> deleteHorse(int id) async {
    final deleted = await (db.delete(db.horses)..where((t) => t.id.equals(id))).go();
    notifyListeners();
    return deleted;
  }

  Future<List<Horse>> getHorsesForOwner(int ownerId) {
  final query = db.select(db.horses)..where((tbl) => tbl.ownerId.equals(ownerId));
  return query.get();
}

  Future<List<Horse>> getHorsesForBarn(int barnId) {
    final query = db.select(db.horses)..where((tbl) => tbl.barnId.equals(barnId));
    return query.get();
  }
}
// This repository class provides methods to interact with the Horses table in the database.
// It allows for adding, updating, deleting, and fetching horses, and notifies listeners of changes.
// The `watchAllHorses` method provides a stream for real-time updates, which is useful for UI updates in a Flutter application.
// The `getAllHorses` method fetches all horses once, while the `addHorse`, `updateHorse`, and `deleteHorse` methods perform their respective operations and notify listeners of changes to update the UI accordingly.
class BarnRepository extends ChangeNotifier {
  final AppDatabase db;
  BarnRepository(this.db);

  Stream<List<Barn>> watchAllBarns() => db.select(db.barns).watch();

  Future<List<Barn>> getAllBarns() => db.select(db.barns).get();

  Future<int> addBarn(BarnsCompanion barn) async {
    final id = await db.into(db.barns).insert(barn);
    notifyListeners();
    return id;
  }

  Future<bool> updateBarn(Barn barn) async {
    final updated = await db.update(db.barns).replace(barn);
    notifyListeners();
    return updated;
  }

  Future<int> deleteBarn(int id) async {
    final deleted = await (db.delete(db.barns)..where((t) => t.id.equals(id))).go();
    notifyListeners();
    return deleted;
  }
}
// This repository class provides methods to interact with the Barns table in the database.
// It allows for adding, updating, deleting, and fetching barns, and notifies listeners of changes.
// The `watchAllBarns` method provides a stream for real-time updates, which is useful for UI updates in a Flutter application.
// The `getAllBarns` method fetches all barns once, while the `add  Barn`, `updateBarn`, and `deleteBarn` methods perform their respective operations and notify listeners of changes to update the UI accordingly.

class OwnerRepository extends ChangeNotifier {
  final AppDatabase db;
  OwnerRepository(this.db);

  Stream<List<Owner>> watchAllOwners() => db.select(db.owners).watch();

  Future<List<Owner>> getAllOwners() => db.select(db.owners).get();

  Future<int> addOwner(OwnersCompanion owner) async {
    final id = await db.into(db.owners).insert(owner);
    notifyListeners();
    return id;
  }

  Future<bool> updateOwner(Owner owner) async {
    final updated = await db.update(db.owners).replace(owner);
    notifyListeners();
    return updated;
  }

  Future<int> deleteOwner(int id) async {
    final deleted = await (db.delete(db.owners)..where((t) => t.id.equals(id))).go();
    notifyListeners();
    return deleted;
  }
}
// This repository class provides methods to interact with the Owners table in the database.
// It allows for adding, updating, deleting, and fetching owners, and notifies listeners of changes.
// The `watchAllOwners` method provides a stream for real-time updates, which is useful for UI updates in a Flutter application.
// The `getAllOwners` method fetches all owners once, while the `addOwner `, `updateOwner`, and `deleteOwner` methods perform their respective operations and notify listeners of changes to update the UI accordingly.

class VisitRepository extends ChangeNotifier {
  final AppDatabase db;
  VisitRepository(this.db);

  Stream<List<Visit>> watchVisitsForHorse(int horseId) =>
      (db.select(db.visits)..where((v) => v.horseId.equals(horseId))).watch();

  Future<List<Visit>> getVisitsForHorse(int horseId) =>
      (db.select(db.visits)..where((v) => v.horseId.equals(horseId))).get();

  Future<int> addVisit(VisitsCompanion visit) async {
    final id = await db.into(db.visits).insert(visit);
    notifyListeners();
    return id;
  }

  Future<bool> updateVisit(Visit visit) async {
    final updated = await db.update(db.visits).replace(visit);
    notifyListeners();
    return updated;
  }

  Future<int> deleteVisit(int id) async {
    final deleted = await (db.delete(db.visits)..where((v) => v.id.equals(id))).go();
    notifyListeners();
    return deleted;
  }
}
// This repository class provides methods to interact with the Visits table in the database.
// It allows for adding, updating, deleting, and fetching visits for a specific horse, and notifies listeners of changes.
// The `watchVisitsForHorse` method provides a stream for real-time updates of visits for a specific horse, which is useful for UI updates in a Flutter application.
// The `getVisitsForHorse` method fetches all visits for a specific horse once, while the `addVisit`, `updateVisit`, and `deleteVisit` methods perform their respective operations and notify listeners of changes to update the UI accordingly.

class OwnerBarnRepository extends ChangeNotifier {
  final AppDatabase db;
  OwnerBarnRepository(this.db);

  Future<void> addOwnerToBarn(int ownerId, int barnId) async {
    await db.into(db.ownerBarns).insert(
          OwnerBarnsCompanion(
            ownerId: Value(ownerId),
            barnId: Value(barnId),
          ),
        );
    notifyListeners();
  }

  Future<void> removeOwnerFromBarn(int ownerId, int barnId) async {
    await (db.delete(db.ownerBarns)
          ..where((ob) =>
              Expression.and([ob.ownerId.equals(ownerId), ob.barnId.equals(barnId)])))
        .go();
    notifyListeners();
  }

  Future<List<OwnerBarn>> getOwnersForBarn(int barnId) =>
      (db.select(db.ownerBarns)..where((ob) => ob.barnId.equals(barnId))).get();

  Future<List<OwnerBarn>> getBarnsForOwner(int ownerId) =>
      (db.select(db.ownerBarns)..where((ob) => ob.ownerId.equals(ownerId))).get();
}
// This repository class provides methods to manage the many-to-many relationship between owners and barns.
// It allows for adding and removing owners from barns, and fetching owners for a specific barn or barns for a specific owner.
// The `addOwnerToBarn` method adds an association between an owner and a barn, while the `removeOwnerFromBarn` method removes that association.
// The `getOwnersForBarn` method fetches all owners associated with a specific barn, and the `getBarnsForOwner` method fetches all barns associated with a specific owner.
