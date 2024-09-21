part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.started() = _Started;

  const factory LoginEvent.getToken(String username, String password) =
      _GetToken;

  const factory LoginEvent.reset() = _Reset;
}
