import 'package:flutter/material.dart';
import 'dart:async';
import '../../widgets/bottom_nav_bar.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<Map<String, String>> notifications = [];

  @override
  void initState() {
    super.initState();
    _generateRealTimeNotifications();
  }

  void _generateRealTimeNotifications() {
    List<Map<String, String>> sampleNotifications = [
      {
        "title": "New Message",
        "description": "You received a new message!",
        "time": "Just now",
      },
      {
        "title": "App Update",
        "description": "A new version is available!",
        "time": "2 min ago",
      },
      {
        "title": "Friend Request",
        "description": "John Doe sent you a request.",
        "time": "5 min ago",
      },
      {
        "title": "Reminder",
        "description": "Your pet’s vet appointment is today!",
        "time": "1 hour ago",
      },
      {
        "title": "Offer Alert",
        "description": "50% off on pet food! Hurry up!",
        "time": "3 hours ago",
      },
    ];

    Timer.periodic(Duration(seconds: 5), (timer) {
      if (notifications.length < sampleNotifications.length) {
        setState(() {
          notifications.insert(0, sampleNotifications[notifications.length]);
        });
      } else {
        timer.cancel(); // Stop adding notifications after all are added
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        backgroundColor: const Color(0xFFB89C5A),
        actions: [
          IconButton(
            icon: const Icon(Icons.clear_all),
            onPressed: () {
              setState(() {
                notifications.clear();
              });
            },
          ),
        ],
      ),
      body:
          notifications.isEmpty
              ? const Center(
                child: Text(
                  "No notifications yet",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              )
              : ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(
                      Icons.notifications,
                      color: Color(0xFFB89C5A),
                    ),
                    title: Text(notifications[index]["title"]!),
                    subtitle: Text(notifications[index]["description"]!),
                    trailing: Text(notifications[index]["time"]!),
                    onTap: () {
                      // Handle notification tap (e.g., navigate to details)
                    },
                  );
                },
              ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 0,
        onTabChange: (index) {
          // Handle tab change
        },
      ),
    );
  }
}
