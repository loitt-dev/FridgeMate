import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

class AppDatabase {
  AppDatabase();

  int get schemaVersion => 1;

  // For Phase 1, return a simple database connection
  static Future<DatabaseConnection> getConnection() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'fridgemate.db'));
    return DatabaseConnection(NativeDatabase(file));
  }
}
