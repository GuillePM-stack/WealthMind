import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wealthmind/src/presentation/utils/bloc_form_item.dart';
import 'package:wealthmind/src/presentation/pages/auth/login/bloc/LoginSate.dart';
import 'package:wealthmind/src/presentation/pages/auth/login/bloc/LoginEvent.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final formKey = GlobalKey<FormState>();

  LoginBloc() : super(LoginState()) {
    on<LoginEvent>((event, emit) {
      emit(state.copyWith(formkey: formKey));
    });

    on<EmailChanged>((event, emit) {
      emit(
        state.copyWith(
          email: BlocFormItem(
            value: event.email.value,
            error: event.email.value.isEmpty ? 'Ingrese el email' : null,
          ),
          formkey: formKey,
        ),
      );
    });

    on<PasswordChanged>((event, emit) {
      emit(
        state.copyWith(
          password: BlocFormItem(
            value: event.password.value,
            error:
                event.password.value.isEmpty
                    ? 'Ingrese el password'
                    : event.password.value.length < 6
                    ? 'Mínimo 6 caracteres'
                    : null,
          ),
          formkey: formKey,
        ),
      );
    });

    on<FormSubmit>((event, emit) {
      print('Email : ${state.email.value}');
      print('Password ${state.password.value}');
    });
  }
}
