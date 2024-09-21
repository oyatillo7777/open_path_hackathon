part of 'create_bloc.dart';

@freezed
class CreateState with _$CreateState {
  const factory CreateState.initial() = _Initial;
  const factory CreateState.loading() = _Loading;
  const factory CreateState.success(String message) = _Success;
  const factory CreateState.error(String error) = _error;
}
