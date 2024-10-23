import 'package:flutter/material.dart';
import 'package:my_website/controllers/auth_controller.dart';
import 'package:my_website/controllers/home_controller.dart';
import 'package:my_website/controllers/profile_controller.dart';
import 'package:my_website/controllers/write_blogs_controller.dart';
import 'package:my_website/screens/cource_details_screen.dart';
import 'package:my_website/screens/dashboard.dart';
import 'package:my_website/screens/profile_page.dart';
import 'package:my_website/screens/write_blog_screen.dart';
import 'package:my_website/utils/routings.dart';
import 'package:provider/provider.dart';

void main() {
  final writeBlogController = WriteBlogsController();
  final authController=AuthController();
  final homeController=HomeController();
  final profileController=ProfileController();
  runApp(
    MultiProvider(
      providers: [
         ChangeNotifierProvider(create: (_)=>writeBlogController),
         ChangeNotifierProvider(create: (_)=>authController),
         ChangeNotifierProvider(create: (_)=>homeController),
         ChangeNotifierProvider(create: (_)=>profileController),


      ],
      child: MyApp(),
    ),
  );
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
        Routings.courseDetailsRoute: (context) => CourseDetailsScreen(),
        Routings.writeBlogRoute: (context) => WriteBlogScreen()
      },
    );
  }
}
