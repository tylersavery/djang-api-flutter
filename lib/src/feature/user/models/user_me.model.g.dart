// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_me.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserMeImpl _$$UserMeImplFromJson(Map<String, dynamic> json) => _$UserMeImpl(
      id: json['id'] as int,
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      bio: json['bio'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$$UserMeImplToJson(_$UserMeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'name': instance.name,
      'bio': instance.bio,
      'email': instance.email,
    };
