import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:reusebook/sell.dart';
import 'package:reusebook/shopkeeper.dart';

import 'home.dart';
import 'orders.dart';

class categoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenwidth=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            width: 290,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30))
            ),
            child:Center(
                child:TextField(
                  decoration: InputDecoration(
                      suffixIcon: (Icon(Icons.search,color: Color(0xff3D4652),size: 20,)),
                      hintText: "Search Your Books Here ",
                      enabledBorder: OutlineInputBorder(
                          borderRadius:BorderRadius.all(Radius.circular(30)) ,
                          borderSide: BorderSide(
                              color: Colors.white
                          )
                      )

                  ),
                )),
          ),
          Container(
            margin: EdgeInsets.only(left: 30),
            child: Icon(Icons.favorite,size: 28,color: Color(0xff3D4652),),
          ),
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
      body:
          Stack(
              children: [
                Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      width: screenwidth,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child:ListView.separated(
                        itemBuilder: (context,Index){
                          return ListTile(
                            leading: Container(
                                margin: EdgeInsets.only(right: 50),
                                height: 100,
                                width: 100,
                                child:Image.asset('assets/images/book.png')),
                            title: Text("Book Name",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                            subtitle: Text("Writer Name",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                          );
                        },
                        separatorBuilder: (context,Index){
                          return Divider(
                            height: 20,
                            thickness: 3,
                            color: Color(0xffD9D9D9),
                          );
                        },
                        itemCount: 15,
                      ),
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
              ])
    );
  }
}