import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:reusebook/password.dart';
import 'package:reusebook/services/API_Service.dart';
import 'package:reusebook/uihelper.dart';
import 'package:http/http.dart' as http;
import 'url.dart';

class OTP extends StatefulWidget {
  const OTP({super.key});
  @override
  State<OTP>createState()=>OTPPage();
}

class OTPPage extends State<OTP> {
  bool isAPICallProcess = false;
  TextEditingController EmailText=TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenwidth=MediaQuery.of(context).size.width;
    final screenheight=MediaQuery.of(context).size.height;

    EmailOTP(String email)async{
      if(email==""){
        UiHelper.CustomAlertBox(context, "Please enter a valid email");
      }
      else{
        /*setState(() {
          isAPICallProcess = true;
        });
        APIService.otpLogin(EmailText.text.toString()).then((response)async{
          setState(() {
            isAPICallProcess = false;
          });
          print(response.messsage);
          print(response.data);

          if(response.data != null) {
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context)=>confirmOTP(
                otpHash: response.data,
              EmailText: EmailText.text.toString(),
            ),
                ),
          (route)=>false,);
          }

        });
      }*/
        var data = {
          "EmailText": EmailText.text,
        };
        var response = await http.post(Uri.parse(sendOTP),
            headers:{"Content-Type":"application/json"},
            body:jsonEncode(data)
        );
        if (response.statusCode == 200) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => confirmOTP()));
          print( "OTP sent to your email.");
        } else {
          UiHelper.CustomAlertBox(context, "Failed to send OTP.");
            print("Failed to send OTP.");
        }
      }
    }

    return SafeArea(
      child :Scaffold(
        body: Stack(
            children: [
              Container(
                  color: const Color(0xffFFFCCE),
                  child: Column(
                      children: [Container(
                          margin: const EdgeInsets.only(top: 70),
                          child: const Center(
                              child:Column(
                                  children: [
                                    Text("Forget Your Password, ",style: TextStyle(fontSize: 22,),),
                                    Text("No worries, it happens!",style: TextStyle(fontSize: 22,),),
                                  ])
                          )),
                        Container(
                            height: 350,
                            width: 350,
                            child: Center(
                              child:Image.asset('assets/images/Forgot password-rafiki.png'),
                            )
                        )]
                  )
              ),
              Positioned(
                  bottom: 0,
                  child:Container(
                    margin: EdgeInsets.only(top: 60),
                    width: screenwidth,
                    height: 300,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: Color(0xffFFB330)
                      ),
                      borderRadius: BorderRadius.only(topLeft:Radius.circular(30),topRight:Radius.circular(30)),
                      color: Colors.white,),
                    child: Column(
                      children: [
                        Container(
                            margin: const EdgeInsets.only(top:25),
                            child :Center(
                              child:Text("Enter Email Address*",style: TextStyle(fontSize: 16,),),)
                        ),
                        UiHelper.CustomTextField1(EmailText, "youremail@gmail.com",Icons.email, false) ,
                        Container(
                            margin: const EdgeInsets.only(top:30),
                            child :Center(
                                child:Column(
                                    children: [
                                      Text("Enter your email address to receive a verification code in ",style: TextStyle(fontSize: 12,),),
                                      Text("your mail box.",style: TextStyle(fontSize: 12,),),
                                    ])
                            )),

                       UiHelper.CustomButton((){EmailOTP(EmailText.text.toString());}, "Send OTP") ,

                     ])
                   )
                )
           ])
       )
    );
  }
}
