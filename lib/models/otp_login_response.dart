import 'dart:convert';
import 'package:flutter/material.dart';

OtpLoginResponseModel otpLoginResponseJSON(String str)=>OtpLoginResponseModel.fromJson(json.decode(str));


class OtpLoginResponseModel {
  late final String messsage;
  late final String? data;

  OtpLoginResponseModel({
    required this.messsage,
    required this.data,
  });

  OtpLoginResponseModel.fromJson(Map<String,dynamic>json){
    messsage = json['message'];
    data = json['data'];
  }
}
