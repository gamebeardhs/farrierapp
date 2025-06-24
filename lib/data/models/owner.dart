import 'package:drift/drift.dart';

class Owners extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get phone => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get notes => text().nullable()();
}

// The `Owners` table represents the owners of barns, with fields for their name, phone number, and email address.
// The `id` field is an auto-incrementing integer that serves as the primary key  for each owner.
// The `name` field is a text column that cannot be null, ensuring every owner has a name.
// The `phone` field is a text column that can be null, allowing for owners without a specified phone number.
// The `email` field is a text column that can also be null, allowing for owners without a specified email address.