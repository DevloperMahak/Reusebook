import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:reusebook/sell.dart';
import 'package:reusebook/shopkeeper.dart';

import 'categories.dart';
import 'controllers/favorites_controller.dart';
import 'home.dart';
import 'orders.dart';

class favouritePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final screenwidth=MediaQuery.of(context).size.width;
    final FavoritesController favoritesController = Get.put(FavoritesController());

    return Scaffold(
      appBar: AppBar(
        title: Text('favourites'.tr,style: TextStyle(fontSize:25,color: Colors.black),),
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
            Center(
                child: Obx(() {
                  if (favoritesController.favoriteBooks.isEmpty) {
                    return Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 180, left: 20, right: 20),
                        child: Column(
                          children: [
                            Text("Your favourited products (0 item)",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500)),
                            Container(
                              margin: EdgeInsets.only(bottom: 20, top: 20),
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color(0xffFFD77F),
                              ),
                              child: Icon(Icons.favorite_sharp,
                                  size: 50, color: Color(0xff3D4652)),
                            ),
                            const Text("Wishlist is empty!",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600)),
                            Text(
                                "Save products you like in wishlist. You can review and easily add them to cart anytime later.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      padding: EdgeInsets.only(top: 20, bottom: 90),
                      itemCount: favoritesController.favoriteBooks.length,
                      itemBuilder: (context, index) {
                        final book = favoritesController.favoriteBooks[index];
                        return ListTile(
                          leading: Icon(Icons.book, size: 40, color: Color(0xff3D4652)),
                          //leading: Image.network(book.imageUrl, width: 50, height: 70), // adjust accordingly
                          title: Text(book.bookName),
                          subtitle: Text(book.author),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Color(0xff3D4652)),
                            onPressed: () {
                              favoritesController.removeFromFavorites(book);
                              Get.snackbar("Removed", "${book.bookName} removed from favorites");
                            },
                          ),
                        );
                      },
                    );
                  }
                }),
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
