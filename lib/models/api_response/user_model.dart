
class UserData {
  UserData({
    required this.email,
    required this.fullName,
    required this.id,
    required this.profilePic,
  });
  late final String email;
  late final String fullName;
  late final int id;
  late final String profilePic;
  
  UserData.fromJson(Map<String, dynamic> json){
    email = json['email'];
    fullName = json['full_name'];
    id = json['id']??0;
    profilePic = json['profile_pic'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['full_name'] = fullName;
    _data['id'] = id;
    _data['profile_pic'] = profilePic;
    return _data;
  }
}