import 'package:flutter/material.dart';

import '../models/contact.dart';

class EditContactPage extends StatefulWidget {
  final Contact contact;

  const EditContactPage({
    super.key,
    required this.contact,
  });

  @override
  State<EditContactPage> createState() => _EditContactPageState();
}

class _EditContactPageState extends State<EditContactPage> {
  final formKey = GlobalKey<FormState>();

  late TextEditingController namaController;
  late TextEditingController emailController;
  late TextEditingController nomorController;

  @override
  void initState() {
    super.initState();

    namaController = TextEditingController(
      text: widget.contact.nama,
    );

    emailController = TextEditingController(
      text: widget.contact.email,
    );

    nomorController = TextEditingController(
      text: widget.contact.nomor,
    );
  }

  @override
  void dispose() {
    namaController.dispose();
    emailController.dispose();
    nomorController.dispose();
    super.dispose();
  }

  void simpan() {
    if (formKey.currentState!.validate()) {
      widget.contact.nama = namaController.text;
      widget.contact.email = emailController.text;
      widget.contact.nomor = nomorController.text;

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Kontak"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: namaController,
                decoration: const InputDecoration(
                  labelText: "Nama",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Nama wajib diisi";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: nomorController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: "Nomor HP",
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: simpan,
                  icon: const Icon(Icons.save),
                  label: const Text("Simpan Perubahan"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}