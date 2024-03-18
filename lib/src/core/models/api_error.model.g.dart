// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiErrorImpl _$$ApiErrorImplFromJson(Map<String, dynamic> json) =>
    _$ApiErrorImpl(
      detail: json['detail'] as String? ?? "Unknown error",
      code: json['code'] as String? ?? "unknown",
    );

Map<String, dynamic> _$$ApiErrorImplToJson(_$ApiErrorImpl instance) =>
    <String, dynamic>{
      'detail': instance.detail,
      'code': instance.code,
    };
