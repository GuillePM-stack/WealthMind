import 'package:flutter/material.dart';
import 'package:wealthmind/src/presentation/widget/RotatedText.dart';
import 'package:wealthmind/src/presentation/widget/DefaultButton.dart';
import 'package:wealthmind/src/presentation/widget/DefaultImages.dart';
import 'package:wealthmind/src/presentation/widget/DefaultSeparatorText.dart';
import 'package:wealthmind/src/presentation/widget/DefaultBackgroundImage.dart';
import 'package:wealthmind/src/presentation/widget/DefaultTextFieldOutlined.dart';

class RegisterContent extends StatelessWidget {
  const RegisterContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(left: 12),
          color: Color.fromRGBO(25, 114, 147, 1),

          // decoration: const BoxDecoration(
          //   gradient: LinearGradient(
          //     begin: Alignment.topRight,
          //     end: Alignment.bottomLeft,
          //     colors: [
          //       Color.fromRGBO(60, 190, 97, 1),
          //       Color.fromARGB(255, 21, 152, 213),
          //     ],
          //   ),
          // ),
          child: Column(
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
          margin: EdgeInsets.only(left: 60, bottom: 35),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              bottomLeft: Radius.circular(35),
            ),
            color: Color.fromARGB(255, 21, 152, 213),

            // gradient: LinearGradient(
            //   begin: Alignment.topRight,
            //   end: Alignment.bottomLeft,
            //   colors: [
            //     const Color.fromARGB(255, 245, 245, 245),
            //     const Color.fromARGB(255, 189, 189, 189),
            //   ],
            // ),
          ),
          child: Stack(
            children: [
              DefaultBackgroundImage(
                src: 'assets/img/Plant.png',
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.4,
                opacity: 0.7,
                aligment: Alignment.bottomCenter,
                margin: EdgeInsets.only(bottom: 20),
              ),

              SingleChildScrollView(
                child: Column(
                  children: [
                    DefaultImages(
                      src: 'assets/img/user_form.png',
                      width: 100,
                      height: 100,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 100, right: 35),
                    ),

                    DefaultTextFieldOutlined(
                      text: 'Nombre',
                      icon: Icons.person_outline,
                      margin: EdgeInsets.only(left: 20, right: 50, top: 15),
                    ),

                    DefaultTextFieldOutlined(
                      text: 'Apellido',
                      icon: Icons.person_2_outlined,
                      margin: EdgeInsets.only(left: 20, right: 50, top: 15),
                    ),

                    DefaultTextFieldOutlined(
                      text: 'Teléfono',
                      icon: Icons.phone_outlined,
                      margin: EdgeInsets.only(left: 20, right: 50, top: 15),
                    ),

                    DefaultTextFieldOutlined(
                      text: 'Email',
                      icon: Icons.email_outlined,
                      margin: EdgeInsets.only(left: 20, right: 50, top: 15),
                    ),

                    DefaultTextFieldOutlined(
                      text: 'Password',
                      icon: Icons.lock_outline,
                      margin: EdgeInsets.only(left: 20, right: 50, top: 15),
                    ),

                    DefaultTextFieldOutlined(
                      text: 'Confirm Password',
                      icon: Icons.lock_outline,
                      margin: EdgeInsets.only(left: 20, right: 50, top: 15),
                    ),

                    DefaultButton(
                      text: 'Create User',
                      margin: EdgeInsets.only(top: 30, left: 60, right: 60),
                    ),

                    SizedBox(height: 25),

                    DefaultSeparatorText(
                      text: 'Or',
                      colorText: Colors.white,
                      lineColor: Colors.white,
                    ),

                    SizedBox(height: 25),

                    _textIAlredyHaveAccount(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _textIAlredyHaveAccount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Do you have an account?',
          style: TextStyle(color: Colors.grey[100], fontSize: 16),
        ),
        SizedBox(width: 5),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'Login');
          },

          child: Text(
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
