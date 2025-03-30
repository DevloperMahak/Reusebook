import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:reusebook/url.dart';

class ImageService {
  Future<void> uploadProfileImage(File imageFile, String userId) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(profileImage),
    );

    request.fields['userId'] = userId;
    request.files.add(await http.MultipartFile.fromPath(
      'image',
      imageFile.path,
    ));

    var res = await request.send();
    if (res.statusCode == 200) {
      print('Image uploaded successfully');
    } else {
      print('Upload failed with status: ${res.statusCode}');
    }
  }
  Future<String?> getImageUrl(String userId) async {
    final response = await http.get(
      Uri.parse('$getImage/$userId'), // Use userId in URL
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['image']['imageUrl']; // Update based on your backend response
    } else {
      print('Failed to get image: ${response.statusCode}');
      return null;
    }
  }

  Future<bool> deleteImage(String userId) async {
    final response = await http.delete(
      Uri.parse('$deleteprofileImage/$userId'), // Use userId in URL
    );

    if (response.statusCode == 200) {
      print('Image deleted successfully');
      return true;
    } else {
      print('Failed to delete image: ${response.statusCode}');
      return false;
    }
  }
}

