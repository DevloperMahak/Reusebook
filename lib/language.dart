import 'package:flutter/material.dart';
import 'package:reusebook/home.dart';
import 'package:reusebook/newpassword.dart';
import 'package:reusebook/uihelper.dart';

class LanguagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenwidth=MediaQuery.of(context).size.width;
    final screenheight=MediaQuery.of(context).size.height;
    return Scaffold(
        body:Stack(
            children: [
              Container(
            color: const Color(0xffFFFCCE),
            child: Column(
                children: [Container(
                    margin: const EdgeInsets.only(top: 80),
                      child: const Center(
                        child:Text("Choose Language",style: TextStyle(fontSize: 22,fontWeight:FontWeight.w600),),
                      )),
                  Container(
                    height: 350,
                    width: 350,
                    child: Image.asset('assets/images/Translator-pana 1.png'),
                  ),
                  Container(
                    child:Center(
                  child:Column(
                    children: [
                      Text("Please,help us to know your",style: TextStyle(fontSize: 22,),),
                      Text("preferred language.",style: TextStyle(fontSize: 22,),),
                      ])
                  ))
                ])),
                  Positioned(
                  bottom: 0,
                  child:Center(
                  child:Container(
                    margin: EdgeInsets.only(top: 30),
                    width: screenwidth,
                    height: 275,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(32),topLeft:Radius.circular(32)),
                    color: Colors.white,
                      border: Border.all(
                          width: 1,
                          color: Color(0xffFFB330)
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(left:25,top:25),
                              child:Align(
                                alignment: Alignment.centerLeft,
    child:Text("Select Language",style: TextStyle(fontSize: 20,fontWeight:FontWeight.w500),),
                        )),
                        Container(
                          margin: const EdgeInsets.only(left:25,top:10,bottom: 15),
                                child:Align(
                                  alignment: Alignment.centerLeft,
    child:Text("All the information will be seen in this language",style: TextStyle(fontSize: 18,),),
                          )),
                        Center(
                        child:Container(
                          margin: const EdgeInsets.only(top: 5),
                          height: 48,
                          width: 366,
                          child: const TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.language_rounded,color: Color(0xffFFB330),size: 20,),
                                  suffixIcon: Icon(Icons.arrow_drop_down,color: Color(0xff1C1B1F),size: 20,),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xffFFB330))
                                  ),
                                  hintText: "Select language"
                              )),
                        )),

                        UiHelper.CustomButton((){}, "Confirm") ,
                      ]
                    )
                  ))
                  )
            ])
    );
  }
}