import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tentang"),
        centerTitle: false,
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              CircleAvatar(
                radius: 60,
                backgroundImage:
                    const AssetImage("assets/images/profile.jpeg"),
              ),

              const SizedBox(height: 20),

              const Text(
                "Aliimma Afilla Prima",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "XII RPL B",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                "SMK Negeri 5 Surakarta",
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}