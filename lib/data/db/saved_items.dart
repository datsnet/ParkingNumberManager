import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'saved_items.g.dart';

class SavedItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get numberText => text()();
  TextColumn get location => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

@DriftDatabase(tables: [SavedItems])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'app_database');
  }
}
