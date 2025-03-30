import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ShopkeeperProfilePage extends StatefulWidget {
  final Map<String, dynamic> shopkeeper;

  const ShopkeeperProfilePage({super.key, required this.shopkeeper});

  @override
  State<ShopkeeperProfilePage> createState() => _ShopkeeperProfilePageState();
}

class _ShopkeeperProfilePageState extends State<ShopkeeperProfilePage> {
  bool showBooks = false;
  bool loadingBooks = false;
  List<dynamic> books = [];

  Future<void> fetchBooksByShopkeeper(String email) async {
    final response = await http.get(
      Uri.parse("http://your_api_url.com/books/shopkeeper?email=$email"),
    );
    if (response.statusCode == 200) {
      books = jsonDecode(response.body);
    } else {
      books = [];
    }
    setState(() {
      loadingBooks = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final shopkeeper = widget.shopkeeper;
    return Scaffold(
      appBar: AppBar(
        title: Text(shopkeeper['ShopName'] ?? 'Shopkeeper Profile',
            style: TextStyle(fontSize: 22, color: Colors.black)),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xffFFB330), Color(0xffFFD77F), Color(0xffFFFCCE)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Card(
                elevation: 5,
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Color(0xffFFB330),
                          child: Icon(Icons.store, size: 40, color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 20),
                      _infoRow(Icons.storefront, 'Shop Name', shopkeeper['ShopName']),
                      _infoRow(Icons.person, 'Owner Name', shopkeeper['OwnerName']),
                      _infoRow(Icons.location_on, 'Address',
                          "${shopkeeper['ShopAddress']}, ${shopkeeper['ShopCity']}, ${shopkeeper['ShopState']}"),
                      _infoRow(Icons.phone, 'Phone', shopkeeper['PhoneNumber']),
                      _infoRow(Icons.email, 'Email', shopkeeper['Email']),
                      SizedBox(height: 20),
                      ElevatedButton.icon(
                        onPressed: () async {
                          setState(() {
                            loadingBooks = true;
                            showBooks = !showBooks;
                          });
                          if (showBooks) {
                            await fetchBooksByShopkeeper(shopkeeper['Email']);
                          }
                        },
                        icon: Icon(Icons.menu_book),
                        label: Text(showBooks ? 'Hide Books' : 'View Books'),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff3D4652),
                            foregroundColor: Colors.white),
                      ),
                      SizedBox(height: 10),
                      if (loadingBooks)
                        Center(child: CircularProgressIndicator()),
                      if (showBooks && books.isNotEmpty)
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: books.length,
                          itemBuilder: (context, index) {
                            final book = books[index];
                            return Card(
                              margin: EdgeInsets.symmetric(vertical: 8),
                              child: ListTile(
                                leading:
                                Icon(Icons.book, color: Color(0xffFFB330)),
                                title: Text(book['title'] ?? 'Untitled'),
                                subtitle:
                                Text("Price: ₹${book['price'] ?? 'N/A'}"),
                              ),
                            );
                          },
                        ),
                      if (showBooks && books.isEmpty && !loadingBooks)
                        Text("No books listed by this shopkeeper."),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.call),
                            label: Text("Call"),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xffFFB330)),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.email, color: Colors.white),
                            label: Text("Email",
                                style: TextStyle(color: Colors.white)),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff3D4652)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Color(0xff3D4652)),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                SizedBox(height: 4),
                Text(value ?? "Not available",
                    style: TextStyle(fontSize: 16, color: Colors.black87)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
