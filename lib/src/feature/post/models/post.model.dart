// ignore_for_file: invalid_annotation_target

import 'package:dj_flutter_app/src/feature/user/models/user.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:collection/collection.dart';

part 'post.model.freezed.dart';
part 'post.model.g.dart';

enum PostStatus {
  draft("draft"),
  published("published"),
  ;

  final String name;
  const PostStatus(this.name);
}

postStatusToJson(PostStatus status) {
  return status.name;
}

postStatusFromJson(String name) {
  return PostStatus.values.firstWhereOrNull((item) => item.name == name) ?? PostStatus.published;
}

@freezed
class Post with _$Post {
  const Post._();

  const factory Post({
    @JsonKey(includeToJson: false) required int id,
    @JsonKey(includeToJson: false) required String uuid,
    required String title,
    required String body,
    @JsonKey(includeToJson: false) required User owner,
    @JsonKey(toJson: postStatusToJson, fromJson: postStatusFromJson) required PostStatus status,
    @JsonKey(name: 'created_at', includeToJson: false) required DateTime createdAt,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  factory Post.empty() {
    return Post(
      id: 0,
      uuid: '',
      title: '',
      body: '',
      owner: User.empty(),
      status: PostStatus.draft,
      createdAt: DateTime.now(),
    );
  }

  bool get exists {
    return id > 0;
  }
}
