import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_state.freezed.dart';

@Freezed(genericArgumentFactories: true)
sealed class ApiState<T> with _$ApiState<T> {
  const factory ApiState.loading() = LoadingState<T>;
  const factory ApiState.success({required T data}) = SuccessState<T>;
  const factory ApiState.error({required Exception error}) = ErrorState<T>;
}