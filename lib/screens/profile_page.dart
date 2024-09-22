import 'package:flutter/material.dart';
import 'package:my_website/utils/color_constant.dart';
import 'package:my_website/utils/globalMethods.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: displayHeight(context)/12,),
              Padding(
                padding:  EdgeInsets.symmetric(
                  horizontal: displayWidth(context)/20
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: displayWidth(context)/3,
                      child: Column(
                        children: [
                          Container(
                            height: displayHeight(context)/3,
                            width: displayHeight(context)/3,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 1,
                              color: ColorConstant.lightRedColor
                              )
                            ),
                          )
                        ],
                      ),
                      
                    ),
                    SizedBox(width: 10,),
                     Expanded(
                       child: Container(
                                      
                                       height: displayHeight(context)/3,
                                       color: Colors.amber,
                                     ),
                     )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}