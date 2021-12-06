import 'package:capstone_apps/common/failure.dart';
import 'package:capstone_apps/domain/entities/user.dart';
import 'package:capstone_apps/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SignInUser {
  AuthRepository repository;

  SignInUser(this.repository);

  Future<Either<Failure, Users>> execute(String email, String password) {
    return repository.signIn(email, password);
  }
}
