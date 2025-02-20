// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'join_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$JoinResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() duplicated,
    required TResult Function() unDuplicated,
    required TResult Function() success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? duplicated,
    TResult? Function()? unDuplicated,
    TResult? Function()? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? duplicated,
    TResult Function()? unDuplicated,
    TResult Function()? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DuplicatedUsername value) duplicated,
    required TResult Function(UnDuplicatedUsername value) unDuplicated,
    required TResult Function(JoinSuccess value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DuplicatedUsername value)? duplicated,
    TResult? Function(UnDuplicatedUsername value)? unDuplicated,
    TResult? Function(JoinSuccess value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DuplicatedUsername value)? duplicated,
    TResult Function(UnDuplicatedUsername value)? unDuplicated,
    TResult Function(JoinSuccess value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JoinResultCopyWith<$Res> {
  factory $JoinResultCopyWith(
          JoinResult value, $Res Function(JoinResult) then) =
      _$JoinResultCopyWithImpl<$Res, JoinResult>;
}

/// @nodoc
class _$JoinResultCopyWithImpl<$Res, $Val extends JoinResult>
    implements $JoinResultCopyWith<$Res> {
  _$JoinResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JoinResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$DuplicatedUsernameImplCopyWith<$Res> {
  factory _$$DuplicatedUsernameImplCopyWith(_$DuplicatedUsernameImpl value,
          $Res Function(_$DuplicatedUsernameImpl) then) =
      __$$DuplicatedUsernameImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DuplicatedUsernameImplCopyWithImpl<$Res>
    extends _$JoinResultCopyWithImpl<$Res, _$DuplicatedUsernameImpl>
    implements _$$DuplicatedUsernameImplCopyWith<$Res> {
  __$$DuplicatedUsernameImplCopyWithImpl(_$DuplicatedUsernameImpl _value,
      $Res Function(_$DuplicatedUsernameImpl) _then)
      : super(_value, _then);

  /// Create a copy of JoinResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DuplicatedUsernameImpl implements DuplicatedUsername {
  const _$DuplicatedUsernameImpl();

  @override
  String toString() {
    return 'JoinResult.duplicated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DuplicatedUsernameImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() duplicated,
    required TResult Function() unDuplicated,
    required TResult Function() success,
  }) {
    return duplicated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? duplicated,
    TResult? Function()? unDuplicated,
    TResult? Function()? success,
  }) {
    return duplicated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? duplicated,
    TResult Function()? unDuplicated,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (duplicated != null) {
      return duplicated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DuplicatedUsername value) duplicated,
    required TResult Function(UnDuplicatedUsername value) unDuplicated,
    required TResult Function(JoinSuccess value) success,
  }) {
    return duplicated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DuplicatedUsername value)? duplicated,
    TResult? Function(UnDuplicatedUsername value)? unDuplicated,
    TResult? Function(JoinSuccess value)? success,
  }) {
    return duplicated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DuplicatedUsername value)? duplicated,
    TResult Function(UnDuplicatedUsername value)? unDuplicated,
    TResult Function(JoinSuccess value)? success,
    required TResult orElse(),
  }) {
    if (duplicated != null) {
      return duplicated(this);
    }
    return orElse();
  }
}

abstract class DuplicatedUsername implements JoinResult {
  const factory DuplicatedUsername() = _$DuplicatedUsernameImpl;
}

/// @nodoc
abstract class _$$UnDuplicatedUsernameImplCopyWith<$Res> {
  factory _$$UnDuplicatedUsernameImplCopyWith(_$UnDuplicatedUsernameImpl value,
          $Res Function(_$UnDuplicatedUsernameImpl) then) =
      __$$UnDuplicatedUsernameImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnDuplicatedUsernameImplCopyWithImpl<$Res>
    extends _$JoinResultCopyWithImpl<$Res, _$UnDuplicatedUsernameImpl>
    implements _$$UnDuplicatedUsernameImplCopyWith<$Res> {
  __$$UnDuplicatedUsernameImplCopyWithImpl(_$UnDuplicatedUsernameImpl _value,
      $Res Function(_$UnDuplicatedUsernameImpl) _then)
      : super(_value, _then);

  /// Create a copy of JoinResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UnDuplicatedUsernameImpl implements UnDuplicatedUsername {
  const _$UnDuplicatedUsernameImpl();

  @override
  String toString() {
    return 'JoinResult.unDuplicated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnDuplicatedUsernameImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() duplicated,
    required TResult Function() unDuplicated,
    required TResult Function() success,
  }) {
    return unDuplicated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? duplicated,
    TResult? Function()? unDuplicated,
    TResult? Function()? success,
  }) {
    return unDuplicated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? duplicated,
    TResult Function()? unDuplicated,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (unDuplicated != null) {
      return unDuplicated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DuplicatedUsername value) duplicated,
    required TResult Function(UnDuplicatedUsername value) unDuplicated,
    required TResult Function(JoinSuccess value) success,
  }) {
    return unDuplicated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DuplicatedUsername value)? duplicated,
    TResult? Function(UnDuplicatedUsername value)? unDuplicated,
    TResult? Function(JoinSuccess value)? success,
  }) {
    return unDuplicated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DuplicatedUsername value)? duplicated,
    TResult Function(UnDuplicatedUsername value)? unDuplicated,
    TResult Function(JoinSuccess value)? success,
    required TResult orElse(),
  }) {
    if (unDuplicated != null) {
      return unDuplicated(this);
    }
    return orElse();
  }
}

abstract class UnDuplicatedUsername implements JoinResult {
  const factory UnDuplicatedUsername() = _$UnDuplicatedUsernameImpl;
}

/// @nodoc
abstract class _$$JoinSuccessImplCopyWith<$Res> {
  factory _$$JoinSuccessImplCopyWith(
          _$JoinSuccessImpl value, $Res Function(_$JoinSuccessImpl) then) =
      __$$JoinSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$JoinSuccessImplCopyWithImpl<$Res>
    extends _$JoinResultCopyWithImpl<$Res, _$JoinSuccessImpl>
    implements _$$JoinSuccessImplCopyWith<$Res> {
  __$$JoinSuccessImplCopyWithImpl(
      _$JoinSuccessImpl _value, $Res Function(_$JoinSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of JoinResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$JoinSuccessImpl implements JoinSuccess {
  const _$JoinSuccessImpl();

  @override
  String toString() {
    return 'JoinResult.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$JoinSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() duplicated,
    required TResult Function() unDuplicated,
    required TResult Function() success,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? duplicated,
    TResult? Function()? unDuplicated,
    TResult? Function()? success,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? duplicated,
    TResult Function()? unDuplicated,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DuplicatedUsername value) duplicated,
    required TResult Function(UnDuplicatedUsername value) unDuplicated,
    required TResult Function(JoinSuccess value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DuplicatedUsername value)? duplicated,
    TResult? Function(UnDuplicatedUsername value)? unDuplicated,
    TResult? Function(JoinSuccess value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DuplicatedUsername value)? duplicated,
    TResult Function(UnDuplicatedUsername value)? unDuplicated,
    TResult Function(JoinSuccess value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class JoinSuccess implements JoinResult {
  const factory JoinSuccess() = _$JoinSuccessImpl;
}
