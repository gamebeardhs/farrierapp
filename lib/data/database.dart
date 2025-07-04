import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'models/barn.dart';
import 'models/owner.dart';
import 'models/owner_barn.dart';
import 'models/horse.dart';
import 'models/visit.dart';

import 'barn_dao.dart';
import 'owner_dao.dart';
import 'visits_dao.dart';

part 'database.g.dart';

// ---- USE THIS FUNCTION TO OPEN DB IN A MOBILE-SAFE LOCATION ----
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // Get the app's document directory on Android/iOS (also works on desktop)
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'farrier_log.sqlite'));
    return NativeDatabase(file, logStatements: true);
  });
}

@DriftDatabase(
  tables: [Barns, Owners, OwnerBarns, Horses, Visits],
  daos: [BarnDao, OwnerDao, VisitsDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

// The `AppDatabase` class extends `_$AppDatabase`, which is generated by Drift.
// It initializes the database with a file named `farrier_log.sqlite` in the current directory.
// and sets `logStatements` to true for debugging purposes.
// The `schemaVersion` is set to 1, indicating the current version of the database schema.
// The `@DriftDatabase` annotation specifies the tables and DAOs used in the database.
// The `tables` list includes `Barns`, `Owners`, `OwnerBarns`, `Horses`, and `Visits`,
// while the `daos` list includes `BarnDao`, `OwnerDao`, and `VisitsDao`.