import 'package:flutter/material.dart';
import 'package:my_website/utils/globalMethods.dart';
import 'package:my_website/utils/image_utils.dart';
import 'package:my_website/widgets/botton_widget.dart';

class DashbaordAppBar extends StatefulWidget {
  const DashbaordAppBar();

  @override
  State<DashbaordAppBar> createState() => _DashbaordAppBarState();
}

class _DashbaordAppBarState extends State<DashbaordAppBar> {
  @override
  Widget build(BuildContext context) {
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
               
                BottonWidgets.getMainBotton(
                    context: context, title: 'New Sigma 4.0', onPressed: () {}),
                SizedBox(
                  width: displayWidth(context) / 30,
                ),
                BottonWidgets.textBotton(
                    context: context, title: 'Home', onPressed: () {}),
                    SizedBox(
                  width: displayWidth(context) / 35,
                ),
                BottonWidgets.textBottonWithIcon(
                    context: context, title: 'New Cources', onPressed: () {},
                    icon: Icons.keyboard_arrow_down,


                    ),
                      SizedBox(
                  width: displayWidth(context) / 35,
                ),
                BottonWidgets.textBotton(
                    context: context, title: 'My Batch', onPressed: () {},
                  
                    ),
                        SizedBox(
                  width: displayWidth(context) / 35,
                ),
                BottonWidgets.textBotton(
                    context: context, title: 'Sign out', onPressed: () {},
                  
                    ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
