import 'package:drift/drift.dart';
import 'database.dart';
import 'models/barn.dart';
part 'barn_dao.g.dart';

@DriftAccessor(tables: [Barns])
class BarnDao extends DatabaseAccessor<AppDatabase> with _$BarnDaoMixin {
  BarnDao(super.db);

  Future<List<Barn>> getAllBarns() => select(db.barns).get();
  Stream<List<Barn>> watchAllBarns() => select(db.barns).watch();
  Future<int> insertBarn(BarnsCompanion barn) => into(db.barns).insert(barn);
  Future updateBarn(Barn barn) => update(db.barns).replace(barn);
  Future deleteBarn(int id) => (delete(db.barns)..where((b) => b.id.equals(id))).go();
}
