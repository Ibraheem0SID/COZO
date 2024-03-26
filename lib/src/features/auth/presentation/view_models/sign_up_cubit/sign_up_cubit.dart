import 'package:bloc/bloc.dart';
import 'package:cozo/src/features/auth/data/repo/auth_repo.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());
  final AuthRepo authRepo;

  Future<void> signUp(
      {required String userName,
      required String email,
      required String password}) async {
    emit(SignUpLoading());
    var response = await authRepo.signUp(
        userName: userName, email: email, password: password);
    response.fold(
        (error) => SignUpFailure(error.message), (user) => SignUpSuccess(user));
  }
}
