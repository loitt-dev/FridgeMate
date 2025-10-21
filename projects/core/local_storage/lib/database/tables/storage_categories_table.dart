import 'package:drift/drift.dart';

class StorageCategoriesTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get icon => text()();
  TextColumn get description => text().nullable()();
  TextColumn get color => text().nullable()();
  IntColumn get sortOrder => integer().nullable()();
  
  @override
  Set<Column> get primaryKey => {id};
}
