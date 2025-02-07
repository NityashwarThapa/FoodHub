// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';
// import 'package:food_hub/app/usecase/usecase.dart';
// import 'package:food_hub/core/error/failure.dart';
// import 'package:food_hub/features/auth/domain/repository/auth_repository.dart';

// class LoginUserParams extends Equatable {
//   final String email;
//   final String password;

//   const LoginUserParams({
//     required this.email,
//     required this.password,
//   });

//   @override
//   List<Object?> get props => [email, password];
// }

// class LoginUseCase implements UsecaseWithParams<void, LoginUserParams> {
//   final IAuthRepository authRepository;

//   const LoginUseCase({required this.authRepository});

//   @override
//   Future<Either<Failure, void>> call(LoginUserParams params) async {
//     return await authRepository.loginUser(params.email, params.password);
//   }
// }

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:food_hub/app/shared_prefs/token_shared_prefs.dart';
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
  List<Object?> get props => [
        email,
        password,
      ];
}

class LoginUsecase implements UsecaseWithParams<void, LoginUserParams> {
  final IAuthRepository authRepository;
  final TokenSharedPrefs tokenSharedPrefs;

  LoginUsecase({required this.authRepository, required this.tokenSharedPrefs});
  @override
  Future<Either<Failure, void>> call(LoginUserParams params) {
    //save token in shared preferences
    return authRepository
        .loginUser(params.email, params.password)
        .then((value) {
      return value.fold(
        (failure) => left(failure),
        (token) {
          tokenSharedPrefs.saveToken(token);
          // tokenSharedPrefs.getToken().then((value) {
          //   print(value);
          // });
          return Right(token);
        },
      );
    });
  }
}
