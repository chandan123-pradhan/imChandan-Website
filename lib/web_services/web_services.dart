import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:my_website/models/base_response_model.dart';
import 'package:my_website/web_services/url_constant.dart';

class WebServices {
  static Future<BaseResponseModel> postRequestBeforeAuthWithMultipart({
    required Map<String, String> body,
    required String routeUrL,
    required Uint8List file,
  }) async {
    try {
      Uri uri = Uri.parse(UrlConstant.base_url + routeUrL);

      // Read the file as bytes

      // Create a multipart request
      var request = http.MultipartRequest('POST', uri);

      // Add the fields from the body map
      body.forEach((key, value) {
        request.fields[key] = value;
      });

      // Add the file to the request using bytes
      var multipartFile = http.MultipartFile.fromBytes(
          'profile_pic', // The name of the file field expected by your server
          file, // The file content in bytes,
          filename: 'dsfsdfsd.png');

      request.files.add(multipartFile);

      // Send the request and get the response
      var response = await request.send();

      // Parse the response
      var responseData = await http.Response.fromStream(response);
      return BaseResponseModel.fromJson(json.decode(responseData.body));
    } catch (e) {
      return BaseResponseModel(
          status: false,
          message: 'Something Went Wrong, please try again.',
          data: {});
    }
  }
}
