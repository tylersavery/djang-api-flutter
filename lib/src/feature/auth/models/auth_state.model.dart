import 'package:dj_flutter_app/src/feature/auth/models/token.model.dart';
import 'package:dj_flutter_app/src/feature/user/models/user_me.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.model.freezed.dart';
part 'auth_state.model.g.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool ready,
    Token? token,
    UserMe? user,
  }) = _AuthState;

  factory AuthState.fromJson(Map<String, dynamic> json) => _$AuthStateFromJson(json);
}
