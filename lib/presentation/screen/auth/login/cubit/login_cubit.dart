import 'package:bloc/bloc.dart';
import 'package:career_coach/data/api_response/api_exception.dart';
import 'package:career_coach/data/local/local_cache.dart';
import 'package:career_coach/domain/use_case/login_use_case.dart';
import 'package:career_coach/presentation/core/di/di_config.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final loginUseCase = getIt<LoginUseCase>();

  Future<void> init() async {
    final login = await LocalCache.getString(StringCache.login);
    final password = await LocalCache.getString(StringCache.password);
    final rememberMe = await LocalCache.getBool(StringCache.rememberMe);
    emit(LoginLoaded(login: login, password: password, rememberMe: rememberMe));
  }

  Future<void> login({required String login, required String password, required bool rememberMe}) async {
    final currentState = state as LoginLoaded;
    emit(LoginLoading());
    try {
      print("TrungLQ: Login successful with login: $login, password: $password, rememberMe: $rememberMe");
      await loginUseCase.call(login: login, password: password);
      print("TrungLQ: Login successful with login: $login, password: $password, rememberMe: $rememberMe");
      if (rememberMe) {
        await LocalCache.setString(StringCache.login, login);
        await LocalCache.setString(StringCache.password, password);
        await LocalCache.setBool(StringCache.rememberMe, true);
      } else {
        await LocalCache.setString(StringCache.login, '');
        await LocalCache.setString(StringCache.password, '');
        await LocalCache.setBool(StringCache.rememberMe, false);
      }
      emit(LoginSuccess());
    } on ApiException catch (e) {
      emit(LoginError(error: e.toString()));
      emit(LoginLoaded(login: login, password: password, rememberMe: rememberMe));
    }
  }
}
