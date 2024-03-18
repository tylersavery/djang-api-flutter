// ignore_for_file: avoid_public_notifier_properties
import 'package:dj_flutter_app/src/feature/comment/models/comment.model.dart';
import 'package:dj_flutter_app/src/feature/comment/models/comment_form.state.dart';
import 'package:dj_flutter_app/src/feature/comment/providers/comment_list.provider.dart';
import 'package:dj_flutter_app/src/feature/comment/services/comment.service.dart';

import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'comment_form.provider.g.dart';

@Riverpod(keepAlive: true)
class CommentForm extends _$CommentForm {
  late final GlobalKey<FormState> formKey;
  late final TextEditingController bodyController;

  @override
  CommentFormState build(String postUuid) {
    init();

    return _initialState;
  }

  CommentFormState get _initialState {
    return CommentFormState(comment: Comment.empty());
  }

  void init() {
    formKey = GlobalKey<FormState>();
    bodyController = TextEditingController(text: "");
  }

  void clear() {
    bodyController.clear();

    state = _initialState;
  }

  void loadComment(Comment comment) {
    state = state.copyWith(comment: comment);
    bodyController.text = comment.body;
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
      comment: state.comment.copyWith(
        body: bodyController.text,
      ),
    );

    final result = await CommentService().create(postUuid, state.comment);
    state = state.copyWith(isProcessing: false);

    return result.fold(
      (error) => left(error.detail),
      (comment) {
        state = state.copyWith(comment: comment);
        ref.invalidate(commentListProvider(postUuid));
        clear();
        return right(true);
      },
    );
  }
}
