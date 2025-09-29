import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Kontak',
      theme: ThemeData(
        brightness: Brightness.light, 
        primaryColor: Colors.black,   
        scaffoldBackgroundColor: Colors.white, 
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.grey,
          brightness: Brightness.light,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const ContactListPage(),
    );
  }
}

class ContactListPage extends StatelessWidget {
  const ContactListPage({super.key});
  final List<Map<String, String>> contacts = const [
    {"name": "Budi", "number": "123456789", "initial": "B"},
    {"name": "Citra", "number": "123456789", "initial": "C"},
    {"name": "Andi", "number": "123456789", "initial": "A"},
    {"name": "Dewi", "number": "123456789", "initial": "D"},
    {"name": "Eko", "number": "123456789", "initial": "E"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text(
          'My Contacts',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              enabled: true,
              decoration: InputDecoration(
                hintText: 'Cari kontak...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                fillColor: Colors.grey,
                filled: true,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (BuildContext context, int index) {
                final contact = contacts[index];
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey)),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey,
                    ),
                    title: Text(
                      contact['name']!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(contact['number']!),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        onPressed: () => {},
      ),
    );
  }
}