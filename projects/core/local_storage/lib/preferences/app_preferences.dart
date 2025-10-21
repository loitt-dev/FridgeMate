import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  final SharedPreferences _prefs;
  
  AppPreferences(this._prefs);
  
  // Auth preferences
  String? get authToken => _prefs.getString('auth_token');
  Future<void> setAuthToken(String token) => _prefs.setString('auth_token', token);
  Future<void> removeAuthToken() => _prefs.remove('auth_token');
  
  String? get refreshToken => _prefs.getString('refresh_token');
  Future<void> setRefreshToken(String token) => _prefs.setString('refresh_token', token);
  Future<void> removeRefreshToken() => _prefs.remove('refresh_token');
  
  String? get userId => _prefs.getString('user_id');
  Future<void> setUserId(String id) => _prefs.setString('user_id', id);
  Future<void> removeUserId() => _prefs.remove('user_id');
  
  // App preferences
  String get language => _prefs.getString('language') ?? 'en';
  Future<void> setLanguage(String language) => _prefs.setString('language', language);
  
  String get theme => _prefs.getString('theme') ?? 'light';
  Future<void> setTheme(String theme) => _prefs.setString('theme', theme);
  
  bool get notificationsEnabled => _prefs.getBool('notifications_enabled') ?? true;
  Future<void> setNotificationsEnabled(bool enabled) => _prefs.setBool('notifications_enabled', enabled);
  
  int get expiryWarningDays => _prefs.getInt('expiry_warning_days') ?? 3;
  Future<void> setExpiryWarningDays(int days) => _prefs.setInt('expiry_warning_days', days);
  
  bool get autoSyncEnabled => _prefs.getBool('auto_sync_enabled') ?? true;
  Future<void> setAutoSyncEnabled(bool enabled) => _prefs.setBool('auto_sync_enabled', enabled);
  
  // Clear all preferences
  Future<void> clearAll() => _prefs.clear();
}
