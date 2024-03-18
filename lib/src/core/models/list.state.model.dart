import 'package:dj_flutter_app/src/core/models/pagination_info.model.dart';

class ListState<T> {
  final bool isLoading;
  final String? error;
  final PaginationInfo paginationInfo;
  final List<T> results;

  const ListState({
    this.isLoading = false,
    this.error,
    this.paginationInfo = const PaginationInfo(),
    this.results = const [],
  });

  ListState<T> copyWith({
    bool? isLoading,
    String? error,
    PaginationInfo? paginationInfo,
    List<T>? results,
  }) {
    return ListState<T>(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      paginationInfo: paginationInfo ?? this.paginationInfo,
      results: results ?? this.results,
    );
  }

  startLoading() {
    return ListState<T>(
      isLoading: true,
      error: error,
      paginationInfo: paginationInfo,
      results: results,
    );
  }

  finishLoading() {
    return ListState<T>(
      isLoading: false,
      error: error,
      paginationInfo: paginationInfo,
      results: results,
    );
  }

  removeError() {
    return ListState<T>(
      isLoading: isLoading,
      error: null,
      paginationInfo: paginationInfo,
      results: results,
    );
  }

  removeErrorAndStartLoading() {
    return ListState<T>(
      isLoading: true,
      error: null,
      paginationInfo: paginationInfo,
      results: results,
    );
  }
}
