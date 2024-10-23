import 'package:flutter/material.dart';
import 'package:my_website/utils/shared_pref.dart';
import 'package:provider/provider.dart';

class HomeController extends ChangeNotifier{
  

  void initialize()async{
    await SharedPref.getAuthToken();
    notifyListeners();
  }

}