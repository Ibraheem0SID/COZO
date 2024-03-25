import 'package:cozo/src/core/error/failure.dart';
import 'package:cozo/src/features/auth/data/repo/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthSupabaseRepoImpl implements AuthRepo {
  final SupabaseClient supabase;

  AuthSupabaseRepoImpl(this.supabase);

  @override
  Future<Either<Failure, void>> forgetPassword({required String email}) async {
    try {
      var response = await supabase.auth.resetPasswordForEmail(email);
      return const Right(null);
    } on AuthException catch (exception) {
      return Left(RequestFail.fromSupabaseError(exception));
    }
  }

  @override
  Future<Either<Failure, User>> login(
      {required String email, required String password}) async {
    try {
      AuthResponse response = await supabase.auth
          .signInWithPassword(email: email, password: password);
      return Right(response.user!);
    } on AuthException catch (exception) {
      return Left(RequestFail.fromSupabaseError(exception));
    }
  }

  @override
  Future<Either<Failure, User>> signUp(
      {required String userName,
      required String email,
      required String password}) async {
    try {
      AuthResponse response = await supabase.auth.signUp(
          email: email, password: password, data: {'use_name': userName});
      return Right(response.user!);
    } on AuthException catch (exception) {
      return Left(RequestFail.fromSupabaseError(exception));
    }
  }
}
