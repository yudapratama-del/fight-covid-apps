import 'package:capstone_apps/common/failure.dart';
import 'package:capstone_apps/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, Users>> signIn(String email, String password);
  Future<Either<Failure, Users>> signUp(Users user, String password);
}
