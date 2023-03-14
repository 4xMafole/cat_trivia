/// An exception that is thrown when there was an error fetching a cat image.
class CatImageException implements Exception {
  /// Creates a new exception with the given error message.
  CatImageException(this.message);

  /// A message describing the error.
  final String message;

  /// Returns a string representation of this exception.
  @override
  String toString() {
    return 'CatImageException: $message';
  }
}
