// lib/screens/5_isolate_screen.dart

import 'package:flutter/material.dart';
import '../services/factorial_service.dart';

class IsolateScreen extends StatefulWidget {
  const IsolateScreen({super.key});

  @override
  State<IsolateScreen> createState() => _IsolateScreenState();
}

class _IsolateScreenState extends State<IsolateScreen> {
  BigInt? _result;
  bool _isLoading = false;
  final int _numberToCalculate = 30000;

  Future<void> _startCalculation() async {
    setState(() {
      _isLoading = true;
      _result = null;
    });

    try {
      final result = await computeFactorial(_numberToCalculate);

      if (mounted) {
        setState(() {
          _result = result;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('5. Isolate Factorial Demo'),
        backgroundColor: Colors.red.shade700,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Calculate Factorial of $_numberToCalculate!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade700,
                ),
              ),
              const SizedBox(height: 30),

              if (_isLoading)
                const Column(
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 10),
                    Text(
                      'Calculating in a background Isolate...',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ],
                )
              else
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _result == null
                              ? 'Press the button to start the heavy calculation.'
                              : 'Calculation Completed!',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),

                        if (_result != null)
                          Text(
                            'Result (first 100 digits): \n${_result.toString().substring(0, 100)}...',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                        if (_result != null)
                          Text(
                            '\nTotal Digits: ${_result.toString().length}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.green,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),

              const SizedBox(height: 30),

              ElevatedButton.icon(
                icon: Icon(
                  _isLoading ? Icons.hourglass_empty : Icons.play_arrow,
                ),
                label: Text(_isLoading ? 'Processing...' : 'Start Calculation'),
                onPressed: _isLoading ? null : _startCalculation,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade700,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
