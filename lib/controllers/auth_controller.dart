import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_website/models/register_model.dart';
import 'package:my_website/utils/message_utils.dart';
import 'package:my_website/web_services/url_constant.dart';
import 'package:my_website/web_services/web_services.dart';

class AuthController extends ChangeNotifier {
  bool isRequesting = false;
  bool isSignin = false;
  void callForRegister({required RegisterModel registerModel, required BuildContext context}) async {
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
    if(response.status==false){
      ToastMessage.showErrorDialog(context,response.message);
    }else{
      ToastMessage.showErrorDialog(context,response.message);
    }
  }

  void switchSigninSignUp() {
    isSignin = !isSignin;
    notifyListeners();
  }
}
