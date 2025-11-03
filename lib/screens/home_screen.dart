import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myreal_app/screens/settings_screen.dart';
import 'projects_screen.dart';
import 'account_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final user = FirebaseAuth.instance.currentUser;

  static final List<Widget> _pages = <Widget>[
    const _HomePage(),
    const ProjectsScreen(),
    const SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    String? appBarTitle;
    if (_selectedIndex == 0) {
      appBarTitle = 'Dashboard';
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          elevation: 0,
          title: appBarTitle != null
              ? Text(appBarTitle, style: const TextStyle(color: Colors.white))
              : null,
        ),
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.greenAccent,
          unselectedItemColor: Colors.white70,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Projects'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
          ],
        ),
      ),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage();

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.home, size: 80, color: Colors.greenAccent),
          const SizedBox(height: 20),
          const Text(
            'Welcome Home!',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Hello, ${user?.email ?? 'User'}!',
            style: const TextStyle(fontSize: 18, color: Colors.white70),
          ),
          const SizedBox(height: 20),
          const Text(
            'You have successfully logged in to MyReal App',
            style: TextStyle(fontSize: 16, color: Colors.white54),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
