import 'package:dj_flutter_app/src/core/models/api_error.model.dart';
import 'package:dj_flutter_app/src/core/models/pagination_info.model.dart';
import 'package:dj_flutter_app/src/core/services/api.service.dart';
import 'package:dj_flutter_app/src/feature/user/models/user.model.dart';
import 'package:dj_flutter_app/src/feature/user/models/user_me.model.dart';
import 'package:fpdart/fpdart.dart';

class UserService extends ApiService {
  static const basePath = "/user";

  Future<Either<ApiError, (PaginationInfo, List<User>)>> list(
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
        final users = results.map((item) => User.fromJson(item)).toList();
        return right(
          (PaginationInfo.fromJson(json), users),
        );
      },
    );
  }

  Future<Either<ApiError, User>> retrieve(String userUuid) async {
    final result = await get("$basePath/$userUuid/");
    return result.fold(
      (e) => left(e),
      (json) {
        try {
          final user = User.fromJson(json);
          return right(user);
        } catch (e) {
          return left(ApiError(detail: e.toString(), code: "invalid data"));
        }
      },
    );
  }

  Future<Either<ApiError, UserMe>> retrieveMe() async {
    final result = await get("$basePath/me/");
    return result.fold(
      (e) => left(e),
      (json) {
        try {
          final user = UserMe.fromJson(json);
          return right(user);
        } catch (e) {
          return left(ApiError(detail: e.toString(), code: "invalid data"));
        }
      },
    );
  }
}
