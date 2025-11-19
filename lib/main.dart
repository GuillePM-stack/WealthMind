import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wealthmind/src/blocProviders.dart';
import 'package:device_preview/device_preview.dart';
import 'package:wealthmind/src/presentation/pages/chat/ChatScreen.dart';
import 'package:wealthmind/src/presentation/pages/auth/login/LoginPage.dart';
import 'package:wealthmind/src/presentation/pages/auth/register/RegisterPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  runApp(
    DevicePreview(enabled: !kReleaseMode, builder: (context) => const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviders,
      child: MaterialApp(
        title: 'WealthMind',
        builder: DevicePreview.appBuilder,
        locale: DevicePreview.locale(context),
        debugShowCheckedModeBanner: false,

        initialRoute: 'Chat',
        routes: {
          'Login': (BuildContext context) => const LoginPage(),
          'Register': (BuildContext context) => const RegisterPage(),
          'Chat': (BuildContext context) => const ChatScreen(),
        },
      ),
    );
  }
}
