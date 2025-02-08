import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:reusebook/sell.dart';
import 'package:reusebook/shopkeeper.dart';

import 'categories.dart';
import 'home.dart';
import 'orders.dart';

class notificationsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final screenwidth=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("My Notifications",style: TextStyle(fontSize:25,color: Colors.black),),
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
      noNotification(),
      /*Center(
        child: Container(
    width: screenwidth,
    decoration: BoxDecoration(
    color: Colors.white,
    ),
        child:ListView.separated(
          itemBuilder: (context,Index){
    return ListTile(
    leading: Container(
        margin: EdgeInsets.only(top: 10),
    height: 100,
    width: 100,
    child:Icon(Icons.add_task,size: 32,color: Color(0xff3D4652)) ),
    title: Text("Your Service Status Here",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
    );
    },
      separatorBuilder: (context,Index){
        return Divider(
          height: 10,
          thickness: 3,
          color: Color(0xffD9D9D9),
        );
      },
      itemCount: 15,
    ),
      )),*/
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

class noNotification extends StatelessWidget {

  noNotification();

  @override
  Widget build(BuildContext context) {
    final screenheight=MediaQuery.of(context).size.height;
    return Center(
            child: Container(
              height: screenheight,
              margin: EdgeInsets.only(top:180,left: 20,right: 20),
              child:Column(
                children: [
                Container(
                  margin: EdgeInsets.only(bottom:30),
                height:100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xffFFD77F),
                ),
                child: Icon(Icons.notifications_active_sharp,size:50,color: Color(0xff3D4652),),),
                  Text("No new notifications!",style: TextStyle(fontSize:22,color: Colors.black,fontWeight: FontWeight.w600),),
                  Text("You will be notified with alerts and latest offers over here",textAlign: TextAlign.center,style: TextStyle(fontSize:18,color: Colors.black87,fontWeight: FontWeight.w400),),
                ],
              ),)
    );
  }
}