import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wealthmind/src/presentation/widget/rotated_text.dart';
import 'package:wealthmind/src/presentation/utils/bloc_form_item.dart';
import 'package:wealthmind/src/presentation/widget/DefaultButton.dart';
import 'package:wealthmind/src/presentation/widget/DefaultImages.dart';
import 'package:wealthmind/src/presentation/widget/DefaultSeparatorText.dart';
import 'package:wealthmind/src/presentation/widget/DefaultBackgroundImage.dart';
import 'package:wealthmind/src/presentation/widget/DefaultTextFieldOutlined.dart';
import 'package:wealthmind/src/presentation/pages/auth/register/bloc/RegisterBloc.dart';
import 'package:wealthmind/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:wealthmind/src/presentation/pages/auth/register/bloc/RegisterState.dart';

class RegisterContent extends StatelessWidget {
  final RegisterState state;
  const RegisterContent(this.state);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 12),
            color: const Color.fromRGBO(25, 114, 147, 1),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RotatedText(text: 'Login', isBold: false),
                SizedBox(height: 100),
                RotatedText(text: 'Register'),
                SizedBox(height: 90),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 60, bottom: 35),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                bottomLeft: Radius.circular(35),
              ),
              color: Color.fromARGB(255, 21, 152, 213),
            ),
            child: Stack(
              children: [
                DefaultBackgroundImage(
                  src: 'assets/img/Plant.png',
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.4,
                  opacity: 0.7,
                  aligment: Alignment.bottomCenter,
                  margin: const EdgeInsets.only(bottom: 20),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const DefaultImages(
                        src: 'assets/img/user_form.png',
                        width: 100,
                        height: 100,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 100, right: 35),
                      ),
                      DefaultTextFieldOutlined(
                        text: 'Nombre',
                        icon: Icons.person_outline,
                        margin: const EdgeInsets.only(
                          left: 20,
                          right: 50,
                          top: 15,
                        ),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(
                            NameChanged(name: BlocFormItem(value: text)),
                          );
                        },
                        validator: (value) => state.name.error,
                      ),
                      DefaultTextFieldOutlined(
                        text: 'Apellido',
                        icon: Icons.person_2_outlined,
                        margin: const EdgeInsets.only(
                          left: 20,
                          right: 50,
                          top: 15,
                        ),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(
                            LastnameChanged(
                              lastname: BlocFormItem(value: text),
                            ),
                          );
                        },
                        validator: (value) => state.lastname.error,
                      ),
                      DefaultTextFieldOutlined(
                        text: 'Teléfono',
                        icon: Icons.phone_outlined,
                        margin: const EdgeInsets.only(
                          left: 20,
                          right: 50,
                          top: 15,
                        ),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(
                            PhoneChanged(phone: BlocFormItem(value: text)),
                          );
                        },
                        validator: (value) => state.phone.error,
                      ),
                      DefaultTextFieldOutlined(
                        text: 'Email',
                        icon: Icons.email_outlined,
                        margin: const EdgeInsets.only(
                          left: 20,
                          right: 50,
                          top: 15,
                        ),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(
                            EmailChanged(email: BlocFormItem(value: text)),
                          );
                        },
                        validator: (value) => state.email.error,
                      ),
                      DefaultTextFieldOutlined(
                        text: 'Password',
                        icon: Icons.lock_outline,
                        margin: const EdgeInsets.only(
                          left: 20,
                          right: 50,
                          top: 15,
                        ),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(
                            PasswordChanged(
                              password: BlocFormItem(value: text),
                            ),
                          );
                        },
                        validator: (value) => state.password.error,
                      ),
                      DefaultTextFieldOutlined(
                        text: 'Confirm Password',
                        icon: Icons.lock_outline,
                        margin: const EdgeInsets.only(
                          left: 20,
                          right: 50,
                          top: 15,
                        ),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(
                            ConfirmPasswordChanged(
                              confirmPassword: BlocFormItem(value: text),
                            ),
                          );
                        },
                        validator: (value) => state.confirmPassword.error,
                      ),
                      DefaultButton(
                        onPressed: () {
                          if (state.formKey!.currentState!.validate()) {
                            context.read<RegisterBloc>().add(FormSubmit());
                            context.read<RegisterBloc>().add(FormReset());
                          }
                        },
                        text: 'Crear Usuario',
                        margin: const EdgeInsets.only(
                          top: 30,
                          left: 60,
                          right: 60,
                        ),
                      ),
                      const SizedBox(height: 25),
                      const DefaultSeparatorText(
                        text: 'Or',
                        colorText: Colors.white,
                        lineColor: Colors.white,
                      ),
                      const SizedBox(height: 25),
                      _textIAlreadyHaveAccount(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _textIAlreadyHaveAccount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Do you have an account?',
          style: TextStyle(color: Colors.grey[100], fontSize: 16),
        ),
        const SizedBox(width: 5),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, 'Login');
          },
          child: const Text(
            'Log In',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
