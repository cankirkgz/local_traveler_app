import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:local_traveler_app/landingPage.dart';
import 'package:local_traveler_app/locator.dart';
import 'package:local_traveler_app/viewmodel/my_trip_model.dart'; // MyTripModel eklenmiştir
import 'package:local_traveler_app/viewmodel/my_user_model.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      appId: '1:557347852821:android:43c5bee81d82769c4ab41c',
      apiKey: 'AIzaSyBIhv-Bq1pighTEhBnwJ3v3ZWb7EY_nL4U',
      messagingSenderId: '557347852821',
      projectId: 'localtraveler-8c69d',
    ),
  );
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyUserModel>(
          create: (context) => MyUserModel(),
        ),
        ChangeNotifierProvider<MyTripModel>(
          // MyTripModel provider'ı eklendi
          create: (context) => MyTripModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: LandingPage(),
      ),
    );
  }
}
