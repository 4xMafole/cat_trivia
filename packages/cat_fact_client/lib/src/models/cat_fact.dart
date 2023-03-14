// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'cat_fact.g.dart';

@JsonSerializable()

/// Represents a cat fact.
class CatFact {
  /// Creates a new cat fact with the given text and creation date.
  CatFact({required this.text, required this.createdAt});

  /// Creates a new cat fact from a JSON map.
  factory CatFact.fromJson(Map<String, dynamic> json) =>
      _$CatFactFromJson(json);

  /// The text of the cat fact.
  final String text;

  /// The creation date of the cat fact.
  final DateTime createdAt;

  /// Converts this cat fact to a JSON map.
  Map<String, dynamic> toJson() => _$CatFactToJson(this);
}
