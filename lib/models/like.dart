import 'package:freezed_annotation/freezed_annotation.dart';

part 'like.g.dart';
part 'like.freezed.dart';

@Freezed()
class Like with _$Like {

  factory Like({
    required String userId,
    required String workId,
    required String likeId,
  }) = _Like;

  factory Like.fromJson(Map<String, dynamic> json) => _$LikeFromJson(json);
}