/// An exception that is thrown when there was an error fetching a cat fact.
class CatFactException implements Exception {
  /// Creates a new exception with the given error message.
  CatFactException(this.message);

  /// A message describing the error.
  final String message;

  /// Returns a string representation of this exception.
  @override
  String toString() {
    return 'CatFactException: $message';
  }
}
