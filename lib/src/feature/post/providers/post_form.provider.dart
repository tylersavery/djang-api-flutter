// ignore_for_file: avoid_public_notifier_properties
import 'package:dj_flutter_app/src/feature/post/models/post.model.dart';
import 'package:dj_flutter_app/src/feature/post/models/post_form.state.dart';
import 'package:dj_flutter_app/src/feature/post/providers/post_detail.provider.dart';
import 'package:dj_flutter_app/src/feature/post/providers/post_list.provider.dart';
import 'package:dj_flutter_app/src/feature/post/services/post.service.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_form.provider.g.dart';

@Riverpod(keepAlive: true)
class PostForm extends _$PostForm {
  late final GlobalKey<FormState> formKey;
  late final TextEditingController titleController;
  late final TextEditingController bodyController;

  @override
  PostFormState build() {
    init();

    return _initialState;
  }

  PostFormState get _initialState {
    return PostFormState(post: Post.empty());
  }

  void init() {
    formKey = GlobalKey<FormState>();
    titleController = TextEditingController(text: "");
    bodyController = TextEditingController(text: "");
  }

  void clear() {
    titleController.clear();
    bodyController.clear();

    state = _initialState;
  }

  void loadPost(Post post) {
    state = state.copyWith(post: post);
    titleController.text = post.title;
    bodyController.text = post.body;
  }

  void updateStatus(PostStatus status) {
    state = state.copyWith(
      post: state.post.copyWith(status: status),
    );
  }

  String? titleValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Title Required";
    }

    return null;
  }

  String? bodyValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Body Required";
    }

    return null;
  }

  Future<Either<String, bool>> submit() async {
    if (!formKey.currentState!.validate()) {
      return left("Invalid form input.");
    }

    state = state.copyWith(
      isProcessing: true,
      post: state.post.copyWith(
        title: titleController.text,
        body: bodyController.text,
      ),
    );

    final result = await PostService().save(state.post);
    state = state.copyWith(isProcessing: false);

    return result.fold(
      (error) => left(error.detail),
      (post) {
        state = state.copyWith(post: post);
        ref.invalidate(postListProvider('public'));
        ref.invalidate(postDetailProvider(state.post.uuid));
        clear();
        return right(true);
      },
    );
  }
}
