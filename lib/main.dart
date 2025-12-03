import 'package:flutter/material.dart';
import 'package:exercise_week4/screens/1_contact_list_screen.dart';
import 'package:exercise_week4/screens/2_grid_view_screen.dart';
import 'package:exercise_week4/screens/3_shared_preferences_screen.dart';
import 'package:exercise_week4/screens/4_async_demo_screen.dart';
import 'package:exercise_week4/screens/5_isolate_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final List<Map<String, dynamic>> exercises = const [
    {'title': '1. List View Exercise', 'screen': ContactListPage()},
    {'title': '2. Grid View Exercise', 'screen': GridViewScreen()},
    {
      'title': '3. Shared Preferences Exercise',
      'screen': SharedPreferencesScreen(),
    },
    {'title': '4. Async Programming Exercise', 'screen': AsyncDemoScreen()},
    {'title': '5. Isolate/Factorial Exercise', 'screen': IsolateScreen()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Week 4 Exercises'),
        backgroundColor: Colors.indigo,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          final exercise = exercises[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.indigo.shade100,
                foregroundColor: Colors.indigo.shade800,
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              title: Text(
                exercise['title'] as String,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => exercise['screen'] as Widget,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
