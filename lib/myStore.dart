import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:reusebook/sell.dart';
import 'package:reusebook/shopkeeper.dart';
import 'package:get/get.dart';
import 'controllers/cart_controller.dart';
import 'models/book.dart';
import 'categories.dart';
import 'home.dart';
import 'orders.dart';

class storePage extends StatelessWidget {
  // Dummy orders list - replace with your real data source
  //final List<String> orders = ["Order #123", "Order #456"]; // Example: ["Order #123", "Order #456"]
  final CartController cartController = Get.find<CartController>();

  storePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('my_store'.tr,style: TextStyle(fontSize:25,color: Colors.black),),
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
            Obx(() {
              return cartController.cartItems.isEmpty
                  ? _buildEmptyBasket(context)
                  : _buildCartList(context, cartController.cartItems,cartController);
            }),
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

Widget _buildCartList(
    BuildContext context,
    List<Book> cartItems,
    CartController cartController,
    ) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 90),
    child: ListView.separated(
      itemCount: cartItems.length,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final book = cartItems[index];

        return Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.book, size: 40, color: Color(0xff3D4652)),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        book.bookName,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        book.author,
                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              // Handle buy now logic here
                              print('Buy Now: ${book.bookName}');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffFFB330),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            ),
                            icon: const Icon(Icons.shopping_cart_checkout),
                            label: const Text("Buy Now"),
                          ),
                          const SizedBox(width: 12),
                          IconButton(
                            onPressed: () {
                              cartController.removeFromCart(book);
                            },
                            icon: const Icon(Icons.delete, color: Color(0xff3D4652)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}


Widget _buildEmptyBasket(BuildContext context) {
  return Center(
    child: Container(
      margin: const EdgeInsets.only(top: 180),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: const Color(0xffFFD77F),
            ),
            child: const Icon(Icons.add_shopping_cart, size: 50, color: Color(0xff3D4652)),
          ),
          const Text("Your basket is empty!",
              style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.w600)),
          Container(
            margin: const EdgeInsets.only(top: 30, bottom: 30),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color(0xffFFB330),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => categoriesPage()));
              },
              child: const Text("Continue Purchasing"),
            ),
          ),
          const Text("Have an account", style: TextStyle(fontSize: 18)),
          const Text("Log in to check out faster", style: TextStyle(fontSize: 18)),
        ],
      ),
    ),
  );
}
