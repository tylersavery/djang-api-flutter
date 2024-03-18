// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_info.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginationInfoImpl _$$PaginationInfoImplFromJson(Map<String, dynamic> json) =>
    _$PaginationInfoImpl(
      count: json['count'] as int? ?? 0,
      page: json['page'] as int? ?? 0,
      numPages: json['num_pages'] as int? ?? 0,
      limit: json['limit'] as int? ?? 0,
    );

Map<String, dynamic> _$$PaginationInfoImplToJson(
        _$PaginationInfoImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'page': instance.page,
      'num_pages': instance.numPages,
      'limit': instance.limit,
    };
