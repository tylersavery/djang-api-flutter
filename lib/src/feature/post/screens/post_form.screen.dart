import 'package:dj_flutter_app/src/core/utils/toast.dart';
import 'package:dj_flutter_app/src/feature/post/components/post_form.component.dart';
import 'package:dj_flutter_app/src/feature/post/providers/post_form.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PostFormScreen extends ConsumerWidget {
  const PostFormScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(postFormProvider.notifier);
    final state = ref.watch(postFormProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(state.post.exists ? "Edit Post" : "New Post"),
        actions: [
          TextButton(
            onPressed: () async {
              final result = await provider.submit();

              result.fold((error) {
                ToastService.error(context, error);
              }, (success) {
                if (success) {
                  ToastService.message(context, "Post Saved");

                  context.pop();
                } else {
                  ToastService.error(context, "Something went wrong.");
                }
              });
            },
            child: Text(state.post.exists ? "Save Changes" : "Save"),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PostFormComponent(),
      ),
    );
  }
}
