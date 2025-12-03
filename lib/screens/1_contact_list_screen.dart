import 'package:flutter/material.dart';
import 'package:exercise_week4/models/contact.dart';

class ContactListPage extends StatelessWidget {
  const ContactListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('1. Scrollable Contact List'),
        backgroundColor: Colors.blueAccent,
      ),

      body: ListView.builder(
        itemCount: sampleContacts.length,
        itemBuilder: (BuildContext context, int index) {
          final contact = sampleContacts[index];

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.indigo.shade400,
                  child: Text(
                    contact.name[0], // Lấy ký tự đầu tiên
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                title: Text(
                  contact.name,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),

                subtitle: Text(contact.email),

                trailing: const Icon(
                  Icons.info_outline,
                  color: Colors.blueGrey,
                ),

                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Tapped on ${contact.name}'),
                      duration: const Duration(milliseconds: 500),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
