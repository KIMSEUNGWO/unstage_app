import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {

  final SharedPreferences _storage;

  static late LocalStorage instance;
  LocalStorage._(this._storage);

  static Future<LocalStorage> initInstance() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    instance = LocalStorage._(sharedPreferences);
    return instance;
  }

  saveFavorites(Set<int> favoriteIds) async {
    await _storage.setStringList(LocalStorageKey.FAVORITE.name, favoriteIds.map((x) => x.toString()).toList());
  }

  Future<Set<int>> readFavorites() async {
    return _storage.getStringList(LocalStorageKey.FAVORITE.name)?.map((x) => int.parse(x)).toSet() ?? {};
  }


}

enum LocalStorageKey {

  FAVORITE

}