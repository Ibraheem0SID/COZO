import 'package:bloc/bloc.dart';
import 'package:cozo/src/features/auth/data/repo/auth_repo.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());

  final AuthRepo authRepo;

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    var response = await authRepo.login(email: email, password: password);
    response.fold((error) => emit(LoginFailure(error.message)),
        (user) => LoginSuccess(user));
  }
}
