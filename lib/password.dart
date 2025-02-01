import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:reusebook/newpassword.dart';
import 'package:reusebook/uihelper.dart';
import 'package:http/http.dart' as http;
import 'package:sms_autofill/sms_autofill.dart';
import 'url.dart';

class confirmOTP extends StatefulWidget {
  const confirmOTP({super.key});
  @override
  State<confirmOTP>createState()=>confirmOTPPage();
}

class confirmOTPPage extends State<confirmOTP> {

  @override
  Widget build(BuildContext context) {
    final screenwidth=MediaQuery.of(context).size.width;
    final screenheight=MediaQuery.of(context).size.height;

      return Scaffold(
          body: Stack(
              children: [
                Container(
                    color: const Color(0xffFFFCCE),
                    child: Column(
                        children: [Container(
                            margin: const EdgeInsets.only(top: 70),
                            child: const Center(
                                child: Column(
                                    children: [
                                      Text("Verify your Email address ",
                                        style: TextStyle(fontSize: 22,),),
                                      Text("Hey, have You Received!",
                                        style: TextStyle(fontSize: 22,),),
                                    ])
                            )),
                          Container(
                              height: 350,
                              width: 350,
                              child: Center(
                                child: Image.asset(
                                    'assets/images/Enter OTP-rafiki.png'),
                              )
                          )
                        ]
                    )
                ),
                Positioned(
                    bottom: 0,
                    child: Container(
                      margin: EdgeInsets.only(top: 60),
                      width: screenwidth,
                      height: 300,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1,
                            color: Color(0xffFFB330)
                        ),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                        color: Colors.white,),
                      child: Column(
                          children: [
                            Container(
                                margin: const EdgeInsets.only(top: 25),
                                child: Center(
                                  child: Text(
                                    "Enter One Time OTP", style: TextStyle(
                                    fontSize: 16,),),)
                            ),
                            Center(
                                child: Container(
                                  margin: const EdgeInsets.only(top: 5),
                                  height: 48,
                                  width: 366,
                                  child: const TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.av_timer,color: Color(0xffFFB330),size: 20,),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Color(0xffFFB330))
                                          ),
                                          hintText: "XXXXXX"
                                      )),
                                )),
                            Container(
                                margin: const EdgeInsets.only(top: 30),
                                child: Center(
                                    child: Column(
                                        children: [
                                          Text(
                                            "Please, Enter your six digit code that you have received in",
                                            style: TextStyle(fontSize: 12,),),
                                          Text("your mail box. Resend OTP",
                                            style: TextStyle(fontSize: 12,),),
                                        ])
                                )),
                            UiHelper.CustomButton((){}, "Send OTP") ,
                          ]),

                    ))
              ])
      );
    }
  }

