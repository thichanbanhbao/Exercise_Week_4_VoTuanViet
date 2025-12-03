import 'package:flutter/material.dart';
import 'package:exercise_week4/services/prefs_service.dart';

class SharedPreferencesScreen extends StatefulWidget {
  const SharedPreferencesScreen({super.key});

  @override
  State<SharedPreferencesScreen> createState() =>
      _SharedPreferencesScreenState();
}

class _SharedPreferencesScreenState extends State<SharedPreferencesScreen> {
  final TextEditingController _nameController = TextEditingController();

  String _savedNameDisplay = 'No name saved yet.';
  String _lastSavedTimestamp = '';

  Future<void> _saveName() async {
    final name = _nameController.text.trim();
    if (name.isNotEmpty) {
      await PrefsService.saveUserData(
        name: name,
        age: 30,
        email: 'test@example.com',
      );

      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Saved: $name')));
      }

      _showName();
    } else {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Please enter a name.')));
      }
    }
  }

  Future<void> _showName() async {
    final name = await PrefsService.getName();
    final timestampString = await PrefsService.getTimestamp();

    setState(() {
      if (name != null && name.isNotEmpty) {
        _savedNameDisplay = 'Saved Name: $name';
      } else {
        _savedNameDisplay = 'No name found in storage.';
      }

      if (timestampString != null) {
        _lastSavedTimestamp = _formatTimestamp(timestampString);
      } else {
        _lastSavedTimestamp = 'N/A';
      }
    });
  }

  Future<void> _clearData() async {
    await PrefsService.clearAllData();
    setState(() {
      _nameController.clear();
      _savedNameDisplay = 'All data cleared.';
      _lastSavedTimestamp = 'N/A';
    });
    if (mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Storage cleared.')));
    }
  }

  String _formatTimestamp(String isoString) {
    try {
      final dateTime = DateTime.parse(isoString).toLocal();
      return 'Last saved: ${dateTime.hour}:${dateTime.minute}:${dateTime.second} - ${dateTime.day}/${dateTime.month}/${dateTime.year}';
    } catch (e) {
      return 'Invalid timestamp';
    }
  }

  @override
  void initState() {
    super.initState();
    _showName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('3. Shared Preferences Demo'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Enter Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            ElevatedButton.icon(
              icon: const Icon(Icons.save),
              label: const Text('Save Name'),
              onPressed: _saveName,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
            ),
            const SizedBox(height: 10),

            ElevatedButton.icon(
              icon: const Icon(Icons.refresh),
              label: const Text('Show Name'),
              onPressed: _showName,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
            ),
            const SizedBox(height: 30),

            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _savedNameDisplay,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),

                    Text(
                      _lastSavedTimestamp,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),
            OutlinedButton.icon(
              icon: const Icon(Icons.delete_forever, color: Colors.red),
              label: const Text('Clear Saved Data'),
              onPressed: _clearData,
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                side: const BorderSide(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
