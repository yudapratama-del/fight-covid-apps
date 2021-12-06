import 'dart:io';

import 'package:capstone_apps/common/exception.dart';
import 'package:capstone_apps/common/failure.dart';
import 'package:capstone_apps/data/datasources/auth_remote_data_source.dart';
import 'package:capstone_apps/domain/entities/user.dart';
import 'package:capstone_apps/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRemotDataSource authRemotDataSource;

  AuthRepositoryImpl({required this.authRemotDataSource});

  @override
  Future<Either<Failure, Users>> signIn(String email, String password) async {
    try {
      final result = await authRemotDataSource.signInUser(email, password);

      return right(result.toEntity());
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure(e.toString()));
    } on SocketException {
      return Left(ConncetionFailure("Failed to connect to the network"));
    }
  }

  @override
  Future<Either<Failure, Users>> signUp(Users user, String password) async {
    try {
      final result = await authRemotDataSource.signUpUser(
        user.toModel(),
        password,
      );

      return Right(result.toEntity());
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure(e.toString()));
    } on SocketException {
      return Left(ConncetionFailure("Failed to connect to the network"));
    }
  }
}
