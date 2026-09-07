import 'package:flutter/material.dart';

import '../pages/about_page.dart';
import '../pages/add_contact_page.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              "BUKU KONTAK",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            accountEmail: const Text("Flutter Application"),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.contacts,
                color: Colors.blue,
                size: 40,
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
          ),

          /// KONTAK
          ListTile(
            leading: const Icon(Icons.contact_page),
            title: const Text("Kontak"),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          /// TAMBAH KONTAK
          ListTile(
            leading: const Icon(Icons.person_add),
            title: const Text("Tambah Kontak"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AddContactPage(),
                ),
              );
            },
          ),

          /// FAVORIT
          ListTile(
            leading: const Icon(Icons.star),
            title: const Text("Favorit"),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          /// TENTANG
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text("Tentang"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AboutPage(),
                ),
              );
            },
          ),

          const Spacer(),

          const Divider(),

          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              "Version 1.0.0",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}