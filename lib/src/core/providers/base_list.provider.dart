// ignore_for_file: avoid_public_notifier_properties
import 'package:dj_flutter_app/src/core/models/api_error.model.dart';
import 'package:dj_flutter_app/src/core/models/list.state.model.dart';
import 'package:dj_flutter_app/src/core/models/pagination_info.model.dart';
import 'package:dj_flutter_app/src/feature/auth/mixins.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

class BaseListProvider<T> extends FamilyNotifier<ListState<T>, String> with ApiMixins {
  Future<Either<ApiError, (PaginationInfo, List<T>)>> requestBuilder(
    int page, {
    int limit = 10,
    Map<String, dynamic> additionalParams = const {},
  }) =>
      throw UnimplementedError();

  @override
  ListState<T> build(String arg) {
    Future.delayed(Duration(milliseconds: 100), () => load(1));
    return ListState<T>();
  }

  Future<void> load(
    int page, {
    int limit = 10,
    Map<String, dynamic> additionalParams = const {},
  }) async {
    state = state.removeErrorAndStartLoading();

    final result = await requestBuilder(
      page,
      limit: limit,
      additionalParams: additionalParams,
    );

    result.fold(
      (error) {
        print(error);
        state = state.copyWith(isLoading: false, error: error.detail);
      },
      (data) {
        final (paginationInfo, results) = data;

        state = state.copyWith(
          results: page == 1 ? results : [...state.results, ...results],
          paginationInfo: paginationInfo,
          isLoading: false,
        );
      },
    );
  }

  Future<void> refresh() async {
    state = state.copyWith(results: []);
    await load(1);
  }

  Future<void> loadNextPage() async {
    if (state.paginationInfo.canLoadMore) {
      await load(state.paginationInfo.page + 1);
    }
  }
}

final baseListProvider = NotifierProvider.family<BaseListProvider, ListState<dynamic>, String>(
  () => BaseListProvider(),
);
