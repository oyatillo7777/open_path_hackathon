import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:open_path_hackathon/service/create/create_service.dart';
import 'package:open_path_hackathon/widget/snac_bar_widget.dart';

part 'create_event.dart';
part 'create_state.dart';
part 'create_bloc.freezed.dart';

class CreateBloc extends Bloc<CreateEvent, CreateState> {
  final CreateService createService = CreateService();

  CreateBloc() : super(const CreateState.initial()) {
    on<_Create>((event, emit) => postCreate(event, emit));
  }

  Future<void> postCreate(_Create event, Emitter<CreateState> emit) async {
    emit(const CreateState.loading());
    final data = await createService.postCreate(
      event.fullname,
      event.phone_number,
      event.username,
      event.password,
      event.passport_image,
    );

    data.fold(
          (error) {
        emit(CreateState.error(error));
        SnackBarWidget().showSnackbar("Error: $error", error, 2, 4);
      },
          (successMessage) {
            try {
              emit(CreateState.success(successMessage));
              SnackBarWidget().showSnackbar(
                  "Muvaffaqiyatli q'shildi", successMessage, 2, 4);
            }catch(e){

            }
      },
    );
  }
}
