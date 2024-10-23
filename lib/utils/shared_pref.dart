import 'package:my_website/utils/global_variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const String AuthTokenKey = 'auth_token';
  Future<bool> saveAuthToken({required String authToken}) async {
    try {
      SharedPreferences _sharePrefrences =
          await SharedPreferences.getInstance();
      _sharePrefrences.setString(AuthTokenKey, authToken);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<String?> getAuthToken() async {
    try {
      SharedPreferences _sharePrefrences =
          await SharedPreferences.getInstance();
      var autkey = _sharePrefrences.getString(AuthTokenKey);
      if (autkey != null) {
        isLoggedIn = true;
      } else {
        isLoggedIn = false;
      }
      return autkey;
    } catch (e) {
      isLoggedIn = false;
    }
  }
}
