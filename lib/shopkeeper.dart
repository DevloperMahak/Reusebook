import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:reusebook/sell.dart';
import 'package:reusebook/shopkeeper_profile.dart';
import 'package:reusebook/url.dart';

import 'categories.dart';
import 'home.dart';
import 'orders.dart';

class shopkeeperPage extends StatefulWidget {
  const shopkeeperPage({super.key});
  @override
  State<shopkeeperPage>createState()=>shopkeeperPageState();
}

class shopkeeperPageState extends State<shopkeeperPage> {
  List<dynamic> shopkeepers = [];
  bool isLoading = true;


  @override
  void initState() {
    super.initState();
    fetchShopkeepers();
  }

  fetchShopkeepers() async {
    final response = await http.get(Uri.parse(allShopkeepers)); // Update with your endpoint
    print("Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");

    if (response.statusCode == 200) {
      setState(() {
        shopkeepers = jsonDecode(response.body);
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      print("Error loading shopkeepers");
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('_shopkeepers'.tr,style: TextStyle(fontSize:25,color: Colors.black),),
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
      body: SafeArea(
    child: Stack(
        children: [
          Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search, color: Colors.grey),
                          hintText: "Search Shops By Name...",
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(color: Color(0xff3D4652)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(color: Color(0xffFFB330)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.filter_alt_outlined, color: Colors.black),
                      label: Text("Filter", style: TextStyle(color: Colors.black)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffFFD77F),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    )
                  ],
                ),
            ),

            // ListView for Shopkeepers
           /* Container(
              margin: EdgeInsets.only(top:60),
              child: ListView.builder(
                itemCount: 10, // Example shopkeeper count
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Color(0xffFFB330),
                      child: Icon(Icons.store, color: Colors.white),
                    ),
                    title: Text("Shopkeeper ${index + 1}"),
                    subtitle: const Text("Shop Description"),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Add Navigation or Action
                    },
                  );
                },
              ),
            ),*/
            Expanded(
            child: isLoading
            ? Center(child: CircularProgressIndicator())
        : shopkeepers.isEmpty
    ? Center(child: Text("No shopkeepers found"))
        : ListView.builder(
    itemCount: shopkeepers.length,
    itemBuilder: (context, index) {
    var shop = shopkeepers[index];
    return Card(
    margin: EdgeInsets.symmetric(
    horizontal: 16, vertical: 8),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
    ),
    elevation: 3,
    child: ListTile(
    leading: CircleAvatar(
    backgroundColor: Color(0xffFFB330),
    child: Icon(Icons.store, color: Colors.white),
    ),
    title: Text(shop['ShopName'] ?? 'No Name',
    style: TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16)),
    subtitle: Text(
    "${shop['ShopAddress'] ?? ''}, ${shop['ShopCity'] ?? ''}, ${shop['ShopState'] ?? ''}",
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
    ),
    trailing: Icon(Icons.arrow_forward_ios, size: 16),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ShopkeeperProfilePage(shopkeeper: shop),
        ),
      );
    // Navigate to shop details or actions
    },
    ),
    );
    },
    ),
            ),
          ],
          ),
            Align(
                alignment: Alignment.bottomCenter,
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
          ]),
    )
    );
  }
}