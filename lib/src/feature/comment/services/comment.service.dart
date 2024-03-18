import 'package:dj_flutter_app/src/core/models/api_error.model.dart';
import 'package:dj_flutter_app/src/core/models/pagination_info.model.dart';
import 'package:dj_flutter_app/src/core/services/api.service.dart';
import 'package:dj_flutter_app/src/feature/comment/models/comment.model.dart';
import 'package:fpdart/fpdart.dart';

class CommentService extends ApiService {
  static const basePath = '/comment';

  Future<Either<ApiError, (PaginationInfo, List<Comment>)>> list(
    String postUuid,
    int page, {
    int limit = 10,
    Map<String, dynamic> additionalParams = const {},
  }) async {
    final params = {
      ...buildPage(page),
      ...buildLimit(limit),
      ...additionalParams,
    };

    final result = await get("/post/$postUuid/comment/", params: params);

    return result.fold(
      (error) {
        return left(error);
      },
      (json) {
        final List<dynamic> results = json['results'];
        final comments = results.map((item) => Comment.fromJson(item)).toList();
        return right(
          (PaginationInfo.fromJson(json), comments),
        );
      },
    );
  }

  Future<Either<ApiError, Comment>> create(String postUuid, Comment comment) async {
    final data = {
      'post': postUuid,
      'body': comment.body,
    };

    final result = await post(basePath, params: data);
    return result.fold((e) => left(e), (json) => right(Comment.fromJson(json)));
  }

  // Future<Either<ApiError, Comment>> _update(Comment comment) async {
  //   throw UnimplementedError();
  //   // final result = await patch("$basePath/${comment.uuid}", params: comment.toJson());

  //   // return result.fold((e) => left(e), (json) => right(Comment.fromJson(json)));
  // }

  // Future<Either<ApiError, Comment>> save(String postUuid, Comment comment) async {
  //   return comment.exists ? _update(comment) : _create(postUuid comment);
  // }
}
