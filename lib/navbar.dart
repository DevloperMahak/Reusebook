import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:reusebook/login.dart';
import 'package:reusebook/splash_screen.dart';
import 'package:reusebook/url.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/image_service.dart'; // adjust path as needed

class Navbar extends StatefulWidget {
  const Navbar({super.key});
  @override
  State<Navbar> createState() => NavbarState();
}

class NavbarState extends State<Navbar> {
  File? _profileImage;
  String? _networkImageUrl;
  final picker1 = ImagePicker();
  final ImageService _imageService = ImageService();



  @override
  void initState() {
    super.initState();
    _loadProfileImage();
  }

  Future<void> _loadProfileImage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedUrl = prefs.getString('profileImageUrl');

    if (savedUrl != null) {
      setState(() {
        _networkImageUrl = savedUrl;
      });
    } else {
      final userId = prefs.getString('userId');
      if (userId != null) {
        final imageUrl = await _imageService.getImageUrl(userId);
        if (imageUrl != null) {
          await prefs.setString('profileImageUrl', imageUrl);
          setState(() {
            _networkImageUrl = imageUrl;
          });
        }
      }
    }
  }


  Future<void> getGalleryImage() async {
    final pickedFile = await picker1.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (pickedFile != null) {
      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getString('userId');
      setState(() {
        _profileImage = File(pickedFile.path); // show preview immediately
      });
      if (userId != null) {
        final uploadedUrl = await _imageService.uploadProfileImage(File(pickedFile.path), userId);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('profileImageUrl', uploadedUrl);
        setState(() {
          _networkImageUrl = uploadedUrl;
          _profileImage = null; // remove temp image after server confirms
        });
      }
    } else {
      print("no image picked");
    }
  }


  Future<void> takeCameraImage() async {
    final pickedFile =
        await picker1.pickImage(source: ImageSource.camera, imageQuality: 80);
      if (pickedFile != null) {
        setState(() {
        _profileImage = File(pickedFile.path); // show temporary image
      });
        final prefs = await SharedPreferences.getInstance();
        final userId = prefs.getString('userId');
        if (userId != null) {
          final uploadedUrl = await _imageService.uploadProfileImage(File(pickedFile.path), userId);
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('profileImageUrl', uploadedUrl);
          setState(() {
            _networkImageUrl = uploadedUrl;
            _profileImage = null; // remove temp image after server confirms
          });
        }
      } else {
        print("no image picked");
      }

  }

  Widget editPhoto() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile Photo",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.brown),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TextButton.icon(
                icon: Icon(Icons.camera, size: 25),
                onPressed: () {
                  takeCameraImage();
                  Navigator.pop(context); // Close bottom sheet
                },
                label: Text(
                  "Camera",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              TextButton.icon(
                icon: Icon(
                  Icons.image,
                  size: 25,
                ),
                onPressed: () {
                  getGalleryImage();
                  Navigator.pop(context); // Close bottom sheet
                },
                label: Text(
                  "Gallery",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 220,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Profile Photo Options",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          TextButton.icon(
            icon: Icon(Icons.camera_alt, size: 25, color: Color(0xff3D4652)),
            onPressed: () {
              takeCameraImage();
              Navigator.pop(context);
            },
            label: Text("Take a new photo",
                style: TextStyle(fontSize: 16, color: Color(0xff3D4652))),
          ),
          TextButton.icon(
            icon: Icon(Icons.photo_library, size: 25, color: Color(0xff3D4652)),
            onPressed: () {
              getGalleryImage();
              Navigator.pop(context);
            },
            label: Text("Choose from gallery",
                style: TextStyle(fontSize: 16, color: Color(0xff3D4652))),
          ),
          TextButton.icon(
            icon: Icon(Icons.delete, size: 25, color: Color(0xff3D4652)),
            onPressed: () async{
              final prefs = await SharedPreferences.getInstance();
              final userId = prefs.getString('userId');
              if (userId != null) {
                bool deleted = await _imageService.deleteProfileImage(userId);
                if (deleted) {
                  await prefs.remove('profileImageUrl');
                  setState(() {
                    _profileImage = null;
                    _networkImageUrl = null;
                  });
                }else {
    print("Failed to delete from server");
                }
              } // Add your remove logic here
              Navigator.pop(context);
            },
            label: Text("Remove profile photo",
                style: TextStyle(fontSize: 16, color: Color(0xff3D4652))),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;

    return Drawer(
        child: Container(
      color: Colors.white,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName:
                Text("User Name", style: TextStyle(color: Color(0xff3D4652))),
            accountEmail:
                Text('$finalEmail', style: TextStyle(color: Color(0xff3D4652))),
            currentAccountPicture: CircleAvatar(
              child: Stack(children: [
                InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: ((builder) => bottomSheet()),
                      );
                    },
                    child: CircleAvatar(
                      radius: 80,
                      //child:_profileImage!=null?Image.file(_profileImage!.absolute): Center(child: Icon(Icons.person_rounded,size: 35,color:Colors.grey ,)),
                      backgroundImage: _profileImage != null
                          ? FileImage(_profileImage!)
                          : (_networkImageUrl != null
                          ? NetworkImage(_networkImageUrl!)
                          : AssetImage("assets/images/woman.png") as ImageProvider),

                      backgroundColor: Colors.white,
                    )),
                Positioned(
                    bottom: 2,
                    right: 3,
                    child: Icon(Icons.camera_alt,
                        size: 20, color: Color(0xff3D4652)))
              ]),
            ),
            otherAccountsPictures: [
              IconButton(
                icon: Icon(Icons.edit, color: Color(0xff3D4652)),
                onPressed: () {
                  // Profile edit
                },
              ),
            ],
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xffFFB330),
              Color(0xffFFD77F),
              Color(0xffFFFCCE),
            ])),
          ),
          Center(
              child: Container(
                  width: 290,
                  decoration: BoxDecoration(
                      color: Color(0xffFFD77F),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text("My Accounts",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500))))),
          ListTile(
            leading: Icon(
              Icons.account_balance,
              color: Color(0xff3D4652),
              size: 28,
            ),
            title: Text("Bank & UPI Details",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
          ),
          ListTile(
            leading: Icon(
              Icons.account_balance_wallet,
              color: Color(0xff3D4652),
              size: 28,
            ),
            title: Text("Payment & Refund",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
          ),
          Center(
              child: Container(
                  width: 290,
                  decoration: BoxDecoration(
                      color: Color(0xffFFD77F),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text("My Activity",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500))))),
          ListTile(
            leading: Icon(
              Icons.favorite,
              color: Color(0xff3D4652),
              size: 28,
            ),
            title: Text("Favourites",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
          ),
          ListTile(
            leading: Icon(
              Icons.history,
              color: Color(0xff3D4652),
              size: 28,
            ),
            title: Text("Order history",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
          ),
          ListTile(
            leading: Icon(
              Icons.thumb_up,
              color: Color(0xff3D4652),
              size: 28,
            ),
            title: Text("Reviews",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
          ),
          Center(
              child: Container(
                  width: 290,
                  decoration: BoxDecoration(
                      color: Color(0xffFFD77F),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text("Others",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500))))),
          ListTile(
            leading: Icon(
              Icons.info_outlined,
              color: Color(0xff3D4652),
              size: 28,
            ),
            title: Text("About us",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
          ),
          ListTile(
            leading: Icon(
              Icons.help_outline_rounded,
              color: Color(0xff3D4652),
              size: 28,
            ),
            title: Text("Help & Support",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
          ),
          ListTile(
            leading: Icon(
              Icons.star,
              color: Color(0xff3D4652),
              size: 28,
            ),
            title: Text("Ratings",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Color(0xff3D4652),
              size: 28,
            ),
            title: Text("Settings",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
          ),
          ListTile(
            leading: Icon(
              Icons.language_rounded,
              color: Color(0xff3D4652),
              size: 28,
            ),
            title: Text("Language",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
          ),
          Center(
              child: Container(
            margin: const EdgeInsets.only(top: 20, bottom: 50),
            height: 40,
            width: 200,
            child: ElevatedButton.icon(
                onPressed: () async {
                  final SharedPreferences sharedPreferences =
                      await SharedPreferences.getInstance();
                  sharedPreferences.remove('email');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xffFFB330),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),
                icon: Icon(
                  Icons.logout,
                  size: 25,
                  color: Colors.white,
                ), // logout icon
                label: const Text("Log Out")),
          ))
        ],
      ),
    ));
  }
}
