import 'package:bloc/bloc.dart';
import 'package:cozo/src/features/auth/data/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.authRepo) : super(ForgetPasswordInitial());
  final AuthRepo authRepo;

  Future<void> forgetPassword({required String email}) async {
    emit(ForgetPasswordLoading());
    var response = await authRepo.forgetPassword(email: email);
    response.fold((error) => ForgetPasswordFailure(error.message), (r) => null);
  }
}
