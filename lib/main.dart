import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// Screens
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
import 'screens/forgot_password_screen.dart'; // ✅ Added Forgot Password import

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ Initialize Firebase
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

        // Auth Pages
        '/signup': (context) => const SignupScreen(),
        '/login': (context) => const LoginScreen(),

        // Signup paths
        '/signup_email': (context) => const SignupEmailScreen(),
        '/signup_phone': (context) => const SignupPhoneScreen(),
        '/signup_google': (context) => const SignupGoogleScreen(),

        // Login paths
        '/login_email': (context) => const LoginEmailScreen(),
        '/login_phone': (context) => const LoginPhoneScreen(),
        '/login_google': (context) => const LoginGoogleScreen(),

        // ✅ Forgot Password
        '/forgot_password': (context) => const ForgotPasswordScreen(),

        // ✅ Home route after successful login/signup
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
