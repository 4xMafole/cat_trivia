
import 'package:cat_fact_client/src/models/models.dart';
// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'cat_fact_client.g.dart';

/// {@template cat_fact_client}
/// A Retrofit REST client for the Cat API fact service.
/// {@endtemplate}
@RestApi(baseUrl: 'https://cat-fact.herokuapp.com')
abstract class CatFactClient {
  ///{@macro cat_fact_client}
  factory CatFactClient(Dio dio, {String baseUrl}) =
      _CatFactClient;

  /// Retrieves a random cat image from the Cat API.
 @GET('/facts/random')
  Future<CatFact> getRandomCatFact();
}
