import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error.model.freezed.dart';
part 'api_error.model.g.dart';

@freezed
class ApiError with _$ApiError {
  const factory ApiError({
    @Default("Unknown error") String detail,
    @Default("unknown") String code,
  }) = _ApiError;

  factory ApiError.fromJson(Map<String, dynamic> json) => _$ApiErrorFromJson(json);
}
