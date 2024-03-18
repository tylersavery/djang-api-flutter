import 'package:shared_preferences/shared_preferences.dart';

enum StorageKey {
  authAccess("AUTH_ACCESS"),
  authRefresh("AUTH_REFRESH"),
  ;

  final String name;
  const StorageKey(this.name);
}

class StorageProvider {
  late final SharedPreferences _db;

  StorageProvider._();

  static final _uniqueInstance = StorageProvider._();
  factory StorageProvider() => _uniqueInstance;

  init() async {
    _db = await SharedPreferences.getInstance();
  }

  String _buildKey(StorageKey key) => "develop_${key.name}";

  String? getString(StorageKey key) => _db.getString(_buildKey(key));
  Future<void> setString(StorageKey key, String value) async => _db.setString(_buildKey(key), value);

  Future<void> remove(StorageKey key) async => _db.remove(_buildKey(key));
}
