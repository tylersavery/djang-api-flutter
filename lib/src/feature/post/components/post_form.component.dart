import 'package:dj_flutter_app/src/feature/post/models/post.model.dart';
import 'package:dj_flutter_app/src/feature/post/providers/post_form.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostFormComponent extends ConsumerWidget {
  const PostFormComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(postFormProvider.notifier);
    final state = ref.watch(postFormProvider);
    return Form(
      key: provider.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: provider.titleController,
            validator: provider.titleValidator,
            decoration: InputDecoration(
              label: Text("Title"),
            ),
          ),
          TextFormField(
            controller: provider.bodyController,
            validator: provider.bodyValidator,
            decoration: InputDecoration(
              label: Text("Body"),
            ),
            minLines: 3,
            maxLines: 6,
          ),
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(state.post.exists ? "Published" : "Publish on Save"),
            value: state.post.status == PostStatus.published,
            onChanged: (value) {
              if (value != null) {
                provider.updateStatus(value ? PostStatus.published : PostStatus.draft);
              }
            },
          )
        ],
      ),
    );
  }
}
