// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_me.model.freezed.dart';
part 'user_me.model.g.dart';

@freezed
class UserMe with _$UserMe {
  const factory UserMe({
    required int id,
    required String uuid,
    required String name,
    required String bio,
    required String email,

  }) = _UserMe;

  factory UserMe.fromJson(Map<String, dynamic> json) => _$UserMeFromJson(json);

 
}
