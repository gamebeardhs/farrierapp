import 'package:drift/drift.dart';

class Barns extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get ownerId => integer().nullable()
      .customConstraint('NULL REFERENCES owners(id) ON DELETE SET NULL')();
  TextColumn get name => text().nullable()();
  TextColumn get address => text().nullable()();
  TextColumn get photoPath => text().nullable()();
  TextColumn get notes => text().nullable()();
}

// The `Barns` table represents barns with fields for their name, address, and photo path.
// The `id` field is an auto-incrementing integer that serves as the primary key for each barn.
// The `name` field is a text column that can be null, allowing for barns without a specified name.
// The `address` field is a text column that can also be null, allowing for barns without a specified address.
// The `photoPath` field is a text column that can be null, allowing for barns without a specified photo path.
// This table can be used to store information about barns in a database, such as their names, addresses, and associated photos.