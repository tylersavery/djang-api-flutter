// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_me.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserMe _$UserMeFromJson(Map<String, dynamic> json) {
  return _UserMe.fromJson(json);
}

/// @nodoc
mixin _$UserMe {
  int get id => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get bio => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserMeCopyWith<UserMe> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserMeCopyWith<$Res> {
  factory $UserMeCopyWith(UserMe value, $Res Function(UserMe) then) =
      _$UserMeCopyWithImpl<$Res, UserMe>;
  @useResult
  $Res call({int id, String uuid, String name, String bio, String email});
}

/// @nodoc
class _$UserMeCopyWithImpl<$Res, $Val extends UserMe>
    implements $UserMeCopyWith<$Res> {
  _$UserMeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uuid = null,
    Object? name = null,
    Object? bio = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserMeImplCopyWith<$Res> implements $UserMeCopyWith<$Res> {
  factory _$$UserMeImplCopyWith(
          _$UserMeImpl value, $Res Function(_$UserMeImpl) then) =
      __$$UserMeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String uuid, String name, String bio, String email});
}

/// @nodoc
class __$$UserMeImplCopyWithImpl<$Res>
    extends _$UserMeCopyWithImpl<$Res, _$UserMeImpl>
    implements _$$UserMeImplCopyWith<$Res> {
  __$$UserMeImplCopyWithImpl(
      _$UserMeImpl _value, $Res Function(_$UserMeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uuid = null,
    Object? name = null,
    Object? bio = null,
    Object? email = null,
  }) {
    return _then(_$UserMeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserMeImpl implements _UserMe {
  const _$UserMeImpl(
      {required this.id,
      required this.uuid,
      required this.name,
      required this.bio,
      required this.email});

  factory _$UserMeImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserMeImplFromJson(json);

  @override
  final int id;
  @override
  final String uuid;
  @override
  final String name;
  @override
  final String bio;
  @override
  final String email;

  @override
  String toString() {
    return 'UserMe(id: $id, uuid: $uuid, name: $name, bio: $bio, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserMeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, uuid, name, bio, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserMeImplCopyWith<_$UserMeImpl> get copyWith =>
      __$$UserMeImplCopyWithImpl<_$UserMeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserMeImplToJson(
      this,
    );
  }
}

abstract class _UserMe implements UserMe {
  const factory _UserMe(
      {required final int id,
      required final String uuid,
      required final String name,
      required final String bio,
      required final String email}) = _$UserMeImpl;

  factory _UserMe.fromJson(Map<String, dynamic> json) = _$UserMeImpl.fromJson;

  @override
  int get id;
  @override
  String get uuid;
  @override
  String get name;
  @override
  String get bio;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$UserMeImplCopyWith<_$UserMeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
