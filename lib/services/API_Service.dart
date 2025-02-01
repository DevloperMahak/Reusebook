import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:reusebook/models/otp_login_response.dart';
import '../url.dart';

class APIService{
  static var client = http.Client ();

  static Future<OtpLoginResponseModel>otpLogin(String EmailText) async{
    Map<String,String> requestHeaders = {'Content-Type': 'application/json'};

    var url = Uri.http((sendOTP));

    var response = await client.post(url,
      headers: requestHeaders,
      body: jsonEncode({"EmailText": EmailText}),
    );
    return otpLoginResponseJSON(response.body);
  }

  static Future<OtpLoginResponseModel>verifyotp(String EmailText,String otpHash,String otpCode) async{
    Map<String,String> requestHeaders = {'Content-Type': 'application/json'};

    var url = Uri.http((verifyOTP));

    var response = await client.post(url,
      headers: requestHeaders,
      body: jsonEncode({"EmailText": EmailText, "otp": otpCode, "hash":otpHash}),
    );
    return otpLoginResponseJSON(response.body);
  }
}