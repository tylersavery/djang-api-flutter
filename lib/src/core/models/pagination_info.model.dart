// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_info.model.freezed.dart';
part 'pagination_info.model.g.dart';

@freezed
class PaginationInfo with _$PaginationInfo {
  const PaginationInfo._();

  const factory PaginationInfo({
    @Default(0) int count,
    @Default(0) int page,
    @JsonKey(name: "num_pages") @Default(0) int numPages,
    @Default(0) int limit,
  }) = _PaginationInfo;

  factory PaginationInfo.fromJson(Map<String, dynamic> json) => _$PaginationInfoFromJson(json);

  bool get canLoadMore {
    return count > (page * limit);
  }
}
