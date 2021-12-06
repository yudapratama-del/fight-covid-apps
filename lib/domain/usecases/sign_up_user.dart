import 'package:capstone_apps/common/failure.dart';
import 'package:capstone_apps/domain/entities/user.dart';
import 'package:capstone_apps/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SignUpUser {
  final AuthRepository repository;

  SignUpUser(this.repository);

  Future<Either<Failure, Users>> execute(Users user, String password) {
    return repository.signUp(user, password);
  }
}
