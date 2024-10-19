import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_website/utils/color_constant.dart';
import 'package:my_website/widgets/botton_widget.dart';

class ToastMessage {
  static void showErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // Rounded corners
          ),
          backgroundColor: Colors.white, // Background color
          elevation: 5, // Shadow effect
          titlePadding: EdgeInsets.only(left: 20,top: 10),
          contentPadding: EdgeInsets.only(left: 20,top: 10),
          buttonPadding: EdgeInsets.only(top: 5,right: 20),
          insetPadding: EdgeInsets.zero,
          actionsPadding: EdgeInsets.only(bottom: 10,right: 20,top: 5),
          title: Row(
            children: [
              Icon(
                Icons.error,
                color: ColorConstant.lightRedColor,
                size: 30,
              ),
              SizedBox(width: 10), // Space between icon and title
              Expanded(
                child: Text(
                  'Error',
                  style: GoogleFonts.barlow(
                    textStyle: TextStyle(
                      color: ColorConstant.lightRedColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
          content: Text(
            errorMessage,
            style: GoogleFonts.barlow(
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'OK',
                style: GoogleFonts.barlow(
                  textStyle: TextStyle(
                    color: ColorConstant.lightRedColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
            ),
          ],
        );
      },
    );
  }


  static void showSuccessDialog(BuildContext context, String successMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // Rounded corners
          ),
          backgroundColor: Colors.white, // Background color
          elevation: 5, // Shadow effect
          titlePadding: EdgeInsets.only(left: 0,top: 10),
          contentPadding: EdgeInsets.only(left: 20,top: 10),
          buttonPadding: EdgeInsets.only(top: 5,right: 20),
          insetPadding: EdgeInsets.zero,
          actionsPadding: EdgeInsets.only(bottom: 10,right: 20,top: 5),
         
          content: Column(
            children: [
              Text(
                successMessage,
                style: GoogleFonts.barlow(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            InkWell(
                  onTap: () {
                  
                  },
                  child: BottonWidgets.getContinueBotton(
                    context: context,
                    title: "Let's Go",
                  ),
                ),
          ],
        );
      },
    );
  }
}
