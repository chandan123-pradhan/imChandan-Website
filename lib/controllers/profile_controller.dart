import 'package:flutter/material.dart';
import 'package:my_website/models/api_response/get_profile_api_response.dart';
import 'package:my_website/utils/app_state.dart';
import 'package:my_website/web_services/url_constant.dart';
import 'package:my_website/web_services/web_services.dart';

class ProfileController extends ChangeNotifier {
  GetProfileApiResponse? getProfileApiResponse;
  AppState currentState = AppState.nothing;
  void getProfile() async {
    try {
      currentState = AppState.loading;
      var response = await WebServices.getRequestAfterAuth(
          routeUrL: UrlConstant.get_profile_route_url);
      if (response.status) {
        currentState = AppState.success;
        getProfileApiResponse = GetProfileApiResponse.fromJson(response.data);
        print(getProfileApiResponse);
      } else {
        currentState = AppState.error;
      }
    } catch (e) {
    } finally {
      notifyListeners();
    }
  }
}
