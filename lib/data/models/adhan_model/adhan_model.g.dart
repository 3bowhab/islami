// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adhan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdhanModel _$AdhanModelFromJson(Map<String, dynamic> json) => AdhanModel(
  code: (json['code'] as num?)?.toInt(),
  status: json['status'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AdhanModelToJson(AdhanModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'data': instance.data,
    };
