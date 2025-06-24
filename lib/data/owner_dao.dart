import 'package:drift/drift.dart';
import 'database.dart';
import 'models/owner.dart';
part 'owner_dao.g.dart';

@DriftAccessor(tables: [Owners])
class OwnerDao extends DatabaseAccessor<AppDatabase> with _$OwnerDaoMixin {
  OwnerDao(super.db);

  Future<List<Owner>> getAllOwners() => select(db.owners).get();
  Stream<List<Owner>> watchAllOwners() => select(db.owners).watch();
  Future<int> insertOwner(OwnersCompanion owner) => into(db.owners).insert(owner);
  Future<bool> updateOwner(Owner owner) => update(db.owners).replace(owner);
  Future<int> deleteOwner(int id) =>
      (delete(db.owners)..where((tbl) => tbl.id.equals(id))).go();
}
