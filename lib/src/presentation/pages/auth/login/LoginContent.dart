import 'package:flutter/material.dart';
import 'package:wealthmind/src/presentation/widget/RotatedText.dart';
import 'package:wealthmind/src/presentation/widget/DefaultButton.dart';
import 'package:wealthmind/src/presentation/widget/DefaultImages.dart';
import 'package:wealthmind/src/presentation/widget/DefaultTextField.dart';
import 'package:wealthmind/src/presentation/widget/DefaultSeparatorText.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(left: 12),
          color: Color.fromRGBO(25, 114, 147, 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, //Horizontal
            mainAxisAlignment: MainAxisAlignment.center, //Vertical
            children: [
              RotatedText(text: 'Login'),
              SizedBox(height: 100),
              RotatedText(text: 'Register', isBold: false),
              SizedBox(height: 90),
            ],
          ),
        ),

        Container(
          margin: EdgeInsets.only(left: 60, bottom: 60),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              bottomLeft: Radius.circular(35),
            ),
            color: Color.fromARGB(255, 21, 152, 213),
          ),

          child: Container(
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.only(left: 15, right: 15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),

                  _welcomeText('Welcome'),
                  _welcomeText('back...'),

                  DefaultImages(
                    src: 'assets/img/inicio.png',
                    width: 150,
                    height: 150,
                    alignment: Alignment.centerRight,
                  ),

                  _welcomeText('Login'),

                  // Email
                  DefaultTextField(text: 'E-mail', icon: Icons.email_outlined),

                  // Password
                  DefaultTextField(
                    text: 'Password',
                    icon: Icons.lock_outlined,
                    margin: EdgeInsets.only(top: 15, left: 20, right: 20),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.2),

                  //Button for login
                  DefaultButton(text: 'Sing In'),

                  DefaultSeparatorText(text: 'Or'),

                  SizedBox(height: 10),

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
    );
  }

  Widget _welcomeText(String text, {Color color = Colors.white}) {
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
        Navigator.pushNamed(context, link);
      },

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            question,
            style: TextStyle(color: Colors.grey[100], fontSize: 17),
          ),

          SizedBox(width: 10),

          Text(
            answer,
            style: TextStyle(
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
