import 'package:dj_flutter_app/src/feature/comment/models/comment.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_form.state.freezed.dart';

@freezed
class CommentFormState with _$CommentFormState {
  const factory CommentFormState({
    @Default(false) bool isProcessing,
    required Comment comment,
  }) = _CommentFormState;
}
