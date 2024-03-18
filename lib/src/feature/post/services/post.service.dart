import 'package:dj_flutter_app/src/core/models/api_error.model.dart';
import 'package:dj_flutter_app/src/core/models/pagination_info.model.dart';
import 'package:dj_flutter_app/src/core/services/api.service.dart';
import 'package:dj_flutter_app/src/feature/post/models/post.model.dart';
import 'package:fpdart/fpdart.dart';

class PostService extends ApiService {
  static const basePath = '/post';

  Future<Either<ApiError, (PaginationInfo, List<Post>)>> list(
    int page, {
    int limit = 10,
    Map<String, dynamic> additionalParams = const {},
  }) async {
    final params = {
      ...buildPage(page),
      ...buildLimit(limit),
      ...additionalParams,
    };

    final result = await get(basePath, params: params);

    return result.fold(
      (error) {
        return left(error);
      },
      (json) {
        final List<dynamic> results = json['results'];
        final posts = results.map((item) => Post.fromJson(item)).toList();
        return right(
          (PaginationInfo.fromJson(json), posts),
        );
      },
    );
  }

  Future<Either<ApiError, Post>> retrieve(String postUuid) async {
    final result = await get("$basePath/$postUuid");
    return result.fold(
      (e) => left(e),
      (json) {
        try {
          final post = Post.fromJson(json);
          return right(post);
        } catch (e) {
          return left(ApiError(detail: e.toString(), code: "invalid data"));
        }
      },
    );
  }

  Future<Either<ApiError, Post>> _create(Post p) async {
    final result = await post(basePath, params: p.toJson());
    return result.fold((e) => left(e), (json) => right(Post.fromJson(json)));
  }

  Future<Either<ApiError, Post>> _update(Post p) async {
    final result = await patch("$basePath/me/${p.uuid}", params: p.toJson());
    return result.fold((e) => left(e), (json) => right(Post.fromJson(json)));
  }

  Future<Either<ApiError, Post>> save(Post p) async {
    return p.exists ? _update(p) : _create(p);
  }
}
