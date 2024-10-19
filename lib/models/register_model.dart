import 'dart:typed_data';

class RegisterModel {
  String fullName;
  String email;
  String password;
  Uint8List profilePic;

  RegisterModel(
      {required this.fullName,
      required this.email,
      required this.password,
      required this.profilePic});
}
