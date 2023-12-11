/// An abstract class defining an in-memory storage interface.
abstract class RamStorage {
  /// Stores the provided [data] with the specified [key] in memory.
  ///
  /// The [key] is used as a unique identifier for the stored data.
  /// The [data] can be of any type.
  void put(String key, dynamic data);

  /// Retrieves and returns the data associated with the specified [key] from memory.
  ///
  /// The type of data returned is specified by the generic type parameter [T].
  /// Returns `null` if the [key] is not found in memory.
  T? take<T>(String key);

  /// Checks if the specified [key] exists in memory.
  ///
  /// Returns `true` if the [key] is found, otherwise returns `false`.
  bool contains(String key);
}


