import 'package:flutter/material.dart';

class NewTripPage extends StatelessWidget {
  const NewTripPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Seyahat"),
      ),
      body: Center(
        child: Text("New Trip Page"),
      ),
    );
  }
}
