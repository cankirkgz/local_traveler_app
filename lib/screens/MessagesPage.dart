import 'package:flutter/material.dart';
import 'package:local_traveler_app/screens/ChatPage.dart';
import 'package:local_traveler_app/widgets/CustomInput.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kontaktların",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black, // AppBar arka planını siyah yap
      ),
      backgroundColor: Colors.black, // Sayfa arka planını siyah yap
      body: Column(
        children: [
          CustomInput(
            hintText: "Kontaktların içinde ara",
            leftIconName: "./assets/icons/search.png",
            rightIconName: "./assets/icons/menu.png",
            isPassword: false,
            inputType: InputType.TextField,
          ),
          SizedBox(height: 10), // Aralarına bir boşluk ekleyelim
          Text(
            "Sohbet İsteğini Kabul Edenler",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(height: 10), // Aralarına bir boşluk ekleyelim

          SizedBox(height: 10), // Aralarına bir boşluk ekleyelim
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Örnek için 10 kişi oluşturuyoruz
              itemBuilder: (context, index) {
                return _buildMessageCard(context, index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAcceptedRequestItem(BuildContext context, int index) {
    return Container(
      width: MediaQuery.of(context).size.width / 10,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
      decoration: BoxDecoration(
        color: Colors.grey[900], // Kart arka planını gri tonlarında yap
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          CircleAvatar(
            // Örnek olarak varsayılan bir profil fotoğrafı ekliyoruz
            backgroundImage: AssetImage('assets/icons/person.png'),
          ),
          SizedBox(height: 5),
          Text(
            "İsim $index",
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageCard(BuildContext context, int index) {
    // Örnek bir kişi oluşturuyoruz
    final personName = "Kişi $index";
    final lastMessage = "Son Mesaj $index";
    final isMessageSeen =
        index.isEven; // Her ikinci mesajı görülmüş olarak kabul ediyoruz

    return Card(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      color: Colors.grey[900], // Kart arka planını gri tonlarında yap
      child: ListTile(
        leading: CircleAvatar(
          // Örnek olarak varsayılan bir profil fotoğrafı ekliyoruz
          backgroundImage: AssetImage('assets/icons/person.png'),
        ),
        title: Text(
          personName,
          style: TextStyle(color: Colors.white), // Başlık rengini beyaz yap
        ),
        subtitle: Text(
          lastMessage,
          style: TextStyle(color: Colors.white), // Altbaşlık rengini beyaz yap
        ),
        trailing: isMessageSeen
            ? Icon(Icons.check_circle,
                color: Colors.blue) // Mesaj görülmüşse mavi tik işareti göster
            : Icon(Icons.check_circle_outline,
                color:
                    Colors.grey), // Mesaj görülmemişse gri tik işareti göster
        onTap: () {
          // Mesaj detay sayfasına geçiş yapabilirsiniz
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(personName: personName),
            ),
          );
        },
      ),
    );
  }
}
