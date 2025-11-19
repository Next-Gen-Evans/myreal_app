import 'package:flutter/material.dart';
import 'notification_screen.dart';
import 'account_details_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 56,
        backgroundColor: Colors.black,
        elevation: 0,
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
        title: const Text('Settings', style: TextStyle(color: Colors.white)),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            tooltip: 'Notifications',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationScreen(),
                ),
              );
            },
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.only(top: 56),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              leading: const Icon(Icons.person, color: Colors.white70),
              title: const Text(
                'Account',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: const Text(
                'Manage your account details',
                style: TextStyle(color: Colors.white54),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AccountDetailsScreen(),
                  ),
                );
              },
            ),

            ListTile(
              leading: const Icon(Icons.notifications, color: Colors.white70),
              title: const Text(
                'Notifications',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: const Text(
                'Customize notifications',
                style: TextStyle(color: Colors.white54),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationScreen(),
                  ),
                );
              },
            ),

            ListTile(
              leading: const Icon(Icons.dark_mode, color: Colors.white70),
              title: const Text('Theme', style: TextStyle(color: Colors.white)),
              subtitle: const Text(
                'Toggle light/dark mode',
                style: TextStyle(color: Colors.white54),
              ),
              onTap: () {},
            ),

            const Divider(color: Colors.white24),

            ListTile(
              leading: const Icon(Icons.logout, color: Colors.redAccent),
              title: const Text(
                'Logout',
                style: TextStyle(color: Colors.redAccent),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Colors.grey.shade900,
                    title: const Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    content: const Text(
                      'Are you sure you want to logout?',
                      style: TextStyle(color: Colors.white70),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Cancel → close dialog
                        },
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Colors.greenAccent),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/',
                            (route) => false,
                          );
                        },
                        child: const Text(
                          'OK',
                          style: TextStyle(color: Colors.redAccent),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
