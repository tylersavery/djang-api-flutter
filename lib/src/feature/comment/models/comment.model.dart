// ignore_for_file: invalid_annotation_target

import 'package:dj_flutter_app/src/feature/user/models/user.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.model.freezed.dart';
part 'comment.model.g.dart';

@freezed
class Comment with _$Comment {
  const Comment._();

  const factory Comment({
    required int id,
    required String uuid,
    required String body,
    required User owner,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);

  bool get exists {
    return id > 0;
  }

  factory Comment.empty() {
    return Comment(
      id: 0,
      uuid: '',
      body: '',
      owner: User.empty(),
    );
  }
}
