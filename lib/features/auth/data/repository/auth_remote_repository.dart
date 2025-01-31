import 'package:dartz/dartz.dart';
import 'package:food_hub/core/error/failure.dart';
import 'package:food_hub/features/auth/data/data_source/remote_datasource/remote_datasource.dart';
import 'package:food_hub/features/auth/domain/entity/auth_entity.dart';
import 'package:food_hub/features/auth/domain/repository/auth_repository.dart';

class AuthRemoteRepository implements IAuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRemoteRepository(this._authRemoteDataSource);

  @override
  Future<Either<Failure, AuthEntity>> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> loginUser(
      String email, String password) async {
    try {
      final student = await _authRemoteDataSource.loginUser(email, password);
      return Right(student);
    } catch (e) {
      return Left(
        LocalDatabaseFailure(
          message: 'Login failed: $e',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> registerUser(AuthEntity user) async {
    try {
      await _authRemoteDataSource.registerUser(user);
      return const Right(null);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }
}
