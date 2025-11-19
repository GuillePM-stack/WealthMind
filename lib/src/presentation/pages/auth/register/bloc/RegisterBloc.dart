import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wealthmind/src/presentation/utils/bloc_form_item.dart';
import 'package:wealthmind/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:wealthmind/src/presentation/pages/auth/register/bloc/RegisterState.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final formKey = GlobalKey<FormState>();

  RegisterBloc() : super(RegisterState()) {
    on<RegisterInitEvent>((event, emit) {
      emit(state.copyWith(formKey: formKey));
    });

    on<NameChanged>((event, emit) {
      emit(
        state.copyWith(
          name: BlocFormItem(
            value: event.name.value,
            error: event.name.value.isEmpty ? 'Ingresa el nombre' : null,
          ),
          formKey: formKey,
        ),
      );
    });

    on<LastnameChanged>((event, emit) {
      emit(
        state.copyWith(
          lastname: BlocFormItem(
            value: event.lastname.value,
            error: event.lastname.value.isEmpty ? 'Ingresa el apellido' : null,
          ),
          formKey: formKey,
        ),
      );
    });

    on<PhoneChanged>((event, emit) {
      emit(
        state.copyWith(
          phone: BlocFormItem(
            value: event.phone.value,
            error:
                event.phone.value.isEmpty
                    ? 'Ingrese el teléfono'
                    : event.phone.value.length != 10
                    ? 'Deben ser 10 números'
                    : null,
          ),
          formKey: formKey,
        ),
      );
    });

    on<EmailChanged>((event, emit) {
      emit(
        state.copyWith(
          email: BlocFormItem(
            value: event.email.value,
            error: event.email.value.isEmpty ? 'Ingrese el mail' : null,
          ),
          formKey: formKey,
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
                    ? 'Ingrese la contraseña'
                    : event.password.value.length < 6
                    ? 'Mínimo 6 caracteres'
                    : null,
          ),
          formKey: formKey,
        ),
      );
    });

    on<ConfirmPasswordChanged>((event, emit) {
      emit(
        state.copyWith(
          confirmPassword: BlocFormItem(
            value: event.confirmPassword.value,
            error:
                event.confirmPassword.value.isEmpty
                    ? 'Confirme la contraseña'
                    : event.confirmPassword.value.length < 6
                    ? 'Mínimo 6 caracteres'
                    : event.confirmPassword.value != state.password.value
                    ? 'Los password no coinciden'
                    : null,
          ),
          formKey: formKey,
        ),
      );
    });

    on<FormSubmit>((event, emit) {
      print('name ${state.name.value}');
      print('lastname ${state.lastname.value}');
      print('phone ${state.phone.value}');
      print('email ${state.email.value}');
      print('password ${state.password.value}');
      print('confirmPassword ${state.confirmPassword.value}');
    });

    on<FormReset>((event, emit) {
      state.formKey?.currentState?.reset();
    });
  }
}
