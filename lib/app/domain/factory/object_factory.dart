/// An abstract class defining a generic object factory.
///
/// The [ObjectFactory] allows creating instances of a generic type [T] with optional arguments.
abstract class ObjectFactory<T> {
  /// Creates and returns an instance of type [T] with optional arguments.
  ///
  /// The optional [args] parameter provides a dynamic map of additional arguments that can be used during object creation.
  /// Implementations of this method should handle the creation and initialization of the object.
  T create({dynamic args = const {}});
}
