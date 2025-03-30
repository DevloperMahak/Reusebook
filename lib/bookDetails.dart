import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:reusebook/sell.dart';
import 'package:reusebook/shopkeeper.dart';

import 'categories.dart';
import 'controllers/cart_controller.dart';
import 'home.dart';
import 'myStore.dart';
import 'models/book.dart';
import 'orders.dart';


class bookDetailsPage extends StatefulWidget {

  final Book book;

  const bookDetailsPage({super.key, required this.book});

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
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffFFB330))),

                    ),
                  )),
            ),
            Container(
              margin: EdgeInsets.only(left: 20,right: 15),
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
        body: SingleChildScrollView(
    child: Container(
          color: Colors.white,
    child:Column(
      mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Stack(
    children: [
      Container(
          margin: const EdgeInsets.all(30),
          width: 350,
          height: 300,
          decoration: BoxDecoration(
            boxShadow:  [
              BoxShadow(color: Colors.black.withOpacity(0.2), // Shadow color with opacity
                blurRadius: 3, // Softness of the shadow
                spreadRadius: 1, // How much the shadow expands
                offset: Offset(2, 2),)], // X and Y position of the shadow,
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Image.asset('assets/images/book.png', height: 80, width: 70),
          ),
        ),
      Positioned(
         bottom: 50,
          right: 100,
          child:Icon(Icons.favorite_border_outlined,size: 30,color: Color(0xff3D4652))),
      Positioned(
          bottom: 50,
          right: 50,
          child:Icon(Icons.share,size: 30,color: Color(0xff3D4652)))
    ]),
      // ✅ Your text widgets
      Text(
        widget.book.bookName,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ),
      SizedBox(height: 10),
      Text(
        "Author : By ${widget.book.author}",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      ),
      Text(
        "Publication : By ${widget.book.publication}",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      ),
      Text(
        "MRP ₹${widget.book.sellingPrice}",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
      ),
      Text(
        "Book Condition : ${widget.book.condition}",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
      ),
      Container(
        margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300, width: 1.5),
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 5,
              spreadRadius: 2,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            "🔒 Safe & Secure Payment\n✅ 100% Authentic & Quality Assured Books",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade800,
            ),
          ),
        ),
      ),

      Container(
          margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300, width: 1.5),
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 4,
                spreadRadius: 1,
                offset: Offset(0, 2),
              ),
            ],
          ),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
      children: [
        Icon(Icons.star, color: Colors.amber, size: 24), // Star icon
      SizedBox(width: 8),
    Container(
    margin: const EdgeInsets.only(top:5,right: 5),
    child:Text(
    "Ratings and Reviews",// Display the book price
    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    )
    ),
    ]),
    Container(
    margin: const EdgeInsets.only(top:10,left: 30),
    height: 40,
    width: 140,
    child:OutlinedButton(
    style:  OutlinedButton.styleFrom(
    side: BorderSide(
    color: Color(0xffFFB330),
    width: 1.0
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
    child: const Text("Rate Product")),)
    ])),
      Container(
          margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300, width: 1.5),
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 4,
                  spreadRadius: 1,
                  offset: Offset(0, 2),
                ),
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top:5,left:10),
    child:Text(
            "Have doubts regarding this product?",// Display the book price
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          )
    ),
    Container(
      margin: const EdgeInsets.only(top:10,left: 10),
    height: 40,
    width: 180,
    child:OutlinedButton(
    style:  OutlinedButton.styleFrom(
    side: BorderSide(
    color: Color(0xffFFB330),
    width: 1.0
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
    child: const Text("Ask Your Question")),)
    ])
      )]),
    ),
        ),
        // Bottom Navigation Bar
        bottomNavigationBar: Container(
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
                                      final cartController = Get.find<CartController>();
                                      cartController.addToCart(widget.book);

                                      Get.snackbar(
                                        "Success",
                                        "${widget.book.bookName} added to cart!",
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor: Color(0xffFFD77F),
                                        colorText: Colors.black,
                                      );

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
            );

  }
}
