import 'package:flutter/material.dart';
import 'package:local_traveler_app/screens/HomePage.dart';
import 'package:local_traveler_app/screens/Onboarding.dart';
import 'package:local_traveler_app/screens/SignupPage.dart';
import 'package:local_traveler_app/viewmodel/my_user_model.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<MyUserModel>(context);

    if (_userModel.state == ViewState.Idle) {
      if (_userModel.user == null) {
        return SignupPage();
      } else {
        return HomePage(userModel: _userModel.user);
      }
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    // if (_userModel.user == null) {
    //   // Show Onboarding
    //   return Onboarding();
    // } else {
    //   // Navigate to HomePage
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     Navigator.of(context).pushReplacement(
    //       MaterialPageRoute(
    //           builder: (context) => HomePage(
    //                 authService: _userModel.user,
    //               )),
    //     );
    //   });
    //   return Container(); // Placeholder while navigation happens
    // }
  }
}
