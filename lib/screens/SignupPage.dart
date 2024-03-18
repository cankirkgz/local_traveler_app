import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:local_traveler_app/services/auth_service.dart';
import 'package:local_traveler_app/viewmodel/my_user_model.dart';
import 'package:local_traveler_app/widgets/CustomButton.dart';
import 'package:local_traveler_app/widgets/CustomInput.dart';
import 'package:local_traveler_app/screens/LoginPage.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  String? _selectedCity;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _selectedCity = null;
    _errorMessage = null;
  }

  void onConnect() {
    String email = emailController.text;
    String password = passwordController.text;
    String name = nameController.text;

    if (email.isEmpty ||
        password.isEmpty ||
        name.isEmpty ||
        _selectedCity == null) {
      setState(() {
        _errorMessage = 'Tüm alanları doldurunuz';
      });
    } else if (!isValidEmail(email)) {
      setState(() {
        _errorMessage = 'Geçersiz email';
      });
    } else {
      setState(() {
        _errorMessage = null;
      });
      AuthService().registerUser(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        city: _selectedCity!,
      );
    }
  }

  bool isValidEmail(String email) {
    String emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regex = RegExp(emailPattern);
    return regex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<MyUserModel>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFFF5733),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20.0)),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top + 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Yerel Gezgin",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Seyahatlerinizi kişiselleştirin",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.8,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomInput(
                    hintText: "Email",
                    isPassword: false,
                    inputType: InputType.TextField,
                    controller: emailController,
                  ),
                  CustomInput(
                    hintText: "Parola",
                    isPassword: true,
                    inputType: InputType.TextField,
                    controller: passwordController,
                  ),
                  CustomInput(
                    hintText: "İsim Soyisim",
                    isPassword: false,
                    inputType: InputType.TextField,
                    controller: nameController,
                  ),
                  CustomInput(
                    hintText: "Şehir seç",
                    isPassword: false,
                    inputType: InputType.Dropdown,
                    onChanged: (selectedCity) {
                      setState(() {
                        _selectedCity = selectedCity;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      text: 'Hesabınız var mı? ',
                      style: TextStyle(color: Colors.white),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Giriş yapın.',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                          // Giriş yapın metnine tıklandığında LoginPage sayfasına yönlendirme
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  _errorMessage != null
                      ? Text(
                          _errorMessage!,
                          style: TextStyle(color: Colors.red),
                        )
                      : SizedBox(),
                  CustomButton(
                    text: "Kayıt Ol",
                    onPressed: onConnect,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
