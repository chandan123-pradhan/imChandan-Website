import 'package:flutter/material.dart';
import 'package:my_website/screens/cource_details_screen.dart';
import 'package:my_website/screens/dashboard.dart';
import 'package:my_website/screens/profile_page.dart';
import 'package:my_website/utils/routings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
  routes: {
    Routings.homeRoute: (context) => Dashboard(),
    Routings.profileRoute: (context) => ProfilePage(),
    Routings.courseDetailsRoute:(context){
       final args = ModalRoute.of(context)!.settings.arguments as String;
    return CourseDetailsScreen(title: args);
  },
      
  },
    
    );
  }
}
