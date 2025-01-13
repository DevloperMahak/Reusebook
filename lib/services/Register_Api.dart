import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Register_Api {

  static const baseUrl = "http://192.168.40.59/api";

  static addUser(Map uData) async {
    print(uData);
    var url = Uri.parse(baseUrl + "add_user");

    try{
      final res = await http.post(url, body: uData);

      if (res.statusCode == 200){
        var data = jsonDecode(res.body.toString());
        print(data);
      }else {
        print("failed to upload data");
      }
    }catch (e) {
      debugPrint(e.toString());

    }
  }
}
