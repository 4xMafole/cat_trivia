import 'package:cat_fact_client/cat_fact_client.dart';
import 'package:cat_fact_repository/src/exceptions/exceptions.dart';
import 'package:cat_image_client/cat_image_client.dart';

/// An abstract repository that provides access to cat facts and images.
// ignore: one_member_abstracts
abstract class CatFactRepository {
  /// Returns a random cat fact.
  ///
  /// Throws a [CatFactException] if there was an error fetching the cat fact.
  Future<CatFact> getRandomFact();

  /// Returns a next cat fact.
  ///
  /// Throws a [CatFactException] if there was an error fetching the cat fact.
  Future<CatFact> getNextFact();

  /// Returns a cat image.
  ///
  /// Throws a [CatImageException] if there was an error fetching the cat image.
  Future<CatImage> getRandomImage();

  /// Returns a cat fact history.
  ///
  /// Throws a [CatFactException] if there was an error fetching the cat fact
  ///  from local storage.
  Future<List<CatFact>> getFactHistory();
}
