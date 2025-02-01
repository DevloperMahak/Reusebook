import 'dart:async';

import 'package:flutter/material.dart';
import 'package:reusebook/checkuser.dart';
import 'package:reusebook/home.dart';
import 'package:reusebook/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? finalEmail;

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => SplashScreenPage();
}

class SplashScreenPage extends State<SplashScreen> {
  @override
  void initState(){
    getValidationData().whenComplete(()async{
      Timer(Duration(seconds: 5),(){
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context)=>(finalEmail == null ? LoginPage(): homePage())
            ));
      });
    });
    super.initState();
  }

  Future getValidationData()async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var obtainedEmail = sharedPreferences.getString('email');
    setState(() {
      finalEmail = obtainedEmail;
    });
    print(finalEmail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffEBEAE7),
      ),
      body: Container(
        color: const Color(0xffE7E7E6),
        child: Center(
            child: Image.asset(
                'assets/images/create-a-flat-vector-illustrative-style-lettermark-dZYh0NYtTOmZ38Q-v7IuVQ-HROmqDXwRqaUP-beJuUCMg.jpeg')),
      ),
    );
  }
}
