import 'package:dj_flutter_app/src/core/utils/toast.dart';
import 'package:dj_flutter_app/src/feature/comment/providers/comment_form.provider.dart';
import 'package:dj_flutter_app/src/feature/post/models/post.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommentFormComponent extends ConsumerWidget {
  final Post post;
  const CommentFormComponent({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(commentFormProvider(post.uuid).notifier);

    return Form(
      key: provider.formKey,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: provider.bodyController,
              decoration: InputDecoration(hintText: "Add Comment..."),
            ),
          ),
          IconButton(
            onPressed: () async {
              final success = await provider.submit();

              success.fold(
                (error) {
                  ToastService.error(context, error);
                },
                (success) {
                  if (success) {
                    ToastService.message(context, "Comment Sent!");
                  }
                },
              );
            },
            icon: Icon(Icons.send),
          )
        ],
      ),
    );
  }
}
