// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_fact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatFact _$CatFactFromJson(Map<String, dynamic> json) => CatFact(
      text: json['text'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$CatFactToJson(CatFact instance) => <String, dynamic>{
      'text': instance.text,
      'createdAt': instance.createdAt.toIso8601String(),
    };
