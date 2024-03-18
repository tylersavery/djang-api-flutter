import 'package:dj_flutter_app/src/feature/auth/providers/login_form.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginFormComponent extends ConsumerWidget {
  const LoginFormComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(loginFormProvider.notifier);
    final state = ref.watch(loginFormProvider);

    return Form(
      key: provider.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: provider.emailController,
            decoration: InputDecoration(
              label: Text("Email"),
            ),
          ),
          TextFormField(
            controller: provider.passwordController,
            decoration: InputDecoration(
              label: Text("Password"),
            ),
            obscureText: true,
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: state.isProcessing
                ? null
                : () async {
                    await provider.submit();

                    // result.fold(
                    //   (error) {
                    //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
                    //   },
                    //   (success) {
                    //     ScaffoldMessenger.of(context).showSnackBar(
                    //       SnackBar(content: Text(success ? "Welcome back" : "Something went wrong.")),
                    //     );
                    //   },
                    // );
                  },
            child: Text("Login"),
          )
        ],
      ),
    );
  }
}
