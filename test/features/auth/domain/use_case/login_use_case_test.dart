import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_hub/app/shared_prefs/token_shared_prefs.dart';
import 'package:food_hub/core/error/failure.dart';
import 'package:food_hub/features/auth/domain/repository/auth_repository.dart';
import 'package:food_hub/features/auth/domain/use_case/login_use_case.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

class MockTokenSharedPrefs extends Mock implements TokenSharedPrefs {}

void main() {
  late MockAuthRepository repository;
  late MockTokenSharedPrefs tokenSharedPrefs;
  late LoginUsecase usecase;

  setUp(() {
    repository = MockAuthRepository();
    tokenSharedPrefs = MockTokenSharedPrefs();
    usecase = LoginUsecase(
        authRepository: repository, tokenSharedPrefs: tokenSharedPrefs);

    registerFallbackValue(
        const LoginUserParams(email: 'test@gmail.com', password: 'test123'));
  });

  test(
      'should call the [AuthRepo.login] with correct email and password (anjali@gmail.com, anjali123)',
      () async {
    when(() => repository.loginUser(any(), any())).thenAnswer(
      (invocation) async {
        final email = invocation.positionalArguments[0] as String;
        final password = invocation.positionalArguments[1] as String;
        if (email == 'nitu12@gmail.com' && password == 'nitu123') {
          return Future.value(const Right('token'));
        } else {
          return Future.value(
              const Left(ApiFailure(message: 'Invalid email or password')));
        }
      },
    );

    when(() => tokenSharedPrefs.saveToken(any())).thenAnswer(
      (_) async => const Right(null),
    );

    final result = await usecase(
        const LoginUserParams(email: 'nitu12@gmail.com', password: 'nitu123'));

    expect(result, const Right('token'));

    verify(() => repository.loginUser(any(), any())).called(1);
    verify(() => tokenSharedPrefs.saveToken(any())).called(1);

    verifyNoMoreInteractions(repository);
    verifyNoMoreInteractions(tokenSharedPrefs);
  });

  test('should return a token when login is successful', () async {
    const email = 'nitu12@gmail.com';
    const password = 'nitu123';
    const token = 'mock_token';
    const loginParams = LoginUserParams(email: email, password: password);

    when(() => repository.loginUser(any(), any()))
        .thenAnswer((_) async => const Right(token));

    when(() => tokenSharedPrefs.saveToken(any()))
        .thenAnswer((_) async => const Right(null));

    when(() => tokenSharedPrefs.getToken())
        .thenAnswer((_) async => Future.value(const Right(token)));

    final result = await usecase(loginParams);

    expect(result, const Right(token));

    verify(() => repository.loginUser(email, password)).called(1);
    verify(() => tokenSharedPrefs.saveToken(token)).called(1);
    // verify(() => tokenSharedPrefs.getToken()).called(1);
  });

  test('should return a failure when login fails', () async {
    when(() => repository.loginUser(any(), any())).thenAnswer(
      (_) async => const Left(ApiFailure(message: "Invalid login")),
    );

    final result = await usecase(
        const LoginUserParams(email: 'wrong@gmail.com', password: 'wrongPass'));

    expect(result, const Left(ApiFailure(message: "Invalid login")));

    verify(() => repository.loginUser(any(), any())).called(1);
    verifyNever(() => tokenSharedPrefs.saveToken(any()));
  });

  tearDown(() {
    reset(repository);
    reset(tokenSharedPrefs);
  });
}
