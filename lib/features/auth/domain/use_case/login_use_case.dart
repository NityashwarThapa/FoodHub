import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:food_hub/app/usecase/usecase.dart';
import 'package:food_hub/core/error/failure.dart';
import 'package:food_hub/features/auth/domain/repository/auth_repository.dart';

class LoginUserParams extends Equatable {
  final String email;
  final String password;

  const LoginUserParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}

class LoginUseCase implements UsecaseWithParams<void, LoginUserParams> {
  final IAuthRepository authRepository;

  const LoginUseCase({required this.authRepository});

  @override
  Future<Either<Failure, void>> call(LoginUserParams params) async {
    return await authRepository.loginUser(params.email, params.password);
  }
}
