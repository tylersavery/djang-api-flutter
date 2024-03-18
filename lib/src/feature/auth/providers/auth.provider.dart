import 'package:dj_flutter_app/src/core/providers/storage.provider.dart';
import 'package:dj_flutter_app/src/feature/auth/models/auth_state.model.dart';
import 'package:dj_flutter_app/src/feature/auth/models/token.model.dart';
import 'package:dj_flutter_app/src/feature/auth/services/auth.service.dart';
import 'package:dj_flutter_app/src/feature/user/models/user_me.model.dart';
import 'package:dj_flutter_app/src/feature/user/services/user.service.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth.provider.g.dart';

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  @override
  AuthState build() {
    Future.delayed(Duration(milliseconds: 100), () {
      _init();
    });
    return AuthState();
  }

  Future<void> _init() async {
    final storedAccessToken = StorageProvider().getString(StorageKey.authAccess);
    final storedRefreshToken = StorageProvider().getString(StorageKey.authRefresh);

    if (storedAccessToken != null && storedRefreshToken != null) {
      //TODO check for expiry etc etc.

      final token = Token(access: storedAccessToken, refresh: storedRefreshToken);
      state = state.copyWith(token: token);

      final user = await getMe();
      state = state.copyWith(user: user);
    }

    state = state.copyWith(ready: true);
  }

  Future<UserMe?> getMe() async {
    final result = await UserService().retrieveMe();

    return result.fold((error) {
      print(error);
      return null;
    }, (user) => user);
  }

  Future<Either<String, bool>> login({required String email, required String password}) async {
    final result = await AuthService().getToken(email, password);

    return result.fold(
      (error) {
        return left(error.detail);
      },
      (token) async {
        state = state.copyWith(token: token);

        await StorageProvider().setString(StorageKey.authAccess, token.access);
        await StorageProvider().setString(StorageKey.authRefresh, token.refresh);

        final user = await getMe();
        state = state.copyWith(user: user);

        return right(true);
      },
    );
  }

  Future<void> logout() async {
    await StorageProvider().remove(StorageKey.authAccess);
    await StorageProvider().remove(StorageKey.authRefresh);

    state = AuthState(ready: true);
  }
}
