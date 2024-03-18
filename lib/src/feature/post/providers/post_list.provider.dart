// ignore_for_file: override_on_non_overriding_member, avoid_public_notifier_properties

import 'package:dj_flutter_app/src/core/models/api_error.model.dart';
import 'package:dj_flutter_app/src/core/models/list.state.model.dart';
import 'package:dj_flutter_app/src/core/models/pagination_info.model.dart';
import 'package:dj_flutter_app/src/feature/post/models/post.model.dart';
import 'package:dj_flutter_app/src/feature/post/services/post.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dj_flutter_app/src/core/providers/base_list.provider.dart';
import 'package:fpdart/fpdart.dart';

class PostListProvider extends BaseListProvider<Post> {
  @override
  Future<Either<ApiError, (PaginationInfo, List<Post>)>> requestBuilder(
    int page, {
    int limit = 10,
    Map<String, dynamic> additionalParams = const {},
  }) async {
    final result = await PostService().list(page, limit: limit, additionalParams: additionalParams);
    return result.fold((error) => left(error), (data) => right(data));
  }
}

final postListProvider = NotifierProvider.family<PostListProvider, ListState<Post>, String>(
  () => PostListProvider(),
);
