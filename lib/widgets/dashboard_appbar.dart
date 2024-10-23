import 'package:flutter/material.dart';
import 'package:my_website/controllers/home_controller.dart';
import 'package:my_website/screens/sign_in_screen.dart';
import 'package:my_website/utils/globalMethods.dart';
import 'package:my_website/utils/global_variables.dart';
import 'package:my_website/utils/image_utils.dart';
import 'package:my_website/utils/message_utils.dart';
import 'package:my_website/utils/routings.dart';
import 'package:my_website/widgets/botton_widget.dart';
import 'package:provider/provider.dart';

class DashbaordAppBar extends StatefulWidget {
  const DashbaordAppBar();

  @override
  State<DashbaordAppBar> createState() => _DashbaordAppBarState();
}

class _DashbaordAppBarState extends State<DashbaordAppBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
              builder: (context, homeController, child) {
        return Container(
          height: displayHeight(context) / 10,
          width: displayWidth(context) / 1,
          decoration: const BoxDecoration(color: Colors.white),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: displayWidth(context) / 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  ImageUtils.logo_img,
                  width: displayWidth(context) / 8,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BottonWidgets.getSmallMainBotton(
                        context: context, title: 'Home', onPressed: () {}),
                    SizedBox(
                      width: displayWidth(context) / 30,
                    ),
                    BottonWidgets.textBottonWithIcon(
                      context: context,
                      title: 'New Cources',
                      onPressed: () {},
                      icon: Icons.keyboard_arrow_down,
                    ),
                    SizedBox(
                      width: displayWidth(context) / 35,
                    ),
                    BottonWidgets.textBotton(
                      context: context,
                      title: 'My Batch',
                      onPressed: () {},
                    ),
                    SizedBox(
                      width: displayWidth(context) / 35,
                    ),
                    isLoggedIn
                        ? BottonWidgets.textBotton(
                            context: context,
                            title: 'Profile',
                            onPressed: () {
                              Navigator.pushNamed(context, Routings.profileRoute);
                            },
                          )
                        :
                         BottonWidgets.textBotton(
                            context: context,
                            title: 'Sign In',
                            onPressed: () {
                             
                              showSignupDialog(context);
                            },
                          ),
                  ],
                )
              ],
            ),
          ),
        );
      }
    );
  }

  void showSignupDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration:
          const Duration(milliseconds: 300), // Animation duration
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return const SignupDialog(); // The dialog content
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation, // Fade animation
          child: child,
        );
      },
    ).then((val) {
      setState(() {
        isLoggedIn = true;
      });
    });
  }
}
