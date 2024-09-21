part of 'create_bloc.dart';

@freezed
class CreateEvent with _$CreateEvent {
  const factory CreateEvent.started() = _Started;

  const factory CreateEvent.create(
    String fullname,
    String phone_number,
    String username,
    String password,
    String passport_image,
  ) = _Create;
}
