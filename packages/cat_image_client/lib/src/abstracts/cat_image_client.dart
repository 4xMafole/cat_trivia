import 'package:cat_image_client/src/models/models.dart';
// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'cat_image_client.g.dart';

///{@template cat_image_api}
/// A Retrofit REST client for the Cat API image service.
/// {@endtemplate}
@RestApi(baseUrl: 'https://cataas.com')
abstract class CatImageClient {
  ///{@macro cat_image_api}
  factory CatImageClient(Dio dio, {String baseUrl}) = _CatImageClient;

  /// Retrieves a random cat image from the Cat API.
  @GET('/cat')
  Future<CatImage> getCatImage();
}
