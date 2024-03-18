import 'package:dio/dio.dart';
import 'package:dj_flutter_app/src/core/models/api_error.model.dart';
import 'package:dj_flutter_app/src/core/providers/storage.provider.dart';
import 'package:fpdart/fpdart.dart';

abstract class ApiService {
  Dio _client({bool authenticate = true}) {
    final options = BaseOptions(
      baseUrl: "http://localhost:8000/api",
      contentType: 'application/json',
      validateStatus: (_) => true,
    );

    final accessToken = StorageProvider().getString(StorageKey.authAccess);
    if (authenticate && accessToken != null) {
      options.headers.addAll({"Authorization": "Bearer $accessToken"});
    }

    return Dio(options);
  }

  String _fixedPath(String path) {
    return path.endsWith("/") ? path : "$path/";
  }

  Map<String, dynamic> buildLimit(int limit) {
    return {'limit': limit};
  }

  Map<String, dynamic> buildPage(int page) {
    return {'page': page};
  }

  Either<ApiError, Map<String, dynamic>> _handleResult(Response<dynamic> result) {
    if ([200, 201].contains(result.statusCode)) {
      return right(result.data);
    }

    try {
      return left(ApiError.fromJson(result.data));
    } catch (e) {
      return left(ApiError(detail: e.toString()));
    }
  }

  Future<Either<ApiError, Map<String, dynamic>>> get(
    String path, {
    Map<String, dynamic> params = const {},
    bool authenticate = true,
  }) async {
    final result = await _client(authenticate: authenticate).get(_fixedPath(path), queryParameters: params);
    return _handleResult(result);
  }

  Future<Either<ApiError, Map<String, dynamic>>> post(
    String path, {
    Map<String, dynamic> params = const {},
    bool authenticate = true,
  }) async {
    final result = await _client(authenticate: authenticate).post(_fixedPath(path), data: params);
    return _handleResult(result);
  }

  Future<Either<ApiError, Map<String, dynamic>>> patch(
    String path, {
    Map<String, dynamic> params = const {},
    bool authenticate = true,
  }) async {
    final result = await _client(authenticate: authenticate).patch(_fixedPath(path), data: params);
    return _handleResult(result);
  }
}
