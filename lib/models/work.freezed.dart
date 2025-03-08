// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Work _$WorkFromJson(Map<String, dynamic> json) {
  return _Work.fromJson(json);
}

/// @nodoc
mixin _$Work {
  String get title => throw _privateConstructorUsedError;
  String get description =>
      throw _privateConstructorUsedError; // required int genreId,
// required int ageId,
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String get workId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get thumbnailImgUrl => throw _privateConstructorUsedError;

  /// Serializes this Work to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Work
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkCopyWith<Work> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkCopyWith<$Res> {
  factory $WorkCopyWith(Work value, $Res Function(Work) then) =
      _$WorkCopyWithImpl<$Res, Work>;
  @useResult
  $Res call(
      {String title,
      String description,
      DateTime createdAt,
      DateTime updatedAt,
      String workId,
      String userId,
      String thumbnailImgUrl});
}

/// @nodoc
class _$WorkCopyWithImpl<$Res, $Val extends Work>
    implements $WorkCopyWith<$Res> {
  _$WorkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Work
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? workId = null,
    Object? userId = null,
    Object? thumbnailImgUrl = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      workId: null == workId
          ? _value.workId
          : workId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailImgUrl: null == thumbnailImgUrl
          ? _value.thumbnailImgUrl
          : thumbnailImgUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkImplCopyWith<$Res> implements $WorkCopyWith<$Res> {
  factory _$$WorkImplCopyWith(
          _$WorkImpl value, $Res Function(_$WorkImpl) then) =
      __$$WorkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String description,
      DateTime createdAt,
      DateTime updatedAt,
      String workId,
      String userId,
      String thumbnailImgUrl});
}

/// @nodoc
class __$$WorkImplCopyWithImpl<$Res>
    extends _$WorkCopyWithImpl<$Res, _$WorkImpl>
    implements _$$WorkImplCopyWith<$Res> {
  __$$WorkImplCopyWithImpl(_$WorkImpl _value, $Res Function(_$WorkImpl) _then)
      : super(_value, _then);

  /// Create a copy of Work
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? workId = null,
    Object? userId = null,
    Object? thumbnailImgUrl = null,
  }) {
    return _then(_$WorkImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      workId: null == workId
          ? _value.workId
          : workId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailImgUrl: null == thumbnailImgUrl
          ? _value.thumbnailImgUrl
          : thumbnailImgUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkImpl implements _Work {
  _$WorkImpl(
      {required this.title,
      required this.description,
      required this.createdAt,
      required this.updatedAt,
      required this.workId,
      required this.userId,
      this.thumbnailImgUrl = imageUrlMockup});

  factory _$WorkImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkImplFromJson(json);

  @override
  final String title;
  @override
  final String description;
// required int genreId,
// required int ageId,
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final String workId;
  @override
  final String userId;
  @override
  @JsonKey()
  final String thumbnailImgUrl;

  @override
  String toString() {
    return 'Work(title: $title, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, workId: $workId, userId: $userId, thumbnailImgUrl: $thumbnailImgUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.workId, workId) || other.workId == workId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.thumbnailImgUrl, thumbnailImgUrl) ||
                other.thumbnailImgUrl == thumbnailImgUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, description, createdAt,
      updatedAt, workId, userId, thumbnailImgUrl);

  /// Create a copy of Work
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkImplCopyWith<_$WorkImpl> get copyWith =>
      __$$WorkImplCopyWithImpl<_$WorkImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkImplToJson(
      this,
    );
  }
}

abstract class _Work implements Work {
  factory _Work(
      {required final String title,
      required final String description,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final String workId,
      required final String userId,
      final String thumbnailImgUrl}) = _$WorkImpl;

  factory _Work.fromJson(Map<String, dynamic> json) = _$WorkImpl.fromJson;

  @override
  String get title;
  @override
  String get description; // required int genreId,
// required int ageId,
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  String get workId;
  @override
  String get userId;
  @override
  String get thumbnailImgUrl;

  /// Create a copy of Work
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkImplCopyWith<_$WorkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
