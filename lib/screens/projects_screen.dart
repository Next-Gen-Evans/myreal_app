import 'package:flutter/material.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

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
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
        title: const Text('Projects', style: TextStyle(color: Colors.white)),
        centerTitle: false,
      ),
      body: const Center(
        child: Text(
          'Projects Page (Coming Soon)',
          style: TextStyle(color: Colors.white70, fontSize: 18),
        ),
      ),
    );
  }
}
