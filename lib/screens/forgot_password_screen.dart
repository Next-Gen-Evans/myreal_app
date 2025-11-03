import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isSending = false;

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutBack,
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  Future<void> resetPassword() async {
    if (emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your email address.'),
          backgroundColor: Colors.greenAccent,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    setState(() => isSending = true);

    try {
      await _auth.sendPasswordResetEmail(email: emailController.text.trim());

      _animationController.forward();

      await Future.delayed(const Duration(seconds: 2));

      if (mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.message}'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
    } finally {
      setState(() => isSending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Reset Password'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Forgot your password?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.greenAccent,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Enter your email below and we’ll send you a link to reset it.',
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: emailController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Enter your email',
                hintStyle: const TextStyle(color: Colors.white38),
                filled: true,
                fillColor: Colors.white10,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: isSending ? null : resetPassword,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: isSending ? Colors.grey : Colors.greenAccent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: isSending
                      ? const CircularProgressIndicator(
                          color: Colors.black,
                          strokeWidth: 2,
                        )
                      : const Text(
                          'Reset Password',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: ScaleTransition(
                scale: _animation,
                child: const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 80,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: ScaleTransition(
                scale: _animation,
                child: const Text(
                  'Link Sent!',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
