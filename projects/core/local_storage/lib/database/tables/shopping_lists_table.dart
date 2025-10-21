import 'package:drift/drift.dart';

class ShoppingListsTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get items => text()(); // JSON string
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get completedAt => dateTime().nullable()();
  TextColumn get userId => text().nullable()();
  
  @override
  Set<Column> get primaryKey => {id};
}
