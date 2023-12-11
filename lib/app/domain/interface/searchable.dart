import 'package:simpsons_character_viewer/app/domain/interface/accessor.dart';

/// An abstract class defining the interface for searchable entities.
///
/// The [Searchable] class provides a contract for objects that can be searched using a specified term.
/// Implementations of this class should define the search logic based on the provided [Accessor] and search [term].
abstract class Searchable {
  /// Performs a search operation on an object using the specified [Accessor] and search [term].
  ///
  /// Returns `true` if the object matches the search criteria, otherwise returns `false`.
  bool search(Accessor accessor, String term);
}