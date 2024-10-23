import 'package:my_website/models/api_response/user_model.dart';

class UserRegistrationApiResponse {
  UserRegistrationApiResponse({
    required this.status,
    required this.message,
    required this.data,
    required this.token,
  });
  late final bool status;
  late final String message;
  late final UserData data;
  late final String token;
  
  UserRegistrationApiResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = UserData.fromJson(json['data']);
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.toJson();
    _data['token'] = token;
    return _data;
  }
}
