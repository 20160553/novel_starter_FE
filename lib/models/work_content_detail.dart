import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_content_detail.freezed.dart';
part 'work_content_detail.g.dart';

@freezed
class WorkContentDetail with _$WorkContentDetail {
  const factory WorkContentDetail({
    required String contentDetailId,
    required String workContentId,
    required String userId,
    required String body,
    required String comment,
  }) = _WorkContentDetail;

  factory WorkContentDetail.fromJson(Map<String, dynamic> json) => _$WorkContentDetailFromJson(json);
}