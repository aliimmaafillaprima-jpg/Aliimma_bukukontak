import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/contact.dart';
import '../widgets/app_drawer.dart';
import '../widgets/contact_card.dart';
import 'add_contact_page.dart';
import 'edit_contact_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  List<Contact> contacts = contactsData;

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  List<Contact> get favoriteContacts =>
      contacts.where((e) => e.favorite).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),

      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text("BUKU KONTAK"),
        centerTitle: true,

        bottom: TabBar(
          controller: tabController,
          tabs: const [

            Tab(
              icon: Icon(Icons.contacts),
              text: "Kontak",
            ),

            Tab(
              icon: Icon(Icons.favorite),
              text: "Favorit",
            ),

          ],
        ),
      ),

      body: TabBarView(
        controller: tabController,

        children: [

          ///================ TAB KONTAK =================

          contacts.isEmpty
              ? const Center(
                  child: Text(
                    "Belum ada kontak",
                    style: TextStyle(fontSize: 18),
                  ),
                )
              : ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (context, index) {

                    return ContactCard(

                      contact: contacts[index],

                      onFavorite: () {

                        setState(() {

                          contacts[index].favorite =
                              !contacts[index].favorite;

                        });

                      },

                      onEdit: () async {

                        await Navigator.push(

                          context,

                          MaterialPageRoute(

                            builder: (_) => EditContactPage(

                              contact: contacts[index],

                            ),

                          ),

                        );

                        setState(() {});

                      },

                      onDelete: () {

                        showDialog(

                          context: context,

                          builder: (_) {

                            return AlertDialog(

                              title: const Text("Hapus Kontak"),

                              content: Text(
                                  "Hapus ${contacts[index].nama}?"),

                              actions: [

                                TextButton(

                                  onPressed: () {

                                    Navigator.pop(context);

                                  },

                                  child: const Text("Batal"),

                                ),

                                ElevatedButton(

                                  onPressed: () {

                                    setState(() {

                                      contacts.removeAt(index);

                                    });

                                    Navigator.pop(context);

                                  },

                                  child: const Text("Hapus"),

                                ),

                              ],

                            );

                          },

                        );

                      },

                    );

                  },

                ),

          ///================ TAB FAVORIT =================

          favoriteContacts.isEmpty

              ? const Center(

                  child: Text(

                    "Belum ada kontak favorit",

                    style: TextStyle(fontSize: 18),

                  ),

                )

              : ListView.builder(

                  itemCount: favoriteContacts.length,

                  itemBuilder: (context, index) {

                    return ContactCard(

                      contact: favoriteContacts[index],

                      onFavorite: () {

                        setState(() {

                          favoriteContacts[index].favorite = false;

                        });

                      },

                      onEdit: () async {

                        await Navigator.push(

                          context,

                          MaterialPageRoute(

                            builder: (_) => EditContactPage(

                              contact: favoriteContacts[index],

                            ),

                          ),

                        );

                        setState(() {});

                      },

                      onDelete: () {

                        setState(() {

                          contacts.remove(favoriteContacts[index]);

                        });

                      },

                    );

                  },

                ),

        ],

      ),

      floatingActionButton: FloatingActionButton(

        backgroundColor: Colors.deepPurple.shade100,

        foregroundColor: Colors.black,

        child: const Icon(Icons.add),

        onPressed: () async {

          final Contact? contact = await Navigator.push(

            context,

            MaterialPageRoute(

              builder: (_) => const AddContactPage(),

            ),

          );

          if (contact != null) {

            setState(() {

              contacts.add(contact);

            });

          }

        },

      ),

    );
  }
}