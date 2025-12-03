// lib/screens/4_async_demo_screen.dart

import 'package:flutter/material.dart';

class AsyncDemoScreen extends StatefulWidget {
  const AsyncDemoScreen({super.key});

  @override
  State<AsyncDemoScreen> createState() => _AsyncDemoScreenState();
}

class _AsyncDemoScreenState extends State<AsyncDemoScreen> {
  String _loadingMessage = 'Starting user loading process...';

  @override
  void initState() {
    super.initState();

    _loadUser();
  }

  Future<void> _loadUser() async {
    setState(() {
      _loadingMessage = 'Loading user...';
    });

    await Future.delayed(const Duration(seconds: 3));

    if (mounted) {
      setState(() {
        _loadingMessage = 'User loaded successfully!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = _loadingMessage == 'Loading user...';

    return Scaffold(
      appBar: AppBar(
        title: const Text('4. Async Programming Demo'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (isLoading)
              const CircularProgressIndicator(color: Colors.blueGrey)
            else
              const Icon(Icons.check_circle, color: Colors.green, size: 50),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                _loadingMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
