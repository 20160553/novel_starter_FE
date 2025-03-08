// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkContent _$WorkContentFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'episode':
      return Episode.fromJson(json);
    case 'notice':
      return Notice.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'WorkContent',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$WorkContent {
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get workId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String title,
            String content,
            String episodeId,
            String workId,
            String userId,
            String comment,
            DateTime createdAt,
            DateTime updatedAt)
        episode,
    required TResult Function(
            String title,
            String content,
            String noticeId,
            String workId,
            String userId,
            String comment,
            DateTime createdAt,
            DateTime updatedAt)
        notice,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String title,
            String content,
            String episodeId,
            String workId,
            String userId,
            String comment,
            DateTime createdAt,
            DateTime updatedAt)?
        episode,
    TResult? Function(
            String title,
            String content,
            String noticeId,
            String workId,
            String userId,
            String comment,
            DateTime createdAt,
            DateTime updatedAt)?
        notice,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String title,
            String content,
            String episodeId,
            String workId,
            String userId,
            String comment,
            DateTime createdAt,
            DateTime updatedAt)?
        episode,
    TResult Function(
            String title,
            String content,
            String noticeId,
            String workId,
            String userId,
            String comment,
            DateTime createdAt,
            DateTime updatedAt)?
        notice,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Episode value) episode,
    required TResult Function(Notice value) notice,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Episode value)? episode,
    TResult? Function(Notice value)? notice,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Episode value)? episode,
    TResult Function(Notice value)? notice,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this WorkContent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkContentCopyWith<WorkContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkContentCopyWith<$Res> {
  factory $WorkContentCopyWith(
          WorkContent value, $Res Function(WorkContent) then) =
      _$WorkContentCopyWithImpl<$Res, WorkContent>;
  @useResult
  $Res call(
      {String title,
      String content,
      String workId,
      String userId,
      String comment,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$WorkContentCopyWithImpl<$Res, $Val extends WorkContent>
    implements $WorkContentCopyWith<$Res> {
  _$WorkContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
    Object? workId = null,
    Object? userId = null,
    Object? comment = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      workId: null == workId
          ? _value.workId
          : workId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EpisodeImplCopyWith<$Res>
    implements $WorkContentCopyWith<$Res> {
  factory _$$EpisodeImplCopyWith(
          _$EpisodeImpl value, $Res Function(_$EpisodeImpl) then) =
      __$$EpisodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String content,
      String episodeId,
      String workId,
      String userId,
      String comment,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$EpisodeImplCopyWithImpl<$Res>
    extends _$WorkContentCopyWithImpl<$Res, _$EpisodeImpl>
    implements _$$EpisodeImplCopyWith<$Res> {
  __$$EpisodeImplCopyWithImpl(
      _$EpisodeImpl _value, $Res Function(_$EpisodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
    Object? episodeId = null,
    Object? workId = null,
    Object? userId = null,
    Object? comment = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$EpisodeImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      episodeId: null == episodeId
          ? _value.episodeId
          : episodeId // ignore: cast_nullable_to_non_nullable
              as String,
      workId: null == workId
          ? _value.workId
          : workId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EpisodeImpl implements Episode {
  const _$EpisodeImpl(
      {required this.title,
      required this.content,
      required this.episodeId,
      required this.workId,
      required this.userId,
      required this.comment,
      required this.createdAt,
      required this.updatedAt,
      final String? $type})
      : $type = $type ?? 'episode';

  factory _$EpisodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$EpisodeImplFromJson(json);

  @override
  final String title;
  @override
  final String content;
  @override
  final String episodeId;
  @override
  final String workId;
  @override
  final String userId;
  @override
  final String comment;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'WorkContent.episode(title: $title, content: $content, episodeId: $episodeId, workId: $workId, userId: $userId, comment: $comment, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EpisodeImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.episodeId, episodeId) ||
                other.episodeId == episodeId) &&
            (identical(other.workId, workId) || other.workId == workId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, content, episodeId,
      workId, userId, comment, createdAt, updatedAt);

  /// Create a copy of WorkContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EpisodeImplCopyWith<_$EpisodeImpl> get copyWith =>
      __$$EpisodeImplCopyWithImpl<_$EpisodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String title,
            String content,
            String episodeId,
            String workId,
            String userId,
            String comment,
            DateTime createdAt,
            DateTime updatedAt)
        episode,
    required TResult Function(
            String title,
            String content,
            String noticeId,
            String workId,
            String userId,
            String comment,
            DateTime createdAt,
            DateTime updatedAt)
        notice,
  }) {
    return episode(title, content, episodeId, workId, userId, comment,
        createdAt, updatedAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String title,
            String content,
            String episodeId,
            String workId,
            String userId,
            String comment,
            DateTime createdAt,
            DateTime updatedAt)?
        episode,
    TResult? Function(
            String title,
            String content,
            String noticeId,
            String workId,
            String userId,
            String comment,
            DateTime createdAt,
            DateTime updatedAt)?
        notice,
  }) {
    return episode?.call(title, content, episodeId, workId, userId, comment,
        createdAt, updatedAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String title,
            String content,
            String episodeId,
            String workId,
            String userId,
            String comment,
            DateTime createdAt,
            DateTime updatedAt)?
        episode,
    TResult Function(
            String title,
            String content,
            String noticeId,
            String workId,
            String userId,
            String comment,
            DateTime createdAt,
            DateTime updatedAt)?
        notice,
    required TResult orElse(),
  }) {
    if (episode != null) {
      return episode(title, content, episodeId, workId, userId, comment,
          createdAt, updatedAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Episode value) episode,
    required TResult Function(Notice value) notice,
  }) {
    return episode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Episode value)? episode,
    TResult? Function(Notice value)? notice,
  }) {
    return episode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Episode value)? episode,
    TResult Function(Notice value)? notice,
    required TResult orElse(),
  }) {
    if (episode != null) {
      return episode(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EpisodeImplToJson(
      this,
    );
  }
}

abstract class Episode implements WorkContent {
  const factory Episode(
      {required final String title,
      required final String content,
      required final String episodeId,
      required final String workId,
      required final String userId,
      required final String comment,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$EpisodeImpl;

  factory Episode.fromJson(Map<String, dynamic> json) = _$EpisodeImpl.fromJson;

  @override
  String get title;
  @override
  String get content;
  String get episodeId;
  @override
  String get workId;
  @override
  String get userId;
  @override
  String get comment;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of WorkContent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EpisodeImplCopyWith<_$EpisodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoticeImplCopyWith<$Res>
    implements $WorkContentCopyWith<$Res> {
  factory _$$NoticeImplCopyWith(
          _$NoticeImpl value, $Res Function(_$NoticeImpl) then) =
      __$$NoticeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String content,
      String noticeId,
      String workId,
      String userId,
      String comment,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$NoticeImplCopyWithImpl<$Res>
    extends _$WorkContentCopyWithImpl<$Res, _$NoticeImpl>
    implements _$$NoticeImplCopyWith<$Res> {
  __$$NoticeImplCopyWithImpl(
      _$NoticeImpl _value, $Res Function(_$NoticeImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
    Object? noticeId = null,
    Object? workId = null,
    Object? userId = null,
    Object? comment = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$NoticeImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      noticeId: null == noticeId
          ? _value.noticeId
          : noticeId // ignore: cast_nullable_to_non_nullable
              as String,
      workId: null == workId
          ? _value.workId
          : workId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NoticeImpl implements Notice {
  const _$NoticeImpl(
      {required this.title,
      required this.content,
      required this.noticeId,
      required this.workId,
      required this.userId,
      required this.comment,
      required this.createdAt,
      required this.updatedAt,
      final String? $type})
      : $type = $type ?? 'notice';

  factory _$NoticeImpl.fromJson(Map<String, dynamic> json) =>
      _$$NoticeImplFromJson(json);

  @override
  final String title;
  @override
  final String content;
  @override
  final String noticeId;
  @override
  final String workId;
  @override
  final String userId;
  @override
  final String comment;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'WorkContent.notice(title: $title, content: $content, noticeId: $noticeId, workId: $workId, userId: $userId, comment: $comment, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoticeImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.noticeId, noticeId) ||
                other.noticeId == noticeId) &&
            (identical(other.workId, workId) || other.workId == workId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, content, noticeId, workId,
      userId, comment, createdAt, updatedAt);

  /// Create a copy of WorkContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NoticeImplCopyWith<_$NoticeImpl> get copyWith =>
      __$$NoticeImplCopyWithImpl<_$NoticeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String title,
            String content,
            String episodeId,
            String workId,
            String userId,
            String comment,
            DateTime createdAt,
            DateTime updatedAt)
        episode,
    required TResult Function(
            String title,
            String content,
            String noticeId,
            String workId,
            String userId,
            String comment,
            DateTime createdAt,
            DateTime updatedAt)
        notice,
  }) {
    return notice(title, content, noticeId, workId, userId, comment, createdAt,
        updatedAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String title,
            String content,
            String episodeId,
            String workId,
            String userId,
            String comment,
            DateTime createdAt,
            DateTime updatedAt)?
        episode,
    TResult? Function(
            String title,
            String content,
            String noticeId,
            String workId,
            String userId,
            String comment,
            DateTime createdAt,
            DateTime updatedAt)?
        notice,
  }) {
    return notice?.call(title, content, noticeId, workId, userId, comment,
        createdAt, updatedAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String title,
            String content,
            String episodeId,
            String workId,
            String userId,
            String comment,
            DateTime createdAt,
            DateTime updatedAt)?
        episode,
    TResult Function(
            String title,
            String content,
            String noticeId,
            String workId,
            String userId,
            String comment,
            DateTime createdAt,
            DateTime updatedAt)?
        notice,
    required TResult orElse(),
  }) {
    if (notice != null) {
      return notice(title, content, noticeId, workId, userId, comment,
          createdAt, updatedAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Episode value) episode,
    required TResult Function(Notice value) notice,
  }) {
    return notice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Episode value)? episode,
    TResult? Function(Notice value)? notice,
  }) {
    return notice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Episode value)? episode,
    TResult Function(Notice value)? notice,
    required TResult orElse(),
  }) {
    if (notice != null) {
      return notice(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NoticeImplToJson(
      this,
    );
  }
}

abstract class Notice implements WorkContent {
  const factory Notice(
      {required final String title,
      required final String content,
      required final String noticeId,
      required final String workId,
      required final String userId,
      required final String comment,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$NoticeImpl;

  factory Notice.fromJson(Map<String, dynamic> json) = _$NoticeImpl.fromJson;

  @override
  String get title;
  @override
  String get content;
  String get noticeId;
  @override
  String get workId;
  @override
  String get userId;
  @override
  String get comment;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of WorkContent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NoticeImplCopyWith<_$NoticeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
