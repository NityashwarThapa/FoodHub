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
