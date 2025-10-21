import 'package:dio/dio.dart';

class StorageRemoteDataSource {
  final Dio _dio;

  StorageRemoteDataSource(this._dio);

  // For Phase 1, all methods return empty data
  Future<List<Map<String, dynamic>>> getItems() async {
    return [];
  }

  Future<Map<String, dynamic>> addItem(Map<String, dynamic> item) async {
    return item;
  }

  Future<Map<String, dynamic>> updateItem(Map<String, dynamic> item) async {
    return item;
  }

  Future<void> deleteItem(String itemId) async {
    // Do nothing for Phase 1
  }
}
