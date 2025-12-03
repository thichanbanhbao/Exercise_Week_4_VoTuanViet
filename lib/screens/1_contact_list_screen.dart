import 'package:flutter/material.dart';
import 'package:exercise_week4/models/contact.dart';

class ContactListPage extends StatelessWidget {
  const ContactListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1. List View Exercise')),
      body: ListView.builder(
        itemCount: sampleContacts.length,
        itemBuilder: (context, index) {
          final contact = sampleContacts[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(contact.avataPath),
            ),
            title: Text(contact.name),
            subtitle: Text(contact.email),
          );
        },
      ),
    );
  }
}
