import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:reusebook/selldetails.dart';
import 'package:reusebook/shopkeeper.dart';
import 'package:reusebook/uihelper.dart';

import 'categories.dart';
import 'home.dart';
import 'orders.dart';

class sellPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final screenwidth=MediaQuery.of(context).size.width;
    final screenheight=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Sell",style: TextStyle(fontSize:25,color: Colors.black),),
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
      body: Stack(
          children: [
            SingleChildScrollView(
      child:Container(
        height:1450 ,
      child:Column(
              children:[
                Center(
               child:Container(
               height:180,
               width:250,
              child: UiHelper.CustomButton((){Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => selldetails()));}, "Sell"),
            )),
                Container(
                    child: Text("Selling Details",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight
                            .w600))),
                Container(
                  height: 100,
                  width: 100,
                  margin: const EdgeInsets.only(top:20,),
                  child: Center(
                      child:Image.asset('assets/images/google-analytics.png')),
                ),
                Container(
                    margin: const EdgeInsets.only(top:30,left: 30),
            child:Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(right:10,),
                          child: Icon(Icons.circle,size: 20,
                            color: Color(
                                0xff3D4652))),
                        Text("No.of books you post ",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight
                                    .w500)),
                        Container(
                            margin: const EdgeInsets.only(right:10,),
                            child: Icon(Icons.horizontal_rule_outlined,size: 20,
                                color: Color(
                                    0xff3D4652))),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(right:10,),
                            child: Icon(Icons.circle,size: 20,
                                color: Color(
                                    0xff3D4652))),
                        Text("No.of books sold",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight
                                    .w500)),
                        Container(
                            margin: const EdgeInsets.only(right:10,),
                            child: Icon(Icons.horizontal_rule_outlined,size: 20,
                                color: Color(
                                    0xff3D4652))),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(right:10,),
                            child: Icon(Icons.circle,size: 20,
                                color: Color(
                                    0xff3D4652))),
                        Text("No.of books not sold ",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight
                                    .w500)),
                        Container(
                            margin: const EdgeInsets.only(right:10,),
                            child: Icon(Icons.horizontal_rule_outlined,size: 20,
                                color: Color(
                                    0xff3D4652))),
                      ])
                  ])
                ),
                Container(
                  margin: const EdgeInsets.only(top:  30,bottom: 20),
                  child:Text("How It Works? ",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight
                            .w600)),
                ),
                Column(
                  children: [
                    Container(
                      height: 230,
                      width: 335,
                      decoration: BoxDecoration(
                        boxShadow:  [
                      BoxShadow(color: Colors.black.withOpacity(0.2), // Shadow color with opacity
                    blurRadius: 3, // Softness of the shadow
                    spreadRadius: 1, // How much the shadow expands
                    offset: Offset(2, 2),)], // X and Y position of the shadow,
                        borderRadius: BorderRadius.all(
                             Radius.circular(20)),
                            gradient: LinearGradient(
                            begin: Alignment.topLeft,  // Start point
                            end: Alignment.bottomRight, // End point
                            colors: [
                            Colors.white,
                        Color(0xffFFFCCE),
                      ])),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left:180),
                            height: 50,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20)),
                              color: Color(0xffFFB330),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child:Text("Step 1 ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight
                                      .w500),)),
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            margin: const EdgeInsets.only(top:0),
                            child: Center(
                                child:Image.asset('assets/images/advertising (1).png')),
                          ),
                      Container(
                        margin: const EdgeInsets.only(top:10,),
                        child:Text("Post an ad for selling used books ",
                            style: TextStyle(
                              color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight
                                    .w600),),
                      ),
                          Center(
                              child:Container(
                            margin: const EdgeInsets.only(top:10,),
                                    padding: const EdgeInsets.only(left:15,),
                              child:Text("Post an ad on ‘Reuse Book’ describing your book details to sell your old books online ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize:16,
                                  fontWeight: FontWeight
                                      .w400),),
                          )
                          )
                        ]),
                    ),
                    Container(
                      height: 230,
                      width: 335,
                      margin: const EdgeInsets.only(top:10),
                      decoration: BoxDecoration(
                          boxShadow:  [
                            BoxShadow(color: Colors.black.withOpacity(0.2), // Shadow color with opacity
                              blurRadius: 3, // Softness of the shadow
                              spreadRadius: 1, // How much the shadow expands
                              offset: Offset(2, 2),)], // X and Y position of the shadow,
                          borderRadius: BorderRadius.all(
                              Radius.circular(20)),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,  // Start point
                              end: Alignment.bottomRight, // End point
                              colors: [
                                Colors.white,
                                Color(0xffFFFCCE),
                              ])),
                      child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left:180),
                              height: 50,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20)),
                                color: Color(0xffFFB330),
                              ),
                              child: Align(
                                  alignment: Alignment.center,
                                  child:Text("Step 2 ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight
                                            .w500),)),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              margin: const EdgeInsets.only(top:0),
                              child: Center(
                                  child:Image.asset('assets/images/best-price (1).png')),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top:10,),
                              child:Text("Set the selling price for your books ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight
                                        .w600),),
                            ),
                            Center(
                                child:Container(
                                  margin: const EdgeInsets.only(top:10,),
                                  padding: const EdgeInsets.only(left:15,),
                                  child:Text("Set the price for your books at which you want to sell them. ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize:16,
                                        fontWeight: FontWeight
                                            .w400),),
                                )
                            )
                          ]),
                    ),
                    Container(
                      height: 230,
                      width: 335,
                      margin: const EdgeInsets.only(top:10),
                      decoration: BoxDecoration(
                          boxShadow:  [
                            BoxShadow(color: Colors.black.withOpacity(0.2), // Shadow color with opacity
                              blurRadius: 3, // Softness of the shadow
                              spreadRadius: 1, // How much the shadow expands
                              offset: Offset(2, 2),)], // X and Y position of the shadow,
                          borderRadius: BorderRadius.all(
                              Radius.circular(20)),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,  // Start point
                              end: Alignment.bottomRight, // End point
                              colors: [
                                Colors.white,
                                Color(0xffFFFCCE),
                              ])),
                      child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left:180),
                              height: 50,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20)),
                                color: Color(0xffFFB330),
                              ),
                              child: Align(
                                  alignment: Alignment.center,
                                  child:Text("Step 3 ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight
                                            .w500),)),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              margin: const EdgeInsets.only(top:0),
                              child: Center(
                                  child:Image.asset('assets/images/pay (1).png')),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top:10,),
                              child:Text("Get paid into your UPI/Bank account ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight
                                        .w600),),
                            ),
                            Center(
                                child:Container(
                                  margin: const EdgeInsets.only(top:10,),
                                  padding: const EdgeInsets.only(left:15,),
                                  child:Text("You will get money into your account once you recieve an order for your book.",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize:16,
                                        fontWeight: FontWeight
                                            .w400),),
                                )
                            )
                          ]),
                    ),
                  ]),
                Container(
                    margin: const EdgeInsets.only(top:30),
                    child: Text("Give your feedback here >",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 25,
                            fontWeight: FontWeight
                                .w500))),
           ])
      )),
            Positioned(
                bottom: 0,
                child: Container(
                    height: 75,
                    width: screenwidth,
                    color: Colors.white,
                    child:Center(
                        child:Container(
                          width: 395,
                          height: 65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30)),
                            color: Color(0xffFFD77F),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 8),
                                child: Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (context) =>
                                                  categoriesPage()));
                                        },
                                        child: Container(
                                          height: 32,
                                          width: 32,
                                          child: Image.asset(
                                            "assets/images/categories.png",),),),
                                      Text("categories",
                                          style: TextStyle(fontSize: 12, color: Color(
                                              0xff3D4652)))
                                    ]),),
                              Container(
                                padding: EdgeInsets.only(top: 8),
                                child: Column(
                                    children: [InkWell(
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) => orderPage()));
                                        },
                                        child: Container(
                                          height: 32,
                                          width: 32,
                                          child: Image.asset(
                                            "assets/images/package.png",),)),
                                      Text("orders",
                                          style: TextStyle(fontSize: 12, color: Color(
                                              0xff3D4652)))
                                    ]),),
                              Container(
                                padding: EdgeInsets.only(top: 8),
                                child: Column(
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        homePage()));
                                          },
                                          child: CircleAvatar(
                                              backgroundColor: Colors.white,
                                              child: Icon(Icons.home, size: 32,
                                                  color: Color(0xff3D4652)))),
                                      Text("Home",
                                          style: TextStyle(fontSize: 12, color: Color(
                                              0xff3D4652)))
                                    ]),),
                              Container(
                                padding: EdgeInsets.only(top: 8),
                                child: Column(
                                    children: [InkWell(
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (context) =>
                                                  shopkeeperPage()));
                                        },
                                        child: Container(
                                          height: 32,
                                          width: 32,
                                          child: Image.asset(
                                            "assets/images/merchant.png",),)),
                                      Text("Shopkeepers",
                                          style: TextStyle(fontSize: 12, color: Color(
                                              0xff3D4652)))
                                    ]),),
                              Container(
                                padding: EdgeInsets.only(top: 8),
                                child: Column(
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        sellPage()));
                                          },
                                          child: Container(
                                            height: 32,
                                            width: 32,
                                            child: Image.asset(
                                              "assets/images/sell.png",),)),
                                      Text("Sell",
                                          style: TextStyle(fontSize: 12, color: Color(
                                              0xff3D4652)))
                                    ]),),
                            ],
                          ),
                        )
                    )
                )
            )
          ]),
    );
  }
}