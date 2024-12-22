import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class storePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Store",style: TextStyle(fontSize:28,color: Colors.black),),
        flexibleSpace:Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xffFFB330),
              Color(0xffFFD77F),
              Color(0xffFFFCCE),
            ])
          ),
        ),
      ),
      body: Center(
    child:Container(
        margin: EdgeInsets.only(top: 20,bottom: 10),
        height: 730,
        width: 370,
        decoration: BoxDecoration(
          color: Colors.white,
borderRadius: BorderRadius.all(Radius.circular(20)),
          border:Border.all(
            color: Colors.black
          ) ,
        ),
        child: Container(
          margin: EdgeInsets.only(top: 180),
    child:Column(
          children: [
            Container(
                margin: EdgeInsets.only(bottom: 20),
                height:80,
                width: 80,
                child: Image.asset('assets/images/add-to-cart.png')),
            Text("Your basket is empty",style: TextStyle(fontSize:28,color: Colors.black,fontWeight: FontWeight.w600),),
          Container(
              margin: EdgeInsets.only(top:30,bottom: 30),
            child:ElevatedButton(
                style:ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xffFFB330),
                ),
              onPressed: () {
                print("Continue Purchasing");
              },
              child: const Text("Continue Purchasing"))),
            Text("Have an account",style: TextStyle(fontSize:20,color: Colors.black,fontWeight: FontWeight.w400),),
            Text("Log in to check out faster",style: TextStyle(fontSize:20,color: Colors.black,fontWeight: FontWeight.w400),),
          ],
        ),))
      ),
    );
  }
}