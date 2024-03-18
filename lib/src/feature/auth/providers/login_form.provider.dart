// ignore_for_file: avoid_public_notifier_properties
import 'package:dj_flutter_app/src/feature/auth/models/login_form_state.model.dart';
import 'package:dj_flutter_app/src/feature/auth/providers/auth.provider.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_form.provider.g.dart';

@Riverpod(keepAlive: true)
class LoginForm extends _$LoginForm {
  late final GlobalKey<FormState> formKey;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  LoginFormState build() {
    init();
    return LoginFormState();
  }

  void init() {
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController(text: "admin@tylersavery.com");
    passwordController = TextEditingController(text: "younotry");
  }

  void clear() {
    emailController.clear();
    passwordController.clear();
  }

  Future<Either<String, bool>> submit() async {
    if (!formKey.currentState!.validate()) {
      return right(false);
    }

    state = state.copyWith(isProcessing: true);

    final result = await ref.read(authProvider.notifier).login(
          email: emailController.text,
          password: passwordController.text,
        );

    state = state.copyWith(isProcessing: false);

    return result.fold(
      (error) => left(error),
      (_) {
        clear();
        return right(true);
      },
    );
  }
}
