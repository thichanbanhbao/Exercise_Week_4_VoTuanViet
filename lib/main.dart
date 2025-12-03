import 'package:flutter/material.dart';
import 'package:exercise_week4/screens/homepages.dart';

void main() {
  // Đảm bảo chạy code khởi tạo SharedPreferences nếu cần thiết cho Bài 3
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Exercises Week 4',
      theme: ThemeData(primarySwatch: Colors.blue),
      // Gán HomeScreen làm màn hình chính
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
