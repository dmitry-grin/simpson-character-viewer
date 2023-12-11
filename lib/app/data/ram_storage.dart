abstract class RamStorage {
  void put(String key, dynamic data);

  T? take<T>(String key);

  bool contains(String key);
}

