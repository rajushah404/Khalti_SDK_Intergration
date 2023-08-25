import 'package:flutter/material.dart';

class KhaltiInit extends StatefulWidget {
  const KhaltiInit({super.key});

  @override
  State<KhaltiInit> createState() => _KhaltiInitState();
}

class _KhaltiInitState extends State<KhaltiInit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        shadowColor: Colors.blueAccent,
        elevation: 5,
        backgroundColor: Colors.black38,
        centerTitle: true,
        title: const Text(
          "Khalti Payment",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(25),
          )
        ],
      ),
    );
  }
}
