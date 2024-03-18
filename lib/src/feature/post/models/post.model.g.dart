// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      id: json['id'] as int,
      uuid: json['uuid'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      owner: User.fromJson(json['owner'] as Map<String, dynamic>),
      status: postStatusFromJson(json['status'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'status': postStatusToJson(instance.status),
    };
