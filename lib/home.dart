import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:reusebook/categories.dart';
import 'package:reusebook/mystore.dart';
import 'package:reusebook/navbar.dart';
import 'package:reusebook/orders.dart';
import 'package:reusebook/sell.dart';
import 'package:reusebook/shopkeeper.dart';
import 'package:reusebook/splash_screen.dart';



import 'favourites.dart';
import 'notifications.dart';
class homePage extends StatefulWidget {
  const homePage({super.key});
  @override
  State<homePage>createState()=>homePageState();
}
class homePageState extends State<homePage> {
  final TextEditingController _searchController = TextEditingController();
  //late stt.SpeechToText _speech;
  bool _isListening = false;

  /*@override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }
  void _startListening() async {
    bool available = await _speech.initialize();
    if (available) {
      setState(() => _isListening = true);
      _speech.listen(
        onResult: (result) {
          setState(() {
            _searchController.text = result.recognizedWords;
          });
        },
      );
    }
  }

  void _stopListening() {
    setState(() => _isListening = false);
    _speech.stop();
  }*/
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
                        left: 20),
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
                                        prefixIcon: Icon(Icons.search, color: Color(0xff3D4652), size: 20),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            _isListening ? Icons.mic : Icons.mic_none,
                                            color: _isListening ? Colors.red : Color(0xff3D4652),
                                          ),
                                          onPressed: () {
                                           /* if (_isListening) {
                                              _stopListening();
                                            } else {
                                              _startListening();
                                            }*/
                                          },
                                        ),
                                        hintText: 'what_are_you_looking_for'.tr,
                                        enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30)),
                                              borderSide: BorderSide(
                                                  color: Colors.white
                                              )),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30)),
                                      borderSide: BorderSide(color: Color(0xffFFB330))),
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
                              child: Text('books_recommended_for_you'.tr,
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
                              child: Text('trending_books'.tr, style: TextStyle(
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
                              child: Text('browse_categories'.tr, style: TextStyle(
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
                                Text('categories'.tr,
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
                                Text('orders'.tr,
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
                                Text('home'.tr,
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
                                Text('shopkeepers'.tr,
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
                                Text('sell'.tr,
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
