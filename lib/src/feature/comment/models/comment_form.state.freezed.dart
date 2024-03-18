// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_form.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CommentFormState {
  bool get isProcessing => throw _privateConstructorUsedError;
  Comment get comment => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CommentFormStateCopyWith<CommentFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentFormStateCopyWith<$Res> {
  factory $CommentFormStateCopyWith(
          CommentFormState value, $Res Function(CommentFormState) then) =
      _$CommentFormStateCopyWithImpl<$Res, CommentFormState>;
  @useResult
  $Res call({bool isProcessing, Comment comment});

  $CommentCopyWith<$Res> get comment;
}

/// @nodoc
class _$CommentFormStateCopyWithImpl<$Res, $Val extends CommentFormState>
    implements $CommentFormStateCopyWith<$Res> {
  _$CommentFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isProcessing = null,
    Object? comment = null,
  }) {
    return _then(_value.copyWith(
      isProcessing: null == isProcessing
          ? _value.isProcessing
          : isProcessing // ignore: cast_nullable_to_non_nullable
              as bool,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as Comment,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CommentCopyWith<$Res> get comment {
    return $CommentCopyWith<$Res>(_value.comment, (value) {
      return _then(_value.copyWith(comment: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CommentFormStateImplCopyWith<$Res>
    implements $CommentFormStateCopyWith<$Res> {
  factory _$$CommentFormStateImplCopyWith(_$CommentFormStateImpl value,
          $Res Function(_$CommentFormStateImpl) then) =
      __$$CommentFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isProcessing, Comment comment});

  @override
  $CommentCopyWith<$Res> get comment;
}

/// @nodoc
class __$$CommentFormStateImplCopyWithImpl<$Res>
    extends _$CommentFormStateCopyWithImpl<$Res, _$CommentFormStateImpl>
    implements _$$CommentFormStateImplCopyWith<$Res> {
  __$$CommentFormStateImplCopyWithImpl(_$CommentFormStateImpl _value,
      $Res Function(_$CommentFormStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isProcessing = null,
    Object? comment = null,
  }) {
    return _then(_$CommentFormStateImpl(
      isProcessing: null == isProcessing
          ? _value.isProcessing
          : isProcessing // ignore: cast_nullable_to_non_nullable
              as bool,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as Comment,
    ));
  }
}

/// @nodoc

class _$CommentFormStateImpl implements _CommentFormState {
  const _$CommentFormStateImpl(
      {this.isProcessing = false, required this.comment});

  @override
  @JsonKey()
  final bool isProcessing;
  @override
  final Comment comment;

  @override
  String toString() {
    return 'CommentFormState(isProcessing: $isProcessing, comment: $comment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentFormStateImpl &&
            (identical(other.isProcessing, isProcessing) ||
                other.isProcessing == isProcessing) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isProcessing, comment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentFormStateImplCopyWith<_$CommentFormStateImpl> get copyWith =>
      __$$CommentFormStateImplCopyWithImpl<_$CommentFormStateImpl>(
          this, _$identity);
}

abstract class _CommentFormState implements CommentFormState {
  const factory _CommentFormState(
      {final bool isProcessing,
      required final Comment comment}) = _$CommentFormStateImpl;

  @override
  bool get isProcessing;
  @override
  Comment get comment;
  @override
  @JsonKey(ignore: true)
  _$$CommentFormStateImplCopyWith<_$CommentFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
