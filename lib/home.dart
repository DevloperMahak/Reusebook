import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:reusebook/categories.dart';
import 'package:reusebook/mystore.dart';
import 'package:reusebook/navbar.dart';
import 'package:reusebook/orders.dart';
import 'package:reusebook/sell.dart';
import 'package:reusebook/shopkeeper.dart';
import 'package:reusebook/splash_screen.dart';

import 'favourites.dart';
import 'notifications.dart';

class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenwidth=MediaQuery.of(context).size.width;
    final screenheight=MediaQuery.of(context).size.height;
    return Scaffold(
       drawer: Navbar(),
        appBar: AppBar(
          actions: [
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) =>
                              notificationsPage()));
                },
                child: Padding(
                    padding: EdgeInsets.only(
                        left: 210),
                    child: Icon(
                      Icons.notifications, size: 28,
                      color: Color(0xff3D4652),))),
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) =>
                              favouritePage()));
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Icon(
                    Icons.favorite, size: 28,
                    color: Color(0xff3D4652),),)),
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) =>
                              storePage()));
                },
                child: Padding(
                    padding: EdgeInsets.only(
                        left: 20,right: 10),
                    child: Icon(
                      Icons.shopping_cart, size: 28,
                      color: Color(0xff3D4652),)))
          ],
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
              Container(
                  child: SingleChildScrollView(
                    child: Container(
                      height:1050,
                      child: Column(
                          children: [
                            Container(
                              width: screenwidth,
                              height: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.elliptical(200, 100),
                                      bottomLeft: Radius.elliptical(200, 100)),
                                  gradient: LinearGradient(colors: [
                                    Color(0xffFFB330),
                                    Color(0xffFFD77F),
                                    Color(0xffFFFCCE),
                                  ]
                                  )
                              ),
                              child: Column(
                                children: [
                                  Text('$finalEmail'),
                                  Container(
                                    width: 360,
                                    height: 55,
                                    margin: EdgeInsets.only(top: 50),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))
                                    ),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          suffixIcon: (Icon(Icons.search,
                                            color: Color(0xff3D4652),
                                            size: 20,)),
                                          hintText: "What are you looking for ?",
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30)),
                                              borderSide: BorderSide(
                                                  color: Colors.white
                                              )
                                          )

                                      ),
                                    ),
                                  )

                                ],

                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                              margin: EdgeInsets.only(top:20,bottom: 20,left: 20),
                              child: Text("Books recommended for you",
                                style: TextStyle(fontSize: 24,
                                    fontWeight: FontWeight.w600),),
                            ),
                            Container(
                                width: 500,
                                child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row( //Books Row
                                        children: [
                                          Container(
                                              margin: EdgeInsets.only(left: 20),
                                              height: 150,
                                              width: 150,
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius
                                                      .all(Radius.circular(10)),
                                                  color: Color(0xffD9D9D9)
                                              ),
                                              child: Column(
                                                  children: [
                                                    Container(
                                                        height: 70,
                                                        width: 70,
                                                        child: Image.asset(
                                                            'assets/images/book.png')),
                                                    Text("Chemistry Book",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight
                                                                .w500)),
                                                    Text("265 Rs",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight
                                                                .w400)),
                                                    Row(
                                                        mainAxisAlignment: MainAxisAlignment
                                                            .spaceAround,
                                                        children: [
                                                          Icon(Icons
                                                              .location_pin,
                                                              size: 15,
                                                              color: Color(
                                                                  0xff3D4652)),
                                                          Text("Ashok Vihar",
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight: FontWeight
                                                                      .w400)),
                                                        ])
                                                  ])),
                                          Container(
                                              margin: EdgeInsets.only(left: 20),
                                              height: 150,
                                              width: 150,
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius
                                                      .all(Radius.circular(10)),
                                                  color: Color(0xffD9D9D9)
                                              ),
                                              child: Column(
                                                  children: [
                                                    Container(
                                                        height: 70,
                                                        width: 70,
                                                        child: Image.asset(
                                                            'assets/images/book.png')),
                                                    Text("Chemistry Book",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight
                                                                .w500)),
                                                    Text("265 Rs",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight
                                                                .w400)),
                                                    Row(
                                                        mainAxisAlignment: MainAxisAlignment
                                                            .spaceAround,
                                                        children: [
                                                          Icon(Icons
                                                              .location_pin,
                                                              size: 15,
                                                              color: Color(
                                                                  0xff3D4652)),
                                                          Text("Ashok Vihar",
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight: FontWeight
                                                                      .w400)),
                                                        ])
                                                  ])),
                                          Container(
                                              margin: EdgeInsets.only(left: 20),
                                              height: 150,
                                              width: 150,
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius
                                                      .all(Radius.circular(10)),
                                                  color: Color(0xffD9D9D9)
                                              ),
                                              child: Column(
                                                  children: [
                                                    Container(
                                                        height: 70,
                                                        width: 70,
                                                        child: Image.asset(
                                                            'assets/images/book.png')),
                                                    Text("Chemistry Book",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight
                                                                .w500)),
                                                    Text("265 Rs",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight
                                                                .w400)),
                                                    Row(
                                                        mainAxisAlignment: MainAxisAlignment
                                                            .spaceAround,
                                                        children: [
                                                          Icon(Icons
                                                              .location_pin,
                                                              size: 15,
                                                              color: Color(
                                                                  0xff3D4652)),
                                                          Text("Ashok Vihar",
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight: FontWeight
                                                                      .w400)),
                                                        ])
                                                  ])),
                                          Container(
                                              margin: EdgeInsets.only(left: 20),
                                              height: 150,
                                              width: 150,
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius
                                                      .all(Radius.circular(10)),
                                                  color: Color(0xffD9D9D9)
                                              ),
                                              child: Column(
                                                  children: [
                                                    Container(
                                                        height: 70,
                                                        width: 70,
                                                        child: Image.asset(
                                                            'assets/images/book.png')),
                                                    Text("Chemistry Book",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight
                                                                .w500)),
                                                    Text("265 Rs",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight
                                                                .w400)),
                                                    Row(
                                                        mainAxisAlignment: MainAxisAlignment
                                                            .spaceAround,
                                                        children: [
                                                          Icon(Icons
                                                              .location_pin,
                                                              size: 15,
                                                              color: Color(
                                                                  0xff3D4652)),
                                                          Text("Ashok Vihar",
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight: FontWeight
                                                                      .w400)),
                                                        ]
                                                    )
                                                  ]
                                              )
                                          )
                                        ]
                                    ))
                            ),
                            Container(
                              margin: EdgeInsets.only(top:20,bottom: 20,left: 20),
                              child: Text("Trending Books", style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w600),),
                            ),
                            Container(
                                width: 500,
                                child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row( //Books Row
                                        children: [
                                          Container(
                                              margin: EdgeInsets.only(left: 20),
                                              height: 150,
                                              width: 150,
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius
                                                      .all(Radius.circular(10)),
                                                  color: Color(0xffD9D9D9)
                                              ),
                                              child: Column(
                                                  children: [
                                                    Container(
                                                        height: 70,
                                                        width: 70,
                                                        child: Image.asset(
                                                            'assets/images/book.png')),
                                                    Text("Chemistry Book",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight
                                                                .w500)),
                                                    Text("265 Rs",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight
                                                                .w400)),
                                                    Row(
                                                        mainAxisAlignment: MainAxisAlignment
                                                            .spaceAround,
                                                        children: [
                                                          Icon(Icons
                                                              .location_pin,
                                                              size: 15,
                                                              color: Color(
                                                                  0xff3D4652)),
                                                          Text("Ashok Vihar",
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight: FontWeight
                                                                      .w400)),
                                                        ])
                                                  ])),
                                          Container(
                                              margin: EdgeInsets.only(left: 20),
                                              height: 150,
                                              width: 150,
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius
                                                      .all(Radius.circular(10)),
                                                  color: Color(0xffD9D9D9)
                                              ),
                                              child: Column(
                                                  children: [
                                                    Container(
                                                        height: 70,
                                                        width: 70,
                                                        child: Image.asset(
                                                            'assets/images/book.png')),
                                                    Text("Chemistry Book",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight
                                                                .w500)),
                                                    Text("265 Rs",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight
                                                                .w400)),
                                                    Row(
                                                        mainAxisAlignment: MainAxisAlignment
                                                            .spaceAround,
                                                        children: [
                                                          Icon(Icons
                                                              .location_pin,
                                                              size: 15,
                                                              color: Color(
                                                                  0xff3D4652)),
                                                          Text("Ashok Vihar",
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight: FontWeight
                                                                      .w400)),
                                                        ])
                                                  ])),
                                          Container(
                                              margin: EdgeInsets.only(left: 20),
                                              height: 150,
                                              width: 150,
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius
                                                      .all(Radius.circular(10)),
                                                  color: Color(0xffD9D9D9)
                                              ),
                                              child: Column(
                                                  children: [
                                                    Container(
                                                        height: 70,
                                                        width: 70,
                                                        child: Image.asset(
                                                            'assets/images/book.png')),
                                                    Text("Chemistry Book",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight
                                                                .w500)),
                                                    Text("265 Rs",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight
                                                                .w400)),
                                                    Row(
                                                        mainAxisAlignment: MainAxisAlignment
                                                            .spaceAround,
                                                        children: [
                                                          Icon(Icons
                                                              .location_pin,
                                                              size: 15,
                                                              color: Color(
                                                                  0xff3D4652)),
                                                          Text("Ashok Vihar",
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight: FontWeight
                                                                      .w400)),
                                                        ])
                                                  ])),
                                          Container(
                                              margin: EdgeInsets.only(left: 20),
                                              height: 150,
                                              width: 150,
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius
                                                      .all(Radius.circular(10)),
                                                  color: Color(0xffD9D9D9)
                                              ),
                                              child: Column(
                                                  children: [
                                                    Container(
                                                        height: 70,
                                                        width: 70,
                                                        child: Image.asset(
                                                            'assets/images/book.png')),
                                                    Text("Chemistry Book",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight
                                                                .w500)),
                                                    Text("265 Rs",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight
                                                                .w400)),
                                                    Row(
                                                        mainAxisAlignment: MainAxisAlignment
                                                            .spaceAround,
                                                        children: [
                                                          Icon(Icons
                                                              .location_pin,
                                                              size: 15,
                                                              color: Color(
                                                                  0xff3D4652)),
                                                          Text("Ashok Vihar",
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight: FontWeight
                                                                      .w400)),
                                                        ]
                                                    )
                                                  ]
                                              )
                                          )
                                        ]
                                    ))
                            ),
                            Container(
                              margin: EdgeInsets.only(top:20,bottom: 20,left: 20),
                              child: Text("Browse categories", style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w600),),
                            ),
                            Container(
                                width: 500,
                                child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row( //Books Row
                                        children: [
                                          Container(
                                              margin: EdgeInsets.only(left: 20),
                                              height: 150,
                                              width: 150,
                                              padding: EdgeInsets.all(10),
                                              child: Column(
                                                  children: [
                                                    Container(
                                                      height: 70,
                                                      width: 70,
                                                      margin: EdgeInsets.only(
                                                          bottom: 10),
                                                      child: CircleAvatar(
                                                          backgroundImage: AssetImage(
                                                              'assets/images/144386-OTFX3B-277.jpg')),
                                                    ),
                                                    Text("School Books",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight
                                                                .w500)),
                                                  ])),
                                          Container(

                                              height: 150,
                                              width: 150,
                                              padding: EdgeInsets.all(10),
                                              child: Column(
                                                  children: [
                                                    Container(
                                                      height: 70,
                                                      width: 70,
                                                      margin: EdgeInsets.only(
                                                          bottom: 10),
                                                      child: CircleAvatar(
                                                          backgroundImage: AssetImage(
                                                              'assets/images/books-with-graduation-cap-digital-art-style-education-day.jpg')),
                                                    ),
                                                    Text("College Books",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight
                                                                .w500)),
                                                  ])),
                                          Container(
                                              height: 150,
                                              width: 150,
                                              padding: EdgeInsets.all(10),
                                              child: Column(
                                                  children: [
                                                    Container(
                                                      height: 70,
                                                      width: 70,
                                                      margin: EdgeInsets.only(
                                                          bottom: 10),
                                                      child: CircleAvatar(
                                                          backgroundImage: AssetImage(
                                                              'assets/images/best-seller.png')),
                                                    ),
                                                    Text("Competition Books",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight
                                                                .w500)),
                                                  ])),
                                          Container(

                                              height: 150,
                                              width: 150,
                                              padding: EdgeInsets.all(10),
                                              child: Column(
                                                  children: [
                                                    Container(
                                                      height: 70,
                                                      width: 70,
                                                      margin: EdgeInsets.only(
                                                          bottom: 10),
                                                      child: CircleAvatar(
                                                          backgroundImage: AssetImage(
                                                              'assets/images/axi0_fky7_220310.jpg')),
                                                    ),
                                                    Text("Story Books",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight
                                                                .w500)),
                                                  ])),
                                          Container(
                                              height: 150,
                                              width: 150,
                                              padding: EdgeInsets.all(10),
                                              child: Column(
                                                  children: [
                                                    Container(
                                                      height: 70,
                                                      width: 70,
                                                      margin: EdgeInsets.only(
                                                          bottom: 10),
                                                      child: CircleAvatar(
                                                          backgroundImage: AssetImage(
                                                              'assets/images/otherBooks.jpg')),
                                                    ),
                                                    Text("Other Books",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight
                                                                .w500)),
                                                  ])),
                                        ]
                                    ))),

                          ]),
                    ])
                  )
              )
    ),
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
    ])
    );
  }
  }
