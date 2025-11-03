import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // 👈 Goes back to WelcomeScreen
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🔹 Your logo
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.greenAccent,
              ),
              child: const Center(
                child: Text(
                  'EV',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            _buildSignupButton(
              context,
              icon: Icons.email,
              text: 'Continue with Email',
              route: '/signup_email',
            ),

            const SizedBox(height: 15),
            _buildSignupButton(
              context,
              icon: Icons.phone,
              text: 'Continue with Phone Number',
              route: '/signup_phone',
            ),

            const SizedBox(height: 15),
            _buildSignupButton(
              context,
              icon: Icons.g_mobiledata,
              text: 'Continue with Google',
              route: '/signup_google',
            ),

            const SizedBox(height: 40),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/login'),
              child: const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextSpan(
                      text: "Log in",
                      style: TextStyle(
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignupButton(
    BuildContext context, {
    required IconData icon,
    required String text,
    required String route,
  }) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        width: 280,
        height: 50,
        decoration: BoxDecoration(
          // ignore: deprecated_member_use
          color: Colors.greenAccent.withOpacity(0.2),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.greenAccent, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.greenAccent),
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
