import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:open_path_hackathon/model/login_model.dart';
import 'package:open_path_hackathon/service/token/token_service.dart';
import 'package:open_path_hackathon/tools/locator.dart';
import 'package:open_path_hackathon/tools/pref.dart';

part 'login_event.dart';

part 'login_state.dart';

part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState.initial()) {
    on<_GetToken>((event, emit) => getTokenBloc(event, emit));
    on<_Reset>((event, emit) => emit(const LoginState.initial())); // Handle reset event

  }

  final TokenService tokenService = TokenService();

  Future<void> getTokenBloc(_GetToken event, Emitter<LoginState> state) async {
    emit(const LoginState.loading());
    final data = await tokenService.getToken(event.username, event.password);
    data.fold((error) => emit(LoginState.error(error)), (data) async {
      bool success =
          await getIt.get<PrefUtils>().saveToken(data.accessToken ?? "");
      print("================${data.accessToken}");
      if (success) {
        emit(LoginState.success(data));
      }
    });
  }
}
