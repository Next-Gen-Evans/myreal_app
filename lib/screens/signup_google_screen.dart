import 'package:flutter/material.dart';

class SignupGoogleScreen extends StatelessWidget {
  const SignupGoogleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Choose an account",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildAccountTile("evans@gmail.com"),
          _buildAccountTile("evprojects@gmail.com"),
          _buildAccountTile("add another account"),
        ],
      ),
    );
  }

  Widget _buildAccountTile(String email) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.greenAccent,
        child: Icon(Icons.person, color: Colors.black),
      ),
      title: Text(email, style: const TextStyle(color: Colors.white)),
      onTap: () {},
    );
  }
}
