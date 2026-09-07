import 'package:flutter/material.dart';

import '../models/contact.dart';

class ContactCard extends StatelessWidget {
  final Contact contact;
  final VoidCallback onFavorite;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ContactCard({
    super.key,
    required this.contact,
    required this.onFavorite,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      elevation: 3,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          child: Text(
            contact.nama[0].toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),

        title: Text(
          contact.nama,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 5),

            Text(contact.email),

            Text(contact.nomor),

          ],
        ),

        trailing: PopupMenuButton(

          onSelected: (value) {

            if (value == "favorite") {

              onFavorite();

            }

            if (value == "edit") {

              onEdit();

            }

            if (value == "delete") {

              onDelete();

            }

          },

          itemBuilder: (context) => [

            PopupMenuItem(

              value: "favorite",

              child: Row(

                children: [

                  Icon(

                    contact.favorite
                        ? Icons.favorite
                        : Icons.favorite_border,

                    color: Colors.red,

                  ),

                  const SizedBox(width: 8),

                  Text(

                    contact.favorite
                        ? "Hapus Favorit"
                        : "Favorit",

                  ),

                ],

              ),

            ),

            const PopupMenuItem(

              value: "edit",

              child: Row(

                children: [

                  Icon(Icons.edit),

                  SizedBox(width: 8),

                  Text("Edit"),

                ],

              ),

            ),

            const PopupMenuItem(

              value: "delete",

              child: Row(

                children: [

                  Icon(Icons.delete),

                  SizedBox(width: 8),

                  Text("Hapus"),

                ],

              ),

            ),

          ],

        ),

      ),
    );
  }
}