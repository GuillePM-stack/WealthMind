import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';
import 'package:wealthmind/src/presentation/utils/bloc_form_item.dart';

class LoginState extends Equatable {
  final BlocFormItem email;
  final BlocFormItem password;
  final GlobalKey<FormState>? formkey;

  const LoginState({
    this.email = const BlocFormItem(error: 'Ingresa el Email'),
    this.password = const BlocFormItem(error: 'Ingresa el Password'),
    this.formkey,
  });

  LoginState copyWith({
    BlocFormItem? email,
    BlocFormItem? password,
    GlobalKey<FormState>? formkey,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      formkey: formkey ?? this.formkey,
    );
  }

  @override
  List<Object?> get props {
    return [email, password, formkey];
  }
}
