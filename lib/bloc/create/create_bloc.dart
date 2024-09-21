import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:open_path_hackathon/service/create/create_service.dart';
import 'package:open_path_hackathon/service/token/token_service.dart';

part 'create_event.dart';

part 'create_state.dart';

part 'create_bloc.freezed.dart';

class CreateBloc extends Bloc<CreateEvent, CreateState> {
  CreateBloc() : super(const CreateState.initial()) {}

  final CreateService createService = CreateService();

  Future<void> postCreate(_Create event, Emitter<CreateState> state) async {
    emit(const CreateState.loading());
    final data = await createService.postCreate(
      event.fullname,
      event.phone_number,
      event.username,
      event.password,
      event.passport_image,
    );
    data.fold(
      (error) => emit(CreateState.error(error)),
      (data) => CreateState.success(data),
    );
  }
}
