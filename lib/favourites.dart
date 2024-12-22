import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class favouritePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourites",style: TextStyle(fontSize:28,color: Colors.black),),
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
    );
  }
}