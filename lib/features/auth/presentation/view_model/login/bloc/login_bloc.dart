import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_hub/features/auth/domain/use_case/login_use_case.dart';
import 'package:food_hub/features/auth/presentation/view_model/signup/bloc/signup_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(
      {required SignupBloc signupBloc, required LoginUsecase loginUseCase})
      : super(LoginState.initial()) {
    // Handle navigation to the Login screen
    on<NavigateRegisterScreenEvent>((event, emit) {
      _handleNavigationToRegisterScreen(event);
    });
  }

  void _handleNavigationToRegisterScreen(NavigateRegisterScreenEvent event) {
    Navigator.push(
      event.context,
      MaterialPageRoute(
        builder: (context) =>
            event.destination, // Destination widget (e.g., LoginPage)
      ),
    );
  }
}
