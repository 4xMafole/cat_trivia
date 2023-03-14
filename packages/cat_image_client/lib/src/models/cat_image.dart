// ignore: depend_on_referenced_packages
// ignore_for_file: public_member_api_docs

import 'package:json_annotation/json_annotation.dart';

part 'cat_image.g.dart';

@JsonSerializable()
class CatImage {
  const CatImage({required this.url});

  factory CatImage.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$CatImageFromJson(json);
  final String url;
}
