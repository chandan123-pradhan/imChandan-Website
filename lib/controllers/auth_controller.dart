import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_website/models/api_response/user_registration_api_respnose.dart';
import 'package:my_website/models/login_model.dart';
import 'package:my_website/models/register_model.dart';
import 'package:my_website/utils/message_utils.dart';
import 'package:my_website/utils/shared_pref.dart';
import 'package:my_website/web_services/url_constant.dart';
import 'package:my_website/web_services/web_services.dart';

class AuthController extends ChangeNotifier {
  bool isRequesting = false;
  bool isSignin = false;
  SharedPref _sharedPref = new SharedPref();
  void callForRegister(
      {required RegisterModel registerModel,
      required BuildContext context}) async {
    isRequesting = true;
    notifyListeners();

    Map<String, String> body = {
      'email': registerModel.email,
      'full_name': registerModel.fullName,
      'password': registerModel.password,
    };
    var response = await WebServices.postRequestBeforeAuthWithMultipart(
        body: body,
        routeUrL: UrlConstant.register_route_url,
        file: registerModel.profilePic);
    print(response.message);
    isRequesting = false;
    notifyListeners();
    if (response.status == true) {
      response.data = UserRegistrationApiResponse.fromJson(response.data);
      Navigator.pop(context);
      bool result =
          await _sharedPref.saveAuthToken(authToken: response.data.token);
      ToastMessage.showSuccessDialog(context, response.message);
    } else {
      ToastMessage.showErrorDialog(context, response.message);
    }
  }

  void switchSigninSignUp() {
    isSignin = !isSignin;
    notifyListeners();
  }

  void callForLogin(
      {required LoginModel loginModel,
      required BuildContext context}) async {
    isRequesting = true;
    notifyListeners();

    Map<String, String> body = {
      'email': loginModel.email,
      'password': loginModel.password,
    };
    var response = await WebServices.postRequestBeforeAuth(
        body: body,
        routeUrL: UrlConstant.login_route_url,
       );
    print(response.message);
    isRequesting = false;
    notifyListeners();
    if (response.status == true) {
      response.data = UserRegistrationApiResponse.fromJson(response.data);
      Navigator.pop(context);
      bool result =
          await _sharedPref.saveAuthToken(authToken: response.data.token);
      ToastMessage.showSuccessDialog(context, response.data['message']);
    } else {
      ToastMessage.showErrorDialog(context, response.data['message']);
    }
  }
}
