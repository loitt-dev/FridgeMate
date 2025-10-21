import 'package:local_storage/database/app_database.dart';

class StorageLocalDataSource {
  final AppDatabase _database;

  StorageLocalDataSource(this._database);

  // For Phase 1, all methods return empty data
  Future<List<Map<String, dynamic>>> getItems({
    String? categoryId,
    bool onlyExpiring = false,
  }) async {
    return [];
  }

  Future<Map<String, dynamic>?> getItemById(String id) async {
    return null;
  }

  Future<Map<String, dynamic>> addItem(Map<String, dynamic> item) async {
    return item;
  }

  Future<Map<String, dynamic>> updateItem(Map<String, dynamic> item) async {
    return item;
  }

  Future<void> deleteItem(String id) async {
    // Do nothing for Phase 1
  }

  Future<List<Map<String, dynamic>>> getExpiringItems(int days) async {
    return [];
  }

  Future<List<Map<String, dynamic>>> searchItems(String query) async {
    return [];
  }

  Future<void> saveItems(List<Map<String, dynamic>> items) async {
    // Do nothing for Phase 1
  }
}
