import 'package:cozo/src/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRepo {
  Future<Either<Failure, User>> login(
      {required String email, required String password});

  Future<Either<Failure, User>> signUp(
      {required String userName,
      required String email,
      required String password});

  Future<Either<Failure, void>> forgetPassword({required String email});
}
