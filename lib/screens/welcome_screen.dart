import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vitask/apis/profile.dart';
import 'package:vitask/constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'dashboard.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String regNo;
  String password;
  String url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TypewriterAnimatedTextKit(
                text: ['VITask'],
                textAlign: TextAlign.center,
                textStyle: TextStyle(
                  fontSize: 45.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: Image.asset('images/blue.png'),
                height: 60.0,
              ),
              SizedBox(height: 18),
              TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  regNo = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your Registration No.'),
              ),
              SizedBox(
                height: 30.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your Password'),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  elevation: 5.0,
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(30.0),
                  child: MaterialButton(
                    onPressed: () async {
                      regNo = '18BLC1082';
                      password = 'St.franciscollege1';
                      url =
                          'https://vitask.me/authenticate?username=$regNo&password=$password';
                      ProfileAPI profile_api = ProfileAPI(url);
                      var profileData = await profile_api.getProfileData();
                      print(profileData['Name']);
                      print(profileData['Branch']);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MenuDashboardPage(profileData),
                        ),
                      );
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}