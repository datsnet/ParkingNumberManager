import 'package:drift/drift.dart';
import 'package:parking_number_manager/data/db/saved_items.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class SavedNumbersRepository {
  final AppDatabase db;

  const SavedNumbersRepository(this.db);
  Future save(String numberText, String? location) {
    return db.into(db.savedItems).insert(SavedItemsCompanion.insert(
        numberText: numberText, location: Value.absentIfNull(location)));
  }

  void delete(int id) {
    db.delete(db.savedItems)
      ..delete
      ..where((saved) => saved.id.equals(id))
      ..go();
  }

  void update(int id) {
    db.update(db.savedItems).where((saved) => saved.id.equals(id));
  }

  Future<List<SavedItem>> getItems() {
    return (db.select(db.savedItems)
          ..orderBy([
            (v) =>
                OrderingTerm(expression: v.createdAt, mode: OrderingMode.desc)
          ]))
        .get();
  }
}
