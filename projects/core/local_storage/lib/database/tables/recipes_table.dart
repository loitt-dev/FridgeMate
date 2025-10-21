import 'package:drift/drift.dart';

class RecipesTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  TextColumn get ingredients => text()(); // JSON string
  TextColumn get steps => text()(); // JSON string
  IntColumn get prepTime => integer()();
  IntColumn get cookTime => integer()();
  IntColumn get servings => integer()();
  TextColumn get categoryId => text()();
  TextColumn get imageUrl => text().nullable()();
  RealColumn get rating => real().nullable()();
  IntColumn get reviewCount => integer().nullable()();
  TextColumn get authorId => text().nullable()();
  DateTimeColumn get createdAt => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime().nullable()();
  
  @override
  Set<Column> get primaryKey => {id};
}
