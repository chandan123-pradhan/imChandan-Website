import 'package:flutter/material.dart';
import 'package:my_website/utils/color_constant.dart';
import 'package:my_website/widgets/dashboard_appbar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Column(
        children: [
          DashbaordAppBar(),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width/1,
               decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(0.3), // Starting color (white)
                      ColorConstant.backgroundColor.withOpacity(0.3), // Softer color
                      ColorConstant.backgroundColor.withOpacity(0.4), // Even softer color
                    ],
                    stops: [0.3, 0.5, 1.0], // Adjust stops for a smooth transition
                  ),
                ),
                
            ),
          ),
        ],
      ),
    );
  }
}