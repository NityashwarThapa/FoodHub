import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_hub/features/auth/domain/use_case/login_use_case.dart';
import 'package:food_hub/features/auth/presentation/view/login_page_view.dart';
import 'package:food_hub/features/auth/presentation/view_model/login/bloc/login_bloc.dart';
import 'package:food_hub/features/auth/presentation/view_model/signup/bloc/signup_bloc.dart';
import 'package:food_hub/features/home/presentation/view_model/cubit/home_cubit.dart';
import 'package:mocktail/mocktail.dart';

// Added mocktail dependency in pubspec.yaml to mock UI

// Mock dependencies
class MockRegisterBloc extends Mock implements SignupBloc {}

class MockHomeCubit extends Mock implements HomeCubit {}

class MockLoginUserUsecase extends Mock implements LoginUsecase {}

void main() {
  late LoginBloc loginBloc;
  late SignupBloc registerBloc;
  late HomeCubit homeCubit;
  late LoginUsecase loginUserUsecase;

  setUp(() {
    registerBloc = MockRegisterBloc();
    homeCubit = MockHomeCubit();
    loginUserUsecase = MockLoginUserUsecase();

    loginBloc = LoginBloc(
      signupBloc: registerBloc,
      loginUseCase: loginUserUsecase,
    );
  });

  testWidgets('Email and Password Validation', (WidgetTester tester) async {
    // Wrap the test with the required providers
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<LoginBloc>.value(
          value: loginBloc,
          child: LoginPage(),
        ),
      ),
    );

    // Find text fields
    final emailField = find.byKey(const Key('email'));
    final passwordField = find.byKey(const Key('password'));

    // Enter text
    await tester.enterText(emailField, 'nitu12@gmail.com');
    await tester.enterText(passwordField, 'nitu123');

    // Ensure UI updates
    await tester.pump();

    // Verify that the text has been entered correctly
    expect(find.text('nitu12@gmail.com'), findsOneWidget);
    expect(find.text('nitu123'), findsOneWidget);
  });

  testWidgets('Invalid Email and Password Validation',
      (WidgetTester tester) async {
    // Wrap the test with the required providers
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<LoginBloc>.value(
          value: loginBloc,
          child: LoginPage(),
        ),
      ),
    );

    // Find text fields
    final emailField = find.byKey(const Key('email'));
    final passwordField = find.byKey(const Key('password'));
    final loginButton = find.byKey(const Key('loginButton'));

    // Enter an invalid email and a short password
    await tester.enterText(emailField, 'invalid-email');
    await tester.enterText(passwordField, 'short');

    // Ensure UI updates
    await tester.pump();

    // Tap the login button
    await tester.tap(loginButton);
    await tester.pump();

    // Check for validation messages
    expect(find.text('Enter a valid email'), findsOneWidget);
    expect(find.text('Password must be at least 8 characters'), findsOneWidget);
  });
}

// import 'package:bloc_test/bloc_test.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:food_hub/core/error/failure.dart';
// import 'package:food_hub/features/auth/domain/use_case/login_use_case.dart';
// import 'package:food_hub/features/auth/presentation/view/login_page_view.dart';
// import 'package:food_hub/features/auth/presentation/view_model/login/bloc/login_bloc.dart';
// import 'package:food_hub/features/auth/presentation/view_model/signup/bloc/signup_bloc.dart';
// import 'package:mocktail/mocktail.dart';

// // Mocks
// class MockLoginUsecase extends Mock implements LoginUsecase {}

// class MockRegisterBloc extends MockBloc<SignupEvent, SignupState>
//     implements SignupBloc {}

// void main() {
//   late LoginBloc loginBloc;
//   late MockLoginUsecase loginUsecase;
//   late SignupBloc registerBloc;

//   setUp(() {
//     loginUsecase = MockLoginUsecase();
//     registerBloc = MockRegisterBloc();
//     loginBloc = LoginBloc(
//       signupBloc: registerBloc,
//       loginUseCase: loginUsecase,
//     );

//     registerFallbackValue(const LoginUserParams(email: '', password: ''));
//   });

//   group('LoginBloc Tests', () {
//     const validEmail = 'test@gmail.com';
//     const validPassword = 'password123';
//     const loginParams =
//         LoginUserParams(email: validEmail, password: validPassword);

//     blocTest<LoginBloc, LoginState>(
//       'emits [isLoading=true, isSuccess=true] when login succeeds',
//       build: () {
//         when(() => loginUsecase.call(any()))
//             .thenAnswer((_) async => const Right('token'));
//         return loginBloc;
//       },
//       act: (bloc) => bloc.add(
//           const LoginStudentEvent(email: validEmail, password: validPassword)),
//       expect: () => [
//         LoginState.initial().copyWith(isLoading: true),
//         LoginState.initial().copyWith(isLoading: false, isSuccess: true),
//       ],
//       verify: (_) {
//         verify(() => loginUsecase.call(loginParams)).called(1);
//       },
//     );

//     blocTest<LoginBloc, LoginState>(
//       'emits [isLoading=true, isSuccess=false] when login fails',
//       build: () {
//         when(() => loginUsecase.call(any())).thenAnswer(
//             (_) async => Left(ApiFailure(message: 'Invalid credentials')));
//         return loginBloc;
//       },
//       act: (bloc) => bloc.add(
//           const LoginStudentEvent(email: validEmail, password: validPassword)),
//       expect: () => [
//         LoginState.initial().copyWith(isLoading: true),
//         LoginState.initial().copyWith(isLoading: false, isSuccess: false),
//       ],
//       verify: (_) {
//         verify(() => loginUsecase.call(loginParams)).called(1);
//       },
//     );
//   });

//   tearDown(() {
//     reset(loginUsecase);
//     reset(registerBloc);
//   });

//   testWidgets('Valid Email and Password Input', (WidgetTester tester) async {
//     await tester.pumpWidget(
//       MaterialApp(
//         home: BlocProvider<LoginBloc>.value(
//           value: loginBloc,
//           child: LoginPage(),
//         ),
//       ),
//     );

//     final emailField = find.byKey(const Key('email'));
//     final passwordField = find.byKey(const Key('password'));

//     await tester.enterText(emailField, 'nitu12gmail.com');
//     await tester.enterText(passwordField, 'nitu123');

//     await tester.pump();

//     expect(find.text('nitu12@gmail.com'), findsOneWidget);
//     expect(find.text('nitu123'), findsOneWidget);
//   });

//   testWidgets('Invalid Email and Password Validation',
//       (WidgetTester tester) async {
//     await tester.pumpWidget(
//       MaterialApp(
//         home: BlocProvider<LoginBloc>.value(
//           value: loginBloc,
//           child: LoginPage(),
//         ),
//       ),
//     );

//     final emailField = find.byKey(const Key('email'));
//     final passwordField = find.byKey(const Key('password'));
//     final loginButton = find.byKey(const Key('loginButton'));

//     await tester.ensureVisible(loginButton);

//     await tester.enterText(emailField, 'invalid-email');
//     await tester.enterText(passwordField, 'short');

//     await tester.pump();

//     await tester.tap(loginButton);
//     await tester.pump();

//     expect(find.text('Enter a valid email address'), findsOneWidget);
//     expect(find.text('Password must be at least 8 characters'), findsOneWidget);
//   });
// }
