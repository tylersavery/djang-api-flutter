import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_form_state.model.freezed.dart';
part 'login_form_state.model.g.dart';

@freezed
class LoginFormState with _$LoginFormState {
  const LoginFormState._();

  const factory LoginFormState({
    @Default(false) bool isProcessing,
  }) = _LoginFormState;

  factory LoginFormState.fromJson(Map<String, dynamic> json) => _$LoginFormStateFromJson(json);
}
