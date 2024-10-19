import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_website/utils/color_constant.dart';

Widget titleTextField() {
  return TextFormField(
    maxLines: null,
      decoration:  InputDecoration(
        hintText: 'Title...', // Hint text
        hintStyle: GoogleFonts.barlow(
        textStyle: TextStyle(
            color: Colors.black38,
            fontSize: 40  ,
            fontWeight: FontWeight.w600),
      ),
        border:
            InputBorder.none
      ),
      style: GoogleFonts.barlow(
        textStyle: TextStyle(
            color: ColorConstant.lightRedColor,
            fontSize: 40,
            fontWeight: FontWeight.w800),
      ));
}
Widget headingTextField() {
  return TextFormField(
    maxLines: null,
      decoration:  InputDecoration(
        hintText: 'Tell your story...', // Hint text
        hintStyle: GoogleFonts.barlow(
        textStyle: TextStyle(
            color: Colors.black38,
            fontSize: 32  ,
            fontWeight: FontWeight.w600),
      ),
        border:
            InputBorder.none
      ),
      style: GoogleFonts.barlow(
        textStyle: TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.w600),
      ));
}

Widget descriptionTextField() {
  return TextFormField(
    maxLines: null,
      decoration:  InputDecoration(
        hintText: 'write here...', // Hint text
        hintStyle: GoogleFonts.barlow(
        textStyle: TextStyle(
            color: Colors.black38,
            fontSize: 18  ,
            fontWeight: FontWeight.w500),
      ),
        border:
            InputBorder.none
      ),
      style: GoogleFonts.barlow(
        textStyle: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600),
      ));
}

