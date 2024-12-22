import 'package:flutter/material.dart';
import 'package:reusebook/password.dart';
import 'package:reusebook/uihelper.dart';

class OTP extends StatelessWidget {
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
                        Center(
                            child: Container(
                              margin: const EdgeInsets.only(top: 5),
                              height: 48,
                              width: 366,
                              child: const TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.email,color: Color(0xffFFB330),size: 20,),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Color(0xffFFB330))
                                      ),
                                      hintText: "youremail@gmail.com"
                                  )),
                            )),
                        Container(
                            margin: const EdgeInsets.only(top:30),
                            child :Center(
                                child:Column(
                                    children: [
                                      Text("Enter your email address to receive a verification code in ",style: TextStyle(fontSize: 12,),),
                                      Text("your mail box.",style: TextStyle(fontSize: 12,),),
                                    ])
                            )),

                       UiHelper.CustomButton((){}, "Send OTP") ,

                     ])
                   )
                )
           ])
       );
  }
}
