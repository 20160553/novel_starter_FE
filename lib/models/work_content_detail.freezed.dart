// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_content_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkContentDetail _$WorkContentDetailFromJson(Map<String, dynamic> json) {
  return _WorkContentDetail.fromJson(json);
}

/// @nodoc
mixin _$WorkContentDetail {
  String get contentDetailId => throw _privateConstructorUsedError;
  String get workContentId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;

  /// Serializes this WorkContentDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkContentDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkContentDetailCopyWith<WorkContentDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkContentDetailCopyWith<$Res> {
  factory $WorkContentDetailCopyWith(
          WorkContentDetail value, $Res Function(WorkContentDetail) then) =
      _$WorkContentDetailCopyWithImpl<$Res, WorkContentDetail>;
  @useResult
  $Res call(
      {String contentDetailId,
      String workContentId,
      String userId,
      String body,
      String comment});
}

/// @nodoc
class _$WorkContentDetailCopyWithImpl<$Res, $Val extends WorkContentDetail>
    implements $WorkContentDetailCopyWith<$Res> {
  _$WorkContentDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkContentDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentDetailId = null,
    Object? workContentId = null,
    Object? userId = null,
    Object? body = null,
    Object? comment = null,
  }) {
    return _then(_value.copyWith(
      contentDetailId: null == contentDetailId
          ? _value.contentDetailId
          : contentDetailId // ignore: cast_nullable_to_non_nullable
              as String,
      workContentId: null == workContentId
          ? _value.workContentId
          : workContentId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkContentDetailImplCopyWith<$Res>
    implements $WorkContentDetailCopyWith<$Res> {
  factory _$$WorkContentDetailImplCopyWith(_$WorkContentDetailImpl value,
          $Res Function(_$WorkContentDetailImpl) then) =
      __$$WorkContentDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String contentDetailId,
      String workContentId,
      String userId,
      String body,
      String comment});
}

/// @nodoc
class __$$WorkContentDetailImplCopyWithImpl<$Res>
    extends _$WorkContentDetailCopyWithImpl<$Res, _$WorkContentDetailImpl>
    implements _$$WorkContentDetailImplCopyWith<$Res> {
  __$$WorkContentDetailImplCopyWithImpl(_$WorkContentDetailImpl _value,
      $Res Function(_$WorkContentDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkContentDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentDetailId = null,
    Object? workContentId = null,
    Object? userId = null,
    Object? body = null,
    Object? comment = null,
  }) {
    return _then(_$WorkContentDetailImpl(
      contentDetailId: null == contentDetailId
          ? _value.contentDetailId
          : contentDetailId // ignore: cast_nullable_to_non_nullable
              as String,
      workContentId: null == workContentId
          ? _value.workContentId
          : workContentId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkContentDetailImpl implements _WorkContentDetail {
  const _$WorkContentDetailImpl(
      {required this.contentDetailId,
      required this.workContentId,
      required this.userId,
      required this.body,
      required this.comment});

  factory _$WorkContentDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkContentDetailImplFromJson(json);

  @override
  final String contentDetailId;
  @override
  final String workContentId;
  @override
  final String userId;
  @override
  final String body;
  @override
  final String comment;

  @override
  String toString() {
    return 'WorkContentDetail(contentDetailId: $contentDetailId, workContentId: $workContentId, userId: $userId, body: $body, comment: $comment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkContentDetailImpl &&
            (identical(other.contentDetailId, contentDetailId) ||
                other.contentDetailId == contentDetailId) &&
            (identical(other.workContentId, workContentId) ||
                other.workContentId == workContentId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, contentDetailId, workContentId, userId, body, comment);

  /// Create a copy of WorkContentDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkContentDetailImplCopyWith<_$WorkContentDetailImpl> get copyWith =>
      __$$WorkContentDetailImplCopyWithImpl<_$WorkContentDetailImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkContentDetailImplToJson(
      this,
    );
  }
}

abstract class _WorkContentDetail implements WorkContentDetail {
  const factory _WorkContentDetail(
      {required final String contentDetailId,
      required final String workContentId,
      required final String userId,
      required final String body,
      required final String comment}) = _$WorkContentDetailImpl;

  factory _WorkContentDetail.fromJson(Map<String, dynamic> json) =
      _$WorkContentDetailImpl.fromJson;

  @override
  String get contentDetailId;
  @override
  String get workContentId;
  @override
  String get userId;
  @override
  String get body;
  @override
  String get comment;

  /// Create a copy of WorkContentDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkContentDetailImplCopyWith<_$WorkContentDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
