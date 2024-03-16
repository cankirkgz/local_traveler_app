import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String personName;

  const ChatPage({Key? key, required this.personName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          personName,
          style: TextStyle(color: Colors.white), // Başlık rengini beyaz yap
        ),
        backgroundColor: Colors.black, // AppBar arka planını siyah yap
        iconTheme: IconThemeData(
            color: Colors.white), // AppBar ikonlarının rengini beyaz yap
      ),
      backgroundColor: Colors.black, // Sayfa arka planını siyah yap
      body: Center(
        child: Text(
          "Message Detail Page",
          style: TextStyle(color: Colors.white), // Metin rengini beyaz yap
        ),
      ),
    );
  }
}
