import 'package:wealthmind/src/presentation/utils/bloc_form_item.dart';

abstract class RegisterEvent {}

class RegisterInitEvent extends RegisterEvent {}

class NameChanged extends RegisterInitEvent {
  final BlocFormItem name;
  NameChanged({required this.name});
}

class LastnameChanged extends RegisterEvent {
  final BlocFormItem lastname;
  LastnameChanged({required this.lastname});
}

class PhoneChanged extends RegisterEvent {
  final BlocFormItem phone;
  PhoneChanged({required this.phone});
}

class EmailChanged extends RegisterEvent {
  final BlocFormItem email;
  EmailChanged({required this.email});
}

class PasswordChanged extends RegisterEvent {
  final BlocFormItem password;
  PasswordChanged({required this.password});
}

class ConfirmPasswordChanged extends RegisterEvent {
  final BlocFormItem confirmPassword;
  ConfirmPasswordChanged({required this.confirmPassword});
}

class FormSubmit extends RegisterInitEvent {}

class FormReset extends RegisterInitEvent {}
