import 'package:drift/drift.dart';

class OwnerBarns extends Table {
  IntColumn get ownerId => integer()
    .customConstraint('NOT NULL REFERENCES owners(id) ON DELETE CASCADE')();
  IntColumn get barnId => integer()
    .customConstraint('NOT NULL REFERENCES barns(id) ON DELETE CASCADE')();
  @override
  Set<Column> get primaryKey => {ownerId, barnId};
}

// The `OwnerBarns` table represents the many-to-many relationship between owners and barns.
// It contains two columns: `ownerId` and `barnId`, both of which are integers.
// The `ownerId` column references the ID of an owner, while the `barnId  column references the ID of a barn.
// The primary key for this table is a composite key consisting of both `ownerId` and `barnId`, ensuring that each combination of owner and barn is unique.
// This table can be used to associate owners with multiple barns and vice versa, allowing for efficient querying of which owners own which barns and which barns are owned by which owners.