import 'package:drift/drift.dart';

class Visits extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get horseId => integer()
    .customConstraint('NOT NULL REFERENCES horses(id) ON DELETE CASCADE')();
  DateTimeColumn get date => dateTime()();
  TextColumn get type => text()();
  TextColumn get notes => text().nullable()();
}

// The `Visits` table represents visits for horses, with fields for the horse ID, visit date, type of visit, and notes.
// The `id` field is an auto-incrementing integer that serves as the primary key for each visit.
// The `horseId` field is an integer that references the ID of the horse associated with the visit.
// The `date` field is a date-time column that stores the date of the visit.
// The `type` field is a text column that cannot be null, representing the type of visit (e.g., 'trim', 'shoe').
// The `notes` field is a text column that can be null, allowing for visits without specified notes.