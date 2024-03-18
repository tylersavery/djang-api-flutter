import 'package:dj_flutter_app/src/core/models/api_error.model.dart';
import 'package:dj_flutter_app/src/feature/post/models/post.model.dart';
import 'package:dj_flutter_app/src/feature/post/services/post.service.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_detail.provider.g.dart';

@riverpod
Future<Either<ApiError, Post>> postDetail(PostDetailRef ref, String postUuid) async {
  final result = await PostService().retrieve(postUuid);
  return result.fold((error) => left(error), (post) => right(post));
}
