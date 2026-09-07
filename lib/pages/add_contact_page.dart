import 'package:flutter/material.dart';

import '../models/contact.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({super.key});

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {

  final formKey = GlobalKey<FormState>();

  final namaController = TextEditingController();
  final emailController = TextEditingController();
  final nomorController = TextEditingController();

  @override
  void dispose() {
    namaController.dispose();
    emailController.dispose();
    nomorController.dispose();
    super.dispose();
  }

  void simpan() {

    if (formKey.currentState!.validate()) {

      Navigator.pop(

        context,

        Contact(

          nama: namaController.text,

          email: emailController.text,

          nomor: nomorController.text,

        ),

      );

    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Tambah Kontak"),
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

                  label: const Text("Simpan"),

                ),

              ),

            ],

          ),

        ),

      ),

    );

  }

}