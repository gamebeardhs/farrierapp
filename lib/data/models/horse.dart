import 'package:drift/drift.dart';

class Horses extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get ownerId => integer().nullable()
      .customConstraint('NULL REFERENCES owners(id) ON DELETE SET NULL')();
  IntColumn get barnId => integer().nullable()
      .customConstraint('NULL REFERENCES barns(id) ON DELETE SET NULL')();
  TextColumn get name => text()();
  TextColumn get notes => text().nullable()();
  TextColumn get photoPath => text().nullable()();
  IntColumn get reminderIntervalWeeks => integer().withDefault(const Constant(4))();
  DateTimeColumn get lastServicedDate => dateTime().nullable()();
}

// The `Horses` table represents horses with fields for their owner, barn, name, notes, photo path, reminder interval, and last serviced date.
// The `id` field is an auto-incrementing integer that serves as the primary key for each horse.
// The `ownerId` field is an integer that references the ID of the owner of the horse.
// The `barnId` field is an integer that can be null, allowing for horses that are not associated with a barn.
// The `name` field is a text column that cannot be null, ensuring every horse has a name.
// The `notes` field is a text column that can be null, allowing for horses without specified notes.
// The `photoPath` field is a text column that can be null, allowing for horses without a specified photo path.
// The `reminderIntervalWeeks` field is an integer that defaults to 4, representing the number of weeks between reminders for servicing the horse.
// The `lastServicedDate` field is a date-time column that can be null, allowing for horses that have not been serviced yet.