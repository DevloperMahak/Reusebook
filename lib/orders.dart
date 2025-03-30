import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:reusebook/sell.dart';
import 'package:reusebook/shopkeeper.dart';
import 'package:reusebook/models/order_model.dart';
import 'categories.dart';
import 'home.dart';

class orderPage extends StatefulWidget {
  const orderPage({super.key});
  @override
  State<orderPage>createState()=>orderPageState();
}

class orderPageState extends State<orderPage> {
  final List<Order> orders = [
    Order(title: "Order #1234",
        bookName: "Flutter for Beginners",
        status: "Shipped"),
    Order(title: "Order #1235", bookName: "Advanced Dart", status: "Delivered"),
    Order(title: "Order #1236", bookName: "Clean Code", status: "Processing"),
  ];

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'my_orders'.tr, style: TextStyle(fontSize: 25, color: Colors.black),),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            // Back arrow icon
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => homePage()));
            },
          ),
          flexibleSpace: Container(
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
              orders.isEmpty
                  ? noOrderList(context)
                  : buildOrderList(),
              // bottom nav...
              Positioned(
                  bottom: 0,
                  child: Container(
                      height: 75,
                      width: screenwidth,
                      color: Colors.white,
                      child: Center(
                          child: Container(
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
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        categoriesPage()));
                                          },
                                          child: Container(
                                            height: 32,
                                            width: 32,
                                            child: Image.asset(
                                              "assets/images/categories.png",),),),
                                        Text('categories'.tr,
                                            style: TextStyle(
                                                fontSize: 12, color: Color(
                                                0xff3D4652)))
                                      ]),),
                                Container(
                                  padding: EdgeInsets.only(top: 8),
                                  child: Column(
                                      children: [InkWell(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        orderPage()));
                                          },
                                          child: Container(
                                            height: 32,
                                            width: 32,
                                            child: Image.asset(
                                              "assets/images/package.png",),)),
                                        Text('orders'.tr,
                                            style: TextStyle(
                                                fontSize: 12, color: Color(
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
                                                child: Icon(
                                                    Icons.home, size: 32,
                                                    color: Color(0xff3D4652)))),
                                        Text('home'.tr,
                                            style: TextStyle(
                                                fontSize: 12, color: Color(
                                                0xff3D4652)))
                                      ]),),
                                Container(
                                  padding: EdgeInsets.only(top: 8),
                                  child: Column(
                                      children: [InkWell(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        shopkeeperPage()));
                                          },
                                          child: Container(
                                            height: 32,
                                            width: 32,
                                            child: Image.asset(
                                              "assets/images/merchant.png",),)),
                                        Text('shopkeepers'.tr,
                                            style: TextStyle(
                                                fontSize: 12, color: Color(
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
                                            style: TextStyle(
                                                fontSize: 12, color: Color(
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


  Widget buildOrderList() {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Text("Here your orders will be listed...",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 3,
                child: ListTile(
                  leading: const Icon(Icons.book, color: Color(0xff3D4652)),
                  title: Text(order.title,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(
                      "Book Name: ${order.bookName}\nStatus: ${order.status}"),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget noOrderList(BuildContext context) {
    final screenwidth = MediaQuery
        .of(context)
        .size
        .width;
    return Stack(
      children: [
        // Your existing "No Orders Found" UI
        Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: Color(0xff3D4652)),
                color: Colors.white
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 280,
                  height: 40,
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30))
                  ),
                  child: Center(
                      child: TextField(
                        decoration: InputDecoration(
                          suffixIcon: (Icon(
                            Icons.search, color: Color(0xff3D4652), size: 20,)),
                          hintText: "Search Your Books Here ",
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(30)),
                              borderSide: BorderSide(
                                  color: Color(0xff3D4652)
                              )
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(30)),
                              borderSide: BorderSide(color: Color(0xffFFB330))),

                        ),
                      )),
                ),
                // Filter
                Container(
                  height: 40,
                  width: 80,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.filter_alt_outlined, size: 30,),
                        Center(
                            child: Text("filter ", style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400))),
                      ]),
                ),
              ],
            )
        ),
        // "No Orders" Content
        Center(
            child: Container(
              margin: EdgeInsets.only(top: 180),
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(bottom: 20),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xffFFD77F),
                      ),
                      child: Icon(Icons.card_giftcard_outlined, size: 50,
                          color: Color(0xff3D4652))),
                  const Text("Orders not found!", style: TextStyle(fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),),
                  Container(
                      margin: EdgeInsets.only(top: 30, bottom: 30),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Color(0xffFFB330),
                          ),
                          onPressed: () {
                            print("Continue Purchasing");
                          },
                          child: const Text("Place Order"))),
                  Text("Have an account", style: TextStyle(fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),),
                  Text("Log in to check out faster", style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),),
                ],
              ),
            )
        ),
      ],
    );
  }
}



