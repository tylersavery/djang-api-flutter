// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_form.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PostFormState {
  bool get isProcessing => throw _privateConstructorUsedError;
  Post get post => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostFormStateCopyWith<PostFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostFormStateCopyWith<$Res> {
  factory $PostFormStateCopyWith(
          PostFormState value, $Res Function(PostFormState) then) =
      _$PostFormStateCopyWithImpl<$Res, PostFormState>;
  @useResult
  $Res call({bool isProcessing, Post post});

  $PostCopyWith<$Res> get post;
}

/// @nodoc
class _$PostFormStateCopyWithImpl<$Res, $Val extends PostFormState>
    implements $PostFormStateCopyWith<$Res> {
  _$PostFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isProcessing = null,
    Object? post = null,
  }) {
    return _then(_value.copyWith(
      isProcessing: null == isProcessing
          ? _value.isProcessing
          : isProcessing // ignore: cast_nullable_to_non_nullable
              as bool,
      post: null == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as Post,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PostCopyWith<$Res> get post {
    return $PostCopyWith<$Res>(_value.post, (value) {
      return _then(_value.copyWith(post: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PostFormStateImplCopyWith<$Res>
    implements $PostFormStateCopyWith<$Res> {
  factory _$$PostFormStateImplCopyWith(
          _$PostFormStateImpl value, $Res Function(_$PostFormStateImpl) then) =
      __$$PostFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isProcessing, Post post});

  @override
  $PostCopyWith<$Res> get post;
}

/// @nodoc
class __$$PostFormStateImplCopyWithImpl<$Res>
    extends _$PostFormStateCopyWithImpl<$Res, _$PostFormStateImpl>
    implements _$$PostFormStateImplCopyWith<$Res> {
  __$$PostFormStateImplCopyWithImpl(
      _$PostFormStateImpl _value, $Res Function(_$PostFormStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isProcessing = null,
    Object? post = null,
  }) {
    return _then(_$PostFormStateImpl(
      isProcessing: null == isProcessing
          ? _value.isProcessing
          : isProcessing // ignore: cast_nullable_to_non_nullable
              as bool,
      post: null == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as Post,
    ));
  }
}

/// @nodoc

class _$PostFormStateImpl implements _PostFormState {
  const _$PostFormStateImpl({this.isProcessing = false, required this.post});

  @override
  @JsonKey()
  final bool isProcessing;
  @override
  final Post post;

  @override
  String toString() {
    return 'PostFormState(isProcessing: $isProcessing, post: $post)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostFormStateImpl &&
            (identical(other.isProcessing, isProcessing) ||
                other.isProcessing == isProcessing) &&
            (identical(other.post, post) || other.post == post));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isProcessing, post);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostFormStateImplCopyWith<_$PostFormStateImpl> get copyWith =>
      __$$PostFormStateImplCopyWithImpl<_$PostFormStateImpl>(this, _$identity);
}

abstract class _PostFormState implements PostFormState {
  const factory _PostFormState(
      {final bool isProcessing,
      required final Post post}) = _$PostFormStateImpl;

  @override
  bool get isProcessing;
  @override
  Post get post;
  @override
  @JsonKey(ignore: true)
  _$$PostFormStateImplCopyWith<_$PostFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
