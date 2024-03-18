import 'package:dj_flutter_app/src/feature/post/models/post.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_form.state.freezed.dart';

@freezed
class PostFormState with _$PostFormState {
  const factory PostFormState({
    @Default(false) bool isProcessing,
    required Post post,
  }) = _PostFormState;
}
