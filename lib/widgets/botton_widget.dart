import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_website/utils/color_constant.dart';
import 'package:my_website/utils/globalMethods.dart';

class BottonWidgets {
  static Widget getSmallMainBotton({
    required BuildContext context,
    required String title,
    required Function onPressed,
  }) {
    return InkWell(
      onTap: (){
        onPressed();
      },
      child: Container(
        height: displayHeight(context) / 20,
        width: displayWidth(context) / 10,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: ColorConstant.lightRedColor),
        alignment: Alignment.center,
        child: Text(
          title,
          style: GoogleFonts.barlow(
            textStyle: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }


 static Widget tinnySmallMainBotton({
    required BuildContext context,
    required String title,
    required Function onPressed,
    Color?color
  }) {
    return InkWell(
      onTap: (){
        onPressed();
      },
      child: Container(
        height: displayHeight(context) / 25,
        width: displayWidth(context) / 12,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: color??ColorConstant.lightRedColor),
        alignment: Alignment.center,
        child: Text(
          title,
          style: GoogleFonts.barlow(
            textStyle: TextStyle(
                color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  

  static Widget textBotton(
      {required String title,
      required BuildContext context,
      required Function onPressed}) {
    return InkWell(
      onTap: (){
        onPressed();
      },
      child: Container(
          alignment: Alignment.center,
          height: displayHeight(context) / 20,
          child: Text(
            title,
            style: GoogleFonts.barlow(
              textStyle: TextStyle(
                  color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
            ),
          )),
    );
  }

  static Widget textBottonWithIcon(
      {required String title,
      required BuildContext context,
      required Function onPressed,
      required IconData icon}) {
    return Container(
      alignment: Alignment.center,
      height: displayHeight(context) / 20,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: GoogleFonts.barlow(
              textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Icon(
            icon,
            size: 15,
          )
        ],
      ),
    );
  }

  static Widget getMainBotton({
    required BuildContext context,
    required String title,
    required Function onPressed,
  }) {
    return Container(
      height: displayHeight(context) / 12,
      width: displayWidth(context) / 6,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: ColorConstant.lightRedColor),
      alignment: Alignment.center,
      child: Text(
        title,
        style: GoogleFonts.barlow(
          textStyle: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }


   static Widget getContinueBotton({
    required BuildContext context,
    required String title,
    
  }) {
    return  Container(
        height: displayHeight(context) / 15,
        // width: displayWidth(context) / 6,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: ColorConstant.lightRedColor),
        alignment: Alignment.center,
        child: Text(
          title,
          style: GoogleFonts.barlow(
            textStyle: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
      
    );
  }
}
