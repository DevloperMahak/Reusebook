import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reusebook/home.dart';
import 'package:reusebook/login.dart';
import 'package:reusebook/url.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CheckUser extends StatefulWidget{
  const CheckUser({super.key});
  @override
  State<CheckUser>createState()=>_CheckUserState();
}

class _CheckUserState extends State<CheckUser> {

  @override
  void initState() {
    super.initState();
    checkuser(); // Call the checkUser method when the widget is initialized
  }

  Widget build(BuildContext context) {
    return Scaffold();
  }

  checkuser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token'); // Get the stored token
    // If token exists, validate with backend
    if (token != null) {
      // If a token exists, make an API call to validate the user
      final response = await http.get(
        Uri.parse(checkLogin),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        // If the response is successful, navigate to the home page
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => homePage()
            ));
      } else {
        // If the token is invalid, navigate to the login page
        return Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => LoginPage()
            ));
      }
    }
    else {
      // No token found, go to Login page
      print("No token found, go to Login page");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }
  }
}
