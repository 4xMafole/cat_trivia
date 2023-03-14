import 'package:cat_fact_client/cat_fact_client.dart';
import 'package:cat_fact_repository/src/abstracts/abstracts.dart';
import 'package:cat_fact_repository/src/exceptions/exceptions.dart';
import 'package:cat_image_client/cat_image_client.dart';
import 'package:local_storage/local_storage.dart';

/// An implementation of [CatFactRepository] that retrieves cat facts from
/// a remote service and caches them locally.
class CatFactRepositoryImpl implements CatFactRepository {
  /// Creates a new [CatFactRepositoryImpl] with the given [CatFactClient],
  /// [CatImageClient]
  /// and [LocalStorage].
  CatFactRepositoryImpl({
    required CatFactClient catFactClient,
    required CatImageClient catImageClient,
    required LocalStorage storage,
  })  : _catFactClient = catFactClient,
        _catImageClient = catImageClient,
        _storage = storage;

  /// The remote service to retrieve cat facts from.
  final CatFactClient _catFactClient;

  /// The remote service to retrieve cat image from.
  final CatImageClient _catImageClient;

  /// The local storage to cache cat facts in.
  final LocalStorage _storage;

  @override
  Future<List<CatFact>> getFactHistory() async {
    try {
      return _storage.getData() as Future<List<CatFact>>;
    } catch (e) {
      throw CatFactException(e.toString());
    }
  }

  @override
  Future<CatFact> getNextFact() async {
    try {
      final history = await getFactHistory();
      if (history.isNotEmpty) {
        return history.first;
      } else {
        return getRandomFact();
      }
    } catch (e) {
      throw CatFactException(e.toString());
    }
  }

  @override
  Future<CatFact> getRandomFact() async {
    try {
      return _catFactClient.getRandomCatFact();
    } catch (e) {
      throw CatFactException(e.toString());
    }
  }

  @override
  Future<CatImage> getRandomImage() async {
    try {
      return _catImageClient.getCatImage();
    } catch (e) {
      print(e);
      throw CatImageException(e.toString());
    }
  }
}
