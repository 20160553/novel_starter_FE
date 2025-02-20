import 'package:freezed_annotation/freezed_annotation.dart';

part 'join_result.freezed.dart';

@Freezed()
sealed class JoinResult with _$JoinResult {
  const factory JoinResult.duplicated() = DuplicatedUsername;
  const factory JoinResult.unDuplicated() = UnDuplicatedUsername;
  const factory JoinResult.success() = JoinSuccess;
}