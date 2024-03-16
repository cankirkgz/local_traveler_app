import 'package:flutter/material.dart';
import 'package:local_traveler_app/screens/LocalPeoplePage.dart';
import 'package:local_traveler_app/widgets/CustomButton.dart';
import 'package:local_traveler_app/widgets/CustomInput.dart';

class NewTripPage extends StatelessWidget {
  const NewTripPage({Key? key}) : super(key: key);
  static String? _selectedCity; // Null olarak başlatıldı
  static TextEditingController dateController = TextEditingController();
  static TextEditingController dayController = TextEditingController();
  static TextEditingController budgetController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Yeni Seyahat",
          style: TextStyle(color: Colors.white), // Yazı rengini beyaz yapar
        ),
        backgroundColor: Colors.transparent, // Arka planı transparan yapar
        iconTheme: const IconThemeData(
            color: Colors.white), // İkonların rengini beyaz yapar
        elevation: 0, // Gölgelendirmeyi kaldırır
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "Yeni bir seyahat planla!",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            CustomInput(
              isPassword: false,
              leftIconName: "./assets/icons/map.png",
              rightIconName: "./assets/icons/down.png",
              hintText: "Nereye gideceksiniz?",
              onChanged: (selectedCity) {
                _selectedCity = selectedCity;
              },
              inputType: InputType.Dropdown,
            ),
            CustomInput(
              hintText: "Gidiş Tarihi",
              leftIconName: "./assets/icons/calendar.png",
              isPassword: false,
              controller: dateController,
              inputType: InputType.DatePicker,
            ),
            CustomInput(
              hintText: "Kaç gün kalacaksınız?",
              leftIconName: "./assets/icons/day-and-night.png",
              isPassword: false,
              isNumber: true,
              controller: dayController,
              inputType: InputType.TextField,
            ),
            CustomInput(
              hintText: "Bütçe",
              leftIconName: "./assets/icons/turkish-lira.png",
              isPassword: false,
              isNumber: true,
              controller: budgetController,
              inputType: InputType.TextField,
            ),
            SizedBox(height: 20), // Buton ile arasına boşluk ekleyelim
            CustomButton(
              text: "Oluştur",
              onPressed: () {
                if (_selectedCity != null && _selectedCity!.isNotEmpty) {
                  // Navigator ile LocalPeoplePage'e geçiş ve veri aktarımı yapılacak
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LocalPeoplePage(
                        selectedCity: _selectedCity!,
                        departureDate: dateController.text,
                        stayDuration: dayController.text,
                        budget: budgetController.text,
                      ),
                    ),
                  );
                } else {
                  // Kullanıcıya uyarı göster
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Lütfen bir şehir seçin.'),
                    ),
                  );
                }
              },
              color: Colors.red,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
