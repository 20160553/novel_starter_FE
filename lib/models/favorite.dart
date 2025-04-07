import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite.g.dart';
part 'favorite.freezed.dart';

@Freezed()
class Favorite with _$Favorite {

  factory Favorite({
    required String userId,
    required String workId,
    required String favoriteId,
  }) = _Favorite;

  factory Favorite.fromJson(Map<String, dynamic> json) => _$FavoriteFromJson(json);
}