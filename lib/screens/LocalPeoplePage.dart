import 'package:flutter/material.dart';

class LocalPeoplePage extends StatefulWidget {
  final String selectedCity;
  final String departureDate;
  final String stayDuration;
  final String budget;

  const LocalPeoplePage({
    required this.selectedCity,
    required this.departureDate,
    required this.stayDuration,
    required this.budget,
    Key? key,
  }) : super(key: key);

  @override
  _LocalPeoplePageState createState() => _LocalPeoplePageState();
}

class _LocalPeoplePageState extends State<LocalPeoplePage> {
  List<bool> _isSendingRequestList = List.generate(5, (_) => false);
  List<String> _buttonTexts = List.generate(5, (_) => 'Sohbet İsteği Gönder');

  @override
  Widget build(BuildContext context) {
    String _appBarTitle = "${widget.selectedCity} şehrindeki yereller";
    final appBarFontSize = _appBarTitle.length > 30
        ? 20.0
        : 24.0; // Yazı uzunluğuna bağlı olarak font boyutunu ayarla

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Arka planı transparan yapar
        title: Text(
          _appBarTitle,
          style: TextStyle(
            fontSize:
                appBarFontSize, // Yazı uzunluğuna bağlı olarak font boyutunu ayarla
            color: Colors.white, // Yazı rengini beyaz yapar
          ),
        ),
        iconTheme: IconThemeData(
            color: Colors.white), // AppBar'daki ikonların rengini beyaz yapar
      ),
      body: ListView.builder(
        itemCount: 5, // Örnek için 5 kişi oluşturuyoruz
        itemBuilder: (context, index) {
          return _buildPersonCard(context, index);
        },
      ),
    );
  }

  Widget _buildPersonCard(BuildContext context, int index) {
    return Card(
      margin: EdgeInsets.all(10),
      color: Colors.grey[900],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: CircleAvatar(
            // Örnek olarak varsayılan bir profil fotoğrafı ekledik
            backgroundImage: AssetImage('assets/icons/home.png'),
          ),
          title: Text(
            'Kişi Adı ${index + 1}',
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Şehir: ${widget.selectedCity}',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          trailing: ElevatedButton(
            onPressed: () {
              if (_buttonTexts[index] == 'Sohbet İsteği Gönder') {
                _sendRequestAndShowIndicator(index);
              } else if (_buttonTexts[index] == 'İstek Gönderildi') {
                _cancelRequest(index);
              }
            },
            child: _isSendingRequestList[index]
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Text(
                    _buttonTexts[index],
                    style: TextStyle(color: Colors.black),
                  ),
          ),
        ),
      ),
    );
  }

  void _sendRequestAndShowIndicator(int index) {
    setState(() {
      _isSendingRequestList[index] = true;
      _buttonTexts[index] = 'İstek Gönderildi';
    });

    // Yarım saniye sonra istek gönderildiğini göster
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _isSendingRequestList[index] = false;
      });
      print('Sohbet isteği gönderildi: Kişi Adı $index');
    });
  }

  void _cancelRequest(int index) {
    setState(() {
      _buttonTexts[index] = 'Sohbet İsteği Gönder';
    });
  }
}
