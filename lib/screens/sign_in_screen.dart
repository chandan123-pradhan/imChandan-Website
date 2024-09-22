import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_website/utils/color_constant.dart';
import 'package:my_website/utils/globalMethods.dart';
import 'package:my_website/widgets/botton_widget.dart';

class SignupDialog extends StatelessWidget {
  const SignupDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black,
      content: Container(
        width: displayWidth(context)/3.2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                'SIGN UP',
                style: GoogleFonts.barlow(
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "What's your name?",
                  style: GoogleFonts.barlow(
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
             SizedBox(height: 10,)
,             
                Container(
            decoration: BoxDecoration(
              color: Colors.white, // White background
              borderRadius: BorderRadius.circular(8.0), // Optional rounded corners
              border: Border.all(color: Colors.grey), // Optional border
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter here',
                border: InputBorder.none, // Remove the default border
                contentPadding: EdgeInsets.all(12.0), // Padding inside the TextField
              ),
            ),
          ),
              SizedBox(height: 20,),
              Text(
                  "What's your email?",
                  style: GoogleFonts.barlow(
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
             SizedBox(height: 10,)
,             
                Container(
            decoration: BoxDecoration(
              color: Colors.white, // White background
              borderRadius: BorderRadius.circular(8.0), // Optional rounded corners
              border: Border.all(color: Colors.grey), // Optional border
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter here',
                border: InputBorder.none, // Remove the default border
                contentPadding: EdgeInsets.all(12.0), // Padding inside the TextField
              ),
            ),
          ),
          
            
         SizedBox(height: 20,),
              Text(
                  "Enter Password",
                  style: GoogleFonts.barlow(
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
             SizedBox(height: 10,)
,             
                Container(
            decoration: BoxDecoration(
              color: Colors.white, // White background
              borderRadius: BorderRadius.circular(8.0), // Optional rounded corners
              border: Border.all(color: Colors.grey), // Optional border
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter here',
                border: InputBorder.none, // Remove the default border
                contentPadding: EdgeInsets.all(12.0), // Padding inside the TextField
              ),
            ),
          ),  
           SizedBox(height: 20,),
              Text(
                  "Enter confirm password",
                  style: GoogleFonts.barlow(
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
             const SizedBox(height: 10,)
,             
                Container(
            decoration: BoxDecoration(
              color: Colors.white, // White background
              borderRadius: BorderRadius.circular(8.0), // Optional rounded corners
              border: Border.all(color: Colors.grey), // Optional border
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Enter here',
                border: InputBorder.none, // Remove the default border
                contentPadding: EdgeInsets.all(12.0), // Padding inside the TextField
              ),
            ),
          ),   
          SizedBox(height: 30,),
          BottonWidgets.getContinueBotton(context: context,
          title: 'Continue',
          onPressed: (){}
          )  ,
            SizedBox(height: 20,)
            , 

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text(
                  "Already have an Account? ",
                  style: GoogleFonts.barlow(
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                 Text(
                  "Sign In",
                  style: GoogleFonts.barlow(
                    textStyle:  TextStyle(
                        color: ColorConstant.lightRedColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                ),
            ],),
             SizedBox(height: 20,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
