import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ImageService {
  final String baseUrl = 'http://192.168.126.59:5000'; // e.g. http://192.168.1.10:5000

  Future<String> uploadProfileImage(File image, String userId) async {
    try {
      var uri = Uri.parse('$baseUrl/upload-profile-image');
      var request = http.MultipartRequest('POST', uri);

      // 👇 Must match your backend field name
      request.files.add(await http.MultipartFile.fromPath(
        'profileImage',
        image.path,
      ));

      request.fields['userId'] = userId;

      var response = await request.send();

      final resStr = await response.stream.bytesToString();
      print('📦 Raw server response: $resStr');

      // Safely parse the JSON response
      final resJson = jsonDecode(resStr);

      final success = resJson['success'] ?? false;

      if (response.statusCode == 200 && success) {
        final String imageUrl = '$baseUrl${resJson['imageUrl']}';

        // Save image URL to SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('profileImageUrl', imageUrl);

        print("✅ Uploaded successfully. Image URL: $imageUrl");
        return imageUrl;
      } else {
        print("❌ Upload failed: ${resJson['error'] ?? 'Unknown error'}");
        throw Exception('Failed to upload image');
      }
    } catch (e) {
      print("🚨 Exception during upload: $e");
      throw Exception('Upload error: $e');
    }
  }


  Future<String?> getImageUrl(String userId) async {
    var uri = Uri.parse('$baseUrl/image/$userId'); //✅ Using :userId here
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      return body['imageUrl']; // ✅ Make sure this matches what backend sends
    }
    return null;
  }
  
  Future<bool> deleteProfileImage(String userId) async {
    try {
      final url = Uri.parse('$baseUrl/profile-image/$userId');
      final response = await http.delete(url);

      if (response.statusCode == 200) {
        // Remove cached image URL from local storage
        final prefs = await SharedPreferences.getInstance();
        await prefs.remove('profileImageUrl');
        print('✅ Profile image deleted');
        return true;
      } else {
        print('❌ Failed to delete image: ${response.statusCode} ${response.body}');
        return false;
      }
    } catch (e) {
      print('❌ Exception while deleting image: $e');
      return false;
    }
  }
}





