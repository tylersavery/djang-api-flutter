import 'package:freezed_annotation/freezed_annotation.dart';

part 'token.model.freezed.dart';
part 'token.model.g.dart';

@freezed
class Token with _$Token {
  const factory Token({
    required String access,
    required String refresh,
  }) = _Token;

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
}
