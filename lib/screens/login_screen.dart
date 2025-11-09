import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              // Logo Circle
              Container(
                width: 90,
                height: 90,
                decoration: const BoxDecoration(
                  color: Colors.greenAccent,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    'EV',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 60),

              // Login Buttons
              _buildLoginButton(
                icon: Icons.email_rounded,
                text: 'Continue with Email',
                onTap: () => Navigator.pushNamed(context, '/login_email'),
              ),
              const SizedBox(height: 15),
              _buildLoginButton(
                icon: Icons.phone_iphone_rounded,
                text: 'Continue with Phone',
                onTap: () => Navigator.pushNamed(context, '/login_phone'),
              ),
              const SizedBox(height: 15),
              _buildLoginButton(
                icon: Icons.g_mobiledata_rounded,
                text: 'Continue with Google',
                onTap: () => Navigator.pushNamed(context, '/login_google'),
              ),

              const SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(width: 6),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/signup'),
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ), // space around text
        height: 50,
        decoration: BoxDecoration(
          // ignore: deprecated_member_use
          color: Colors.greenAccent.withOpacity(0.1),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.greenAccent, width: 1.2),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min, // compact width
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.greenAccent, size: 22),
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(
                color: Colors.greenAccent,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
