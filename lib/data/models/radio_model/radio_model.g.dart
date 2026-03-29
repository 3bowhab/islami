// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radio_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RadioModel _$RadioModelFromJson(Map<String, dynamic> json) => RadioModel(
  radios: (json['radios'] as List<dynamic>?)
      ?.map((e) => RadioItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$RadioModelToJson(RadioModel instance) =>
    <String, dynamic>{'radios': instance.radios};
