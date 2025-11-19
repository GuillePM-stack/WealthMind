import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wealthmind/src/presentation/widget/rotated_text.dart';
import 'package:wealthmind/src/presentation/utils/bloc_form_item.dart';
import 'package:wealthmind/src/presentation/widget/DefaultButton.dart';
import 'package:wealthmind/src/presentation/widget/DefaultImages.dart';
import 'package:wealthmind/src/presentation/widget/DefaultTextField.dart';
import 'package:wealthmind/src/presentation/widget/DefaultSeparatorText.dart';
import 'package:wealthmind/src/presentation/pages/auth/login/bloc/LoginSate.dart';
import 'package:wealthmind/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:wealthmind/src/presentation/pages/auth/login/bloc/LoginEvent.dart';

class LoginContent extends StatelessWidget {
  final LoginState state;

  const LoginContent(this.state);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formkey,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 12),
            color: const Color.fromRGBO(25, 114, 147, 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                RotatedText(text: 'Login'),
                SizedBox(height: 100),
                RotatedText(text: 'Register', isBold: false),
                SizedBox(height: 90),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 60, bottom: 60),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                bottomLeft: Radius.circular(35),
              ),
              color: Color.fromARGB(255, 21, 152, 213),
            ),
            child: Container(
              height: MediaQuery.of(context).size.height,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    _welcomeText('Welcome'),
                    _welcomeText('back...'),
                    const DefaultImages(
                      src: 'assets/img/inicio.png',
                      width: 150,
                      height: 150,
                      alignment: Alignment.centerRight,
                    ),
                    _welcomeText('Login'),

                    // Email
                    DefaultTextField(
                      onChanged: (text) {
                        context.read<LoginBloc>().add(
                          EmailChanged(email: BlocFormItem(value: text)),
                        );
                      },
                      validator: (value) => state.email.error,
                      text: 'E-mail',
                      icon: Icons.email_outlined,
                    ),

                    // Password
                    DefaultTextField(
                      onChanged: (text) {
                        context.read<LoginBloc>().add(
                          PasswordChanged(password: BlocFormItem(value: text)),
                        );
                      },
                      validator: (value) => state.password.error,
                      text: 'Password',
                      icon: Icons.lock_outlined,
                      margin: const EdgeInsets.only(
                        top: 15,
                        left: 20,
                        right: 20,
                      ),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.2),

                    DefaultButton(
                      text: 'Sign In',
                      onPressed: () {
                        if (state.formkey!.currentState!.validate()) {
                          context.read<LoginBloc>().add(FormSubmit());
                        } else {
                          print('El formulario no es válido');
                        }
                      },
                    ),

                    const DefaultSeparatorText(text: 'Or'),
                    const SizedBox(height: 10),

                    donthaveAccount(
                      context,
                      'Register',
                      'Don\'t have an account? ',
                      'Sign Up',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _welcomeText(String text, {Color color = Colors.white}) {
    return Text(
      text,
      style: TextStyle(fontSize: 30, color: color, fontWeight: FontWeight.bold),
    );
  }

  Widget donthaveAccount(
    BuildContext context,
    String link,
    String question,
    String answer,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, link);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            question,
            style: TextStyle(color: Colors.grey[100], fontSize: 17),
          ),
          const SizedBox(width: 10),
          Text(
            answer,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}
