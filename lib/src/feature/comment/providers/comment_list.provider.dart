// ignore_for_file: override_on_non_overriding_member, avoid_public_notifier_properties

import 'package:dj_flutter_app/src/core/models/api_error.model.dart';
import 'package:dj_flutter_app/src/core/models/list.state.model.dart';
import 'package:dj_flutter_app/src/core/models/pagination_info.model.dart';
import 'package:dj_flutter_app/src/feature/comment/models/comment.model.dart';
import 'package:dj_flutter_app/src/feature/comment/services/comment.service.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dj_flutter_app/src/core/providers/base_list.provider.dart';

class CommentListProvider extends BaseListProvider<Comment> {
  @override
  Future<Either<ApiError, (PaginationInfo, List<Comment>)>> requestBuilder(
    int page, {
    int limit = 10,
    Map<String, dynamic> additionalParams = const {},
  }) async {
    final result = await CommentService().list(arg, page, limit: limit, additionalParams: additionalParams);
    return result.fold((error) => left(error), (data) => right(data));
  }
}

final commentListProvider = NotifierProvider.family<CommentListProvider, ListState<Comment>, String>(
  () => CommentListProvider(),
);
