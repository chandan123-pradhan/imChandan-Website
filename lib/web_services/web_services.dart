import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:my_website/models/base_response_model.dart';
import 'package:my_website/utils/shared_pref.dart';
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
      return BaseResponseModel(
          data: json.decode(responseData.body),
          message: 'User Registration successfully done.',
          status: true);
    } catch (e) {
      return BaseResponseModel(
          status: false,
          message: 'Something Went Wrong, please try again.',
          data: {});
    }
  }

  static Future<BaseResponseModel> getRequestAfterAuth(
      {required String routeUrL}) async {
    String? authToken = await SharedPref.getAuthToken();
    try {
      Map<String, String> header = {'Authorization': 'Bearer $authToken'};
      Uri uri = Uri.parse(
        UrlConstant.base_url + routeUrL,
      );
      var response = await http.get(uri, headers: header);
      if (response.statusCode != 200) {
        return BaseResponseModel(
            status: false,
            message: 'success',
            data: json.decode(response.body));
      }
      return BaseResponseModel(
          status: true, message: 'success', data: json.decode(response.body));
    } catch (e) {
      return BaseResponseModel(status: false, message: 'success', data: {});
    }
  }

  static Future<BaseResponseModel> postRequestBeforeAuth(
      {required String routeUrL, required Map body}) async {
        print("Url =$routeUrL and =======> body= $body");
    try {
      Uri uri = Uri.parse(
        UrlConstant.base_url + routeUrL,
      );
      var response = await http.post(uri,
      
      body: json.encode(body)
      );
      if (response.statusCode != 200) {
        return BaseResponseModel(
            status: false,
            message: 'success',
            data: json.decode(response.body));
      }
      var res=json.decode(response.body);
      return BaseResponseModel(
          status: true, message: res['message'], data: res);
    } catch (e) {
      return BaseResponseModel(status: false, message: 'success', data: {});
    }
  }
}
