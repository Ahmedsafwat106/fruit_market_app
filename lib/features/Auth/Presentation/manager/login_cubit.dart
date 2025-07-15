import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';
import 'package:ahmedsafwat/features/Auth/data/repositories/auth_repo_impl.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      await AuthRepoImpl().login(email: email, password: password);
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure(errorMessage: e.toString()));
    }
  }
}
