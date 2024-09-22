import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_website/utils/color_constant.dart';
import 'package:my_website/utils/globalMethods.dart';

class AboutOurComunityWidget extends StatelessWidget {
  const AboutOurComunityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
     
      width: displayWidth(context),
      color: ColorConstant.lightRedColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30,),
          Text("About Our Comunity",
           style: GoogleFonts.barlow(
          textStyle: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
        ),
          ),
          SizedBox(height: 10,),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/teamwork.png',
        height: 30,
        width: 30,
        color: Colors.white,
        ),
        SizedBox(width: 10,),
         Text("10+ Expert Professionals",
               style: GoogleFonts.barlow(
              textStyle: TextStyle(
                  color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
            ),
         )
    
      ],
    ),
  SizedBox(width: 10,),
   Text("|",
           style: GoogleFonts.barlow(
          textStyle: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
        ),
     ),
SizedBox(width: 10,),
 Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/videos.png',
        height: 25,
        width: 25,
        color: Colors.white,
        ),
        SizedBox(width: 10,),
         Text("150+ Well Explained Videos",
         textAlign: TextAlign.start,
               style: GoogleFonts.barlow(
              textStyle: TextStyle(
                  color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
            ),
         )
    
      ],
    ),
  SizedBox(width: 10,),
   Text("|",
           style: GoogleFonts.barlow(
          textStyle: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
        ),
     ),
     SizedBox(width: 10,),
 Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/projects.png',
        height: 25,
        width: 25,
       
        ),
        SizedBox(width: 10,),
         Text("10+ Amazing & Exiting Projects",
         textAlign: TextAlign.start,
               style: GoogleFonts.barlow(
              textStyle: TextStyle(
                  color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
            ),
         )
    
      ],
    ),


  ],
),
 SizedBox(height: 30,),

        ],
      ),
    );
  }
}
