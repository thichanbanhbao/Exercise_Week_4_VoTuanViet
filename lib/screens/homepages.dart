import 'package:flutter/material.dart';
import 'package:exercise_week4/screens/1_contact_list_screen.dart';
import 'package:exercise_week4/screens/2_grid_view_screen.dart';
import 'package:exercise_week4/screens/3_shared_preferences_screen.dart';
import 'package:exercise_week4/screens/4_async_demo_screen.dart';
import 'package:exercise_week4/screens/5_isolate_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Exercises Week 4')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('1. List View Exercise'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ContactListPage(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('2. Grid View Exercise'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const GridViewScreen()),
              );
            },
          ),
          ListTile(
            title: const Text('3. Shared Preferences Exercise'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SharedPreferencesScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('4. Async Demo Exercise'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AsyncDemoScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('5. Isolate Factorial Demo'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const IsolateScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
