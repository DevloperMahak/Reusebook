import 'package:flutter/material.dart';
import 'package:reusebook/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenwidth=MediaQuery.of(context).size.width;
    return Drawer(
      child: Container(
        color: Colors.white,
        child:ListView(
        children: [
          UserAccountsDrawerHeader(
              accountName: Text("User Name",style: TextStyle(color:Color(0xff3D4652))),
              accountEmail: Text("Useremail@gmail.com",style: TextStyle(color:Color(0xff3D4652))),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Container(
                    height: 100,
                    width: 100,
                    child:Image.asset("assets/images/user-avatar.png")),
                ),
              ),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xffFFB330),
                  Color(0xffFFD77F),
                  Color(0xffFFFCCE),
                ])
            ),
          ),
        Center(
          child: Container(
          width: 290,
            decoration: BoxDecoration(
            color: Color(0xffFFD77F),
            borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Align(
              alignment: Alignment.center,
              child:Text("My Accounts",
                  style: TextStyle(fontSize: 18,
                      fontWeight: FontWeight.w500))))),
          ListTile(
            leading: Icon(Icons.account_balance,color: Color(0xff3D4652),size: 28,),
            title:Text("Bank & UPI Details" ,style: TextStyle(fontSize: 16,
                fontWeight: FontWeight.w400)) ,
          ),
          ListTile(
            leading: Icon(Icons.account_balance_wallet,color: Color(0xff3D4652),size: 28,),
            title:Text("Payment & Refund" ,style: TextStyle(fontSize: 16,
                fontWeight: FontWeight.w400)) ,
          ),
          Center(
              child: Container(
                  width: 290,
                  decoration: BoxDecoration(
                      color: Color(0xffFFD77F),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Align(
                      alignment: Alignment.center,
                      child:Text("My Activity",
                          style: TextStyle(fontSize: 18,
                              fontWeight: FontWeight.w500))))),
          ListTile(
            leading: Icon(Icons.favorite,color: Color(0xff3D4652),size: 28,),
            title:Text("Favourites" ,style: TextStyle(fontSize: 16,
                fontWeight: FontWeight.w400)) ,
          ),
          ListTile(
            leading: Icon(Icons.history,color: Color(0xff3D4652),size: 28,),
            title:Text("Order history" ,style: TextStyle(fontSize: 16,
                fontWeight: FontWeight.w400)) ,
          ),
          ListTile(
            leading: Icon(Icons.thumb_up,color: Color(0xff3D4652),size: 28,),
            title:Text("Reviews" ,style: TextStyle(fontSize: 16,
                fontWeight: FontWeight.w400)) ,
          ),
          Center(
              child: Container(
                  width: 290,
                  decoration: BoxDecoration(
                      color: Color(0xffFFD77F),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Align(
                      alignment: Alignment.center,
                      child:Text("Others",
                          style: TextStyle(fontSize: 18,
                              fontWeight: FontWeight.w500))))),
          ListTile(
            leading: Icon(Icons.info_outlined,color: Color(0xff3D4652),size: 28,),
            title:Text("About us" ,style: TextStyle(fontSize: 16,
                fontWeight: FontWeight.w400)) ,
          ),
          ListTile(
            leading: Icon(Icons.help_outline_rounded,color: Color(0xff3D4652),size: 28,),
            title:Text("Help & Support" ,style: TextStyle(fontSize: 16,
                fontWeight: FontWeight.w400)) ,
          ),
          ListTile(
            leading: Icon(Icons.star,color: Color(0xff3D4652),size: 28,),
            title:Text("Ratings" ,style: TextStyle(fontSize: 16,
                fontWeight: FontWeight.w400)) ,
          ),
          ListTile(
            leading: Icon(Icons.settings,color: Color(0xff3D4652),size: 28,),
            title:Text("Settings" ,style: TextStyle(fontSize: 16,
                fontWeight: FontWeight.w400)) ,
          ),
          ListTile(
            leading: Icon(Icons.language_rounded,color: Color(0xff3D4652),size: 28,),
            title:Text("Language" ,style: TextStyle(fontSize: 16,
                fontWeight: FontWeight.w400)) ,
          ),
          Center(
              child: Container(
                margin: const EdgeInsets.only(top: 20,bottom: 50),
                height: 48,
                width: 200,
                child:ElevatedButton(
                    style:ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(0xffFFB330),
                    ),
                    onPressed: () async{
                      final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                      sharedPreferences.remove('email');
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=>LoginPage(),
                          ));
                    },
                    child: const Text("Log Out")),))
        ],
      ),
      )
    );
  }
}