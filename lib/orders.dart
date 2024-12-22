import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:reusebook/sell.dart';
import 'package:reusebook/shopkeeper.dart';

import 'categories.dart';
import 'home.dart';

class orderPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final screenwidth=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Orders",style: TextStyle(fontSize:28,color: Colors.black),),
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