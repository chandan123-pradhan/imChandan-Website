import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_website/utils/color_constant.dart';

class TypeWriterText extends StatelessWidget {
  String text;
  TypeWriterText({required this.text});
  @override
  Widget build(BuildContext context) {
    return  AnimatedTextKit(
        animatedTexts: [
          TypewriterAnimatedText(
            text,
            textAlign: TextAlign.left,
            textStyle: GoogleFonts.barlow(
              
              textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            speed: const Duration(milliseconds: 100),
          ),
        ],
       repeatForever: true,

      
    );
  }
}
