import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local_traveler_app/screens/PopularDestinationsPage.dart';
import 'package:local_traveler_app/screens/HiddenGemsPage.dart';
import 'package:local_traveler_app/widgets/CustomInput.dart';
import 'package:local_traveler_app/widgets/DiscoverItem.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          CustomInput(
            hintText: "Lokalleri ara",
            leftIconName: "./assets/icons/search.png",
            rightIconName: "./assets/icons/menu.png",
            isPassword: false,
            inputType: InputType.TextField,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
            child: Text(
              "Lokalleri Keşfet",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          DiscoverItem(
            iconPath: "./assets/icons/map-travel.png",
            title: "Popüler Hedefler",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PopularDestinationsPage(),
                ),
              );
            },
          ),
          DiscoverItem(
            iconPath: "./assets/icons/binoculars.png",
            title: "Saklı Hazineler",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HiddenGemsPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
