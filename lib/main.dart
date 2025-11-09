import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'screens/welcome_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_email_screen.dart';
import 'screens/signup_phone_screen.dart';
import 'screens/signup_google_screen.dart';
import 'screens/login_email_screen.dart';
import 'screens/login_phone_screen.dart';
import 'screens/login_google_screen.dart';
import 'screens/home_screen.dart';
import 'screens/forgot_password_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyReal App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.greenAccent,
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),

        '/signup': (context) => const SignupScreen(),
        '/login': (context) => const LoginScreen(),

        '/signup_email': (context) => const SignupEmailScreen(),
        '/signup_phone': (context) => const SignupPhoneScreen(),
        '/signup_google': (context) => const SignupGoogleScreen(),

        '/login_email': (context) => const LoginEmailScreen(),
        '/login_phone': (context) => const LoginPhoneScreen(),
        '/login_google': (context) => const LoginGoogleScreen(),

        '/forgot_password': (context) => const ForgotPasswordScreen(),

        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
