import 'package:flutter/material.dart';
import 'package:reusebook/login.dart';
import 'package:reusebook/uihelper.dart';

class newpasswordPage extends StatelessWidget {
@override
Widget build(BuildContext context) {
  final screenwidth=MediaQuery.of(context).size.width;
  final screenheight=MediaQuery.of(context).size.height;
  return Scaffold(
      body: Stack(
          children: [
            Container(
                decoration: BoxDecoration(
                    color: Color(0xffFFFCCE),
                ),
                child: Container(
                    child:Column(
                    children: [Container(
                        margin: const EdgeInsets.only(top: 70),
                        child: const Center(
                            child:Column(
                                children: [
                                  Text("Create new Password, ",style: TextStyle(fontSize: 22,),),
                                  Text("Make it stronger!",style: TextStyle(fontSize: 22,),),
                                ])
                        )),
                      Container(
                          height: 350,
                          width: 350,
                          child: Center(
                            child:Image.asset('assets/images/Reset password-pana.png'),
                          )
                      )]
                ))
            ),
            Positioned(
                bottom: 0,
                child:Container(
                  margin: EdgeInsets.only(top: 60),
                  width: screenwidth,
                  height: 380,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: Color(0xffFFB330)
                    ),
                    borderRadius: BorderRadius.only(topLeft:Radius.circular(30),topRight:Radius.circular(30)),
                    color: Colors.white,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(top:25,left: 25),
                            child:Text("New Password",style: TextStyle(fontSize: 16,),),),
                      Center(
                          child: Container(
                            margin: const EdgeInsets.only(top: 5,bottom: 10),
                            height: 48,
                            width: 366,
                            child: TextField(
                                obscureText: true,
                                obscuringCharacter: "*",
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    prefixIcon: (Icon(Icons.lock,color: Color(0xffFFB330),size: 20,)),
                                    suffixIcon: (Icon(Icons.remove_red_eye,color: Color(0xff1C1B1F),size: 20,)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Color(0xffFFB330))
                                    ),
                                    hintText: "**********"
                                )),
                          )),
                      Container(
                          margin: const EdgeInsets.only(top:25,left: 25),
                            child:Text("Confirm New Password",style: TextStyle(fontSize: 16,),)
                      ),
                      Center(
                          child: Container(
                            margin: const EdgeInsets.only(top: 5,bottom: 10),
                            height: 48,
                            width: 366,
                            child: TextField(
                                obscureText: true,
                                obscuringCharacter: "*",
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    prefixIcon: (Icon(Icons.lock,color: Color(0xffFFB330),size: 20,)),
                                    suffixIcon: (Icon(Icons.remove_red_eye,color: Color(0xff1C1B1F),size: 20,)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Color(0xffFFB330))
                                    ),
                                    hintText: "**********"
                                )),
                          )),
                      Container(
                          margin: const EdgeInsets.only(top:20),
                          child :Center(
                              child:Column(
                                  children: [
                                    Text("Password must be 8 digit long with combination of ",style: TextStyle(fontSize: 12,),),
                                    Text("alphanumeric values,",style: TextStyle(fontSize: 12,),),
                                  ])
                          )),

                      UiHelper.CustomButton((){Navigator.push(
                          context, MaterialPageRoute(builder: (context) => LoginPage()));}, "Reset Passsword") ,
                    ]),

                ))])
  );
}
}