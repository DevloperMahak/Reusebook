import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:reusebook/sell.dart';
import 'package:reusebook/shopkeeper.dart';

import 'categories.dart';
import 'home.dart';
import 'orders.dart';

class notificationsPage extends StatelessWidget {
  final List<String> notifications = [
    "Your order #1234 has been shipped.",
    "Your item has been sold!",
    "New offer: Get 10% off on all used books.",
    "Your request has been accepted by the seller.",
    // Add more notifications or leave list empty to show the "no notifications" UI
  ];

  notificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth=MediaQuery.of(context).size.width;
    final screenheight=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('my_notifications'.tr,style: TextStyle(fontSize:25,color: Colors.black),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Back arrow icon
          onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (context)=>homePage()));
          },
        ),
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
      notifications.isEmpty
          ? noNotification(context)
          : _notificationList(context, notifications),
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
      // bottom nav...
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

Widget noNotification(BuildContext context) {
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
Widget _notificationList(BuildContext context, List<String> notifications) {
  return ListView.separated(
    padding: const EdgeInsets.only(bottom: 80),
    itemCount: notifications.length,
    separatorBuilder: (_, __) => const Divider(
      thickness: 2,
      color: Color(0xffD9D9D9),
    ),
    itemBuilder: (context, index) {
      return ListTile(
        leading: const Icon(Icons.notifications, color: Color(0xff3D4652), size: 30),
        title: Text(
          notifications[index],
          style: const TextStyle(fontSize: 16),
        ),
      );
    },
  );
}