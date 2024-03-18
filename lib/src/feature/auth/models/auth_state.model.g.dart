// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthStateImpl _$$AuthStateImplFromJson(Map<String, dynamic> json) =>
    _$AuthStateImpl(
      ready: json['ready'] as bool? ?? false,
      token: json['token'] == null
          ? null
          : Token.fromJson(json['token'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : UserMe.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AuthStateImplToJson(_$AuthStateImpl instance) =>
    <String, dynamic>{
      'ready': instance.ready,
      'token': instance.token,
      'user': instance.user,
    };
