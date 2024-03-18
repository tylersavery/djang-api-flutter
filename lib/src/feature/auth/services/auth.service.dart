import 'package:dj_flutter_app/src/core/models/api_error.model.dart';
import 'package:dj_flutter_app/src/core/services/api.service.dart';
import 'package:dj_flutter_app/src/feature/auth/models/token.model.dart';
import 'package:fpdart/fpdart.dart';

class AuthService extends ApiService {
  static const basePath = "/auth";

  Future<Either<ApiError, Token>> getToken(String email, String password) async {
    final params = {
      'email': email,
      'password': password,
    };

    final result = await post('$basePath/token/', params: params, authenticate: false);
    return result.fold((error) => left(error), (json) => right(Token.fromJson(json)));
  }
}
