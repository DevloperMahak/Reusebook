import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reusebook/sell.dart';
import 'package:reusebook/shopkeeper.dart';
import 'package:reusebook/uihelper.dart';
import 'package:http/http.dart' as http;
import 'package:reusebook/url.dart';
import 'home.dart';
import 'orders.dart';

class Book {
  String? bookName;
  String? bookDescription;
  String? publication;
  String? author;
  String? printPrice;
  String? sellingPrice;

  Book({
    required this.bookName,
    required this.bookDescription,
    required this.publication,
    required this.author,
    required this.printPrice,
    required this.sellingPrice,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      bookName: json['BookName']?? 'Unknown', // Default value if null
      bookDescription: json['BookDescription']?? 'No description available', // Default value if null
      publication: json['Publication']?? 'Unknown', // Default value if null
      author: json['Author']?? 'Unknown', // Default value if null
      printPrice: json['PrintPrice']?? '0.00', // Default value if null
      sellingPrice: json['SellingPrice']?? '0.00', // Default value if null
    );
  }
}

class categoriesPage extends StatefulWidget {
  const categoriesPage({super.key});
  @override
  State<categoriesPage>createState()=>categoriesPageState();
}

class categoriesPageState extends State<categoriesPage> {

  late Future<List<Book>> books;

// GET request to fetch all books
    Future<List<Book>> fetchBooks() async {
      final response = await http.get(Uri.parse(getbookdetails));

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body)['books'];
        return jsonResponse.map((data) => Book.fromJson(data)).toList();
      } else {
        print("Failed to load books");
        throw Exception('Failed to load books');
      }
    }


  @override
  void initState() {
    super.initState();
    books = fetchBooks();  // Fetch books when the screen is initialized
  }


  @override
  Widget build(BuildContext context) {
    final screenwidth=MediaQuery.of(context).size.width;
    final screenheight=MediaQuery.of(context).size.height;



    const bookname = ["Maths","Physics","Chemistry","Biology","Computer","History","Geography","DSA","CBNST"];
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
      body:  Stack(
              children: [
                // Horizontal filter bar
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child:Container(
                    width: 780,
                    height:60,
                    color: Color(0xffF2F0F0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 40,
                          width: 100,
                          child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Center(
                                    child:Text("Sort ",style: TextStyle(fontSize:18,fontWeight: FontWeight.w400))),
                                Icon(Icons.sort_outlined,size: 30,)
                              ]),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),),
                              border:Border.all(
                                  color: Color(0xff3D4652)),
                              color: Colors.white
                          ),),
                        Container(
                          height: 40,
                          width: 100,
                          child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [Center(
                                  child:Text("filter ",style: TextStyle(fontSize:18,fontWeight: FontWeight.w400))),
                                Icon(Icons.filter_alt_outlined,size: 30,)
                              ]),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),),
                              border:Border.all(
                                  color: Color(0xff3D4652)),
                              color: Colors.white
                          ),),
                        Container(
                          height: 40,
                          width: 100,
                          child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [Center(
                                  child:Text("Type",style: TextStyle(fontSize:18,fontWeight: FontWeight.w400))),
                                Icon(Icons.keyboard_arrow_down_outlined,size: 30,)
                              ]),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),),
                              border:Border.all(
                                  color: Color(0xff3D4652)),
                              color: Colors.white
                          ),),
                        Container(
                          height: 40,
                          width: 130,
                          child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [Center(
                                  child:Text("Category",style: TextStyle(fontSize:18,fontWeight: FontWeight.w400))),
                                Icon(Icons.keyboard_arrow_down_outlined,size: 30,)
                              ]),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),),
                              border:Border.all(
                                  color: Color(0xff3D4652)),
                              color: Colors.white
                          ),),
                        Container(
                          height: 40,
                          width: 120,
                          child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [Center(
                                  child:Text("Charges",style: TextStyle(fontSize:18,fontWeight: FontWeight.w400))),
                                Icon(Icons.keyboard_arrow_down_outlined,size: 30,)
                              ]),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),),
                              border:Border.all(
                                  color: Color(0xff3D4652)),
                              color: Colors.white
                          ),),
                        Container(
                          height: 40,
                          width: 190,
                          child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [Center(
                                  child:Text("Customer Ratings",style: TextStyle(fontSize:18,fontWeight: FontWeight.w400))),
                                Icon(Icons.keyboard_arrow_down_outlined,size: 30,)
                              ]),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),),
                              border:Border.all(
                                  color: Color(0xff3D4652)),
                              color: Colors.white
                          ),)
                      ],
                    ),
                  ),

                ),
                // Grid of books
                FutureBuilder<List<Book>>(
                  future: books,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No books available'));
                    } else {
                      return GridView.builder(
                        padding: const EdgeInsets.only(top: 70, left: 10, right: 10),
                        itemCount: snapshot.data!.length,
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          mainAxisExtent: 300,
                          childAspectRatio: 0.75,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          final book = snapshot.data![index];
                          return BookCard(book: book);
                        },
                      );
                    }
                  },
                ),

              /*Center(
            child:Container(
                margin: EdgeInsets.only(top:70,right: 10,left:10 ),
                    child: Container(
                      width: screenwidth,
                      child:GridView.builder(itemBuilder: (context,index){
       return Container(
        //height:400 ,
        width: 180,
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(top:10),
                height: 80,
                width: 70,
                child:Image.asset('assets/images/book.png')),
            Container(
                margin: const EdgeInsets.only(top:10),
              child:Text(bookname[index],style: TextStyle(fontSize:20,fontWeight: FontWeight.w500),)),
           Container(
                margin: const EdgeInsets.only(bottom:8),
                child:Text("By Author name ",style: TextStyle(fontSize:18,fontWeight: FontWeight.w400),)),
                        Center(
                        child:Container(
                        margin: const EdgeInsets.only(top:5,),
                        height: 40,
                        width: 170,
                        child: ElevatedButton(onPressed: (){},
                        style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Color(0xffFFB330),
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                        )
                        ),
                        child: Text("Add to Cart",style: TextStyle(fontSize: 16),)),
                        )
                        ),
            Container(
              alignment: Alignment.bottomRight,
                margin: const EdgeInsets.only(top:10,right: 10),
                child:Text("View more > ",style: TextStyle(fontSize:14,fontWeight: FontWeight.w400),)),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border:Border.all(
              color: Color(0xffFFB330)
          ) ,
        ),
      );},itemCount: bookname.length,gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200,  // You can adjust this value based on screen size
                          childAspectRatio: 0.75,    // Adjust aspect ratio for better layout
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                        ),

                    )
                        )),*/
                // Bottom Navigation Bar
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
                                              Navigator.pushReplacement(context,
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

class BookCard extends StatelessWidget {
  final Book book;

  BookCard({required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            height: 80,
            width: 70,
            child: Image.asset('assets/images/book.png'), // Add the book image here
          ),
          Center(
            child:Container(
            margin: const EdgeInsets.only(top: 10),
            child: Text(
              "${book.bookName}", // Display the book name
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          )),
          Center(
          child: Container(
            margin: const EdgeInsets.only(bottom: 8),
            child: Text(
              "By ${book.author}", // Display author
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
          )),
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 5),
              height: 40,
              width: 170,
              child: ElevatedButton(
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
                child: Text(
                  "Add to Cart",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            margin: const EdgeInsets.only(top: 10, right: 10),
            child: Text(
              "View more > ",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
        border: Border.all(color: Color(0xffFFB330)),
      ),
    );
  }
}

