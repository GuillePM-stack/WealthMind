import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';
import 'package:wealthmind/src/presentation/utils/bloc_form_item.dart';

class RegisterState extends Equatable {
  final BlocFormItem name, lastname, email, phone, password, confirmPassword;
  final GlobalKey<FormState>? formKey;

  const RegisterState({
    this.name = const BlocFormItem(error: 'Ingresa el nombre'),
    this.lastname = const BlocFormItem(error: 'Ingresa el apellido'),
    this.phone = const BlocFormItem(error: 'Ingresa el telefono'),
    this.email = const BlocFormItem(error: 'Ingresa el email'),
    this.password = const BlocFormItem(error: 'Ingresa el password'),
    this.confirmPassword = const BlocFormItem(error: 'Confirma tu contraseña'),
    this.formKey,
  });

  RegisterState copyWith({
    BlocFormItem? name,
    BlocFormItem? lastname,
    BlocFormItem? phone,
    BlocFormItem? email,
    BlocFormItem? password,
    BlocFormItem? confirmPassword,
    GlobalKey<FormState>? formKey,
  }) {
    return RegisterState(
      name: name ?? this.name,
      lastname: lastname ?? this.lastname,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      formKey: formKey,
    );
  }

  @override
  List<Object?> get props => [
    name,
    lastname,
    email,
    phone,
    password,
    confirmPassword,
  ];
}
