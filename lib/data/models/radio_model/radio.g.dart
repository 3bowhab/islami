// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radio.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RadioItem _$RadioFromJson(Map<String, dynamic> json) => RadioItem(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  url: json['url'] as String?,
  recentDate: json['recent_date'] as String?,
);

Map<String, dynamic> _$RadioToJson(RadioItem instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'url': instance.url,
  'recent_date': instance.recentDate,
};
