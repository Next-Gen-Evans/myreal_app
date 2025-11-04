import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      {'title': 'New Project Assigned', 'time': '2 hrs ago'},
      {'title': 'System Update Available', 'time': 'Yesterday'},
      {'title': 'Welcome to MyRealApp 🎉', 'time': '2 days ago'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Notifications'), centerTitle: true),
      body: notifications.isEmpty
          ? const Center(
              child: Text(
                'No new notifications',
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final item = notifications[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.notifications),
                    title: Text(item['title']!),
                    subtitle: Text(item['time']!),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 14),
                    onTap: () {},
                  ),
                );
              },
            ),
    );
  }
}
