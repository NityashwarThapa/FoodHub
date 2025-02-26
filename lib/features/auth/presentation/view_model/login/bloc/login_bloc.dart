import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_hub/features/auth/domain/use_case/login_use_case.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase loginUseCase;

  LoginBloc(this.loginUseCase) : super(LoginState.initial()) {
    // Handle navigation to the Login screen
    on<NavigateRegisterScreenEvent>((event, emit) {
      _handleNavigationToRegisterScreen(event);
    });

    on<LoginStudentEvent>(
      (event, emit) async {
        emit(state.copyWith(isLoading: true));

        final result = await loginUseCase(LoginUserParams(email: event.email, password: event.password));
        result.fold(
          (failure) => emit(state.copyWith(isSuccess: false, isLoading: false)),
          (success) => emit(state.copyWith(isSuccess: true, isLoading: false)),
        );
      },
    );
  }

  void _handleNavigationToRegisterScreen(NavigateRegisterScreenEvent event) {
    Navigator.push(
      event.context,
      MaterialPageRoute(
        builder: (context) => event.destination,
      ),
    );
  }
}
