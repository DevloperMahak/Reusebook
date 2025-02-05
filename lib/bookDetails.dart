import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:reusebook/sell.dart';
import 'package:reusebook/shopkeeper.dart';

import 'categories.dart';
import 'home.dart';
import 'myStore.dart';
import 'orders.dart';

class bookDetailsPage extends StatefulWidget {

  const bookDetailsPage({super.key});
  @override
  State<bookDetailsPage>createState()=>bookDetailsPageState();
}

class bookDetailsPageState extends State<bookDetailsPage> {

  @override
  Widget build(BuildContext context) {
    final screenwidth=MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          actions: [
            Container(
              margin: EdgeInsets.only(left: 20,right: 15),
              child: Icon(Icons.share,size: 28,color: Color(0xff3D4652),),
            ),
            Container(
              margin: EdgeInsets.only(left: 20,right: 15),
              child: Icon(Icons.favorite_border,size: 28,color: Color(0xff3D4652),),
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
        body:Stack(
          children: [
            // Bottom Navigation Bar
            Positioned(
                bottom: 0,
                child: Container(
                    height: 80,
                    width: screenwidth,
                    color: Colors.white,
                    child:Center(
                        child:Container(
                          width: 395,
                          height:70,
                          decoration: BoxDecoration(
                            border:Border.all(
                                color: Color(0xffFFB330)
                            ) ,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30)),
                            color:Colors.white
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Center(
                          child: Container(
                                height: 40,
                                width: 180,
                                child:OutlinedButton.icon(
                                    style:  OutlinedButton.styleFrom(
                                        side: BorderSide(
                                            color: Color(0xffFFB330),
                                            width: 1.5
                                        ),
                                        foregroundColor:  Color(0xffFFB330),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5)
                                        )
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context)=>storePage(),
                                          ));
                                    },
                                    icon: Icon(Icons.shopping_cart,size: 25,color: Color(0xffFFB330),),
                                    label: const Text("Add to Cart")),)),
                              Center(
                                child: Container(
                                  height: 40,
                                  width: 180,
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      // Implement Add to Cart functionality here
                                    },
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: Color(0xffFFB330),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    icon: Icon(Icons.double_arrow,size: 25,color: Colors.white,), // Cart icon
                                    label: Text(
                                      "Buy Now",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        )
                    )
                )
            )
          ],
        )
    );
  }
}