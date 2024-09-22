import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_website/utils/color_constant.dart';
import 'package:my_website/utils/globalMethods.dart';

class CourseDetailsScreen extends StatefulWidget {
  String title;
  CourseDetailsScreen({required this.title});

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: displayHeight(context),
        child: Column(
          children: [
            Container(
              height: displayHeight(context) / 7,
              width: displayWidth(context) / 1,
              color: ColorConstant.lightRedColor,
              alignment: Alignment.center,
              child: Text(
                widget.title,
                style: GoogleFonts.barlow(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Expanded(child: 
           GridView.builder(
            padding: EdgeInsets.symmetric(vertical: 30),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // Number of columns
          childAspectRatio: 1, // Adjust this for size
        ),
        itemCount: 10, // Total items to display
        itemBuilder: (context, index) {
          return Container(
            width: displayHeight(context) / 2.5,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: ColorConstant.lightRedColor, // Use your color constant here
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Image.asset(
                      'assets/flutter_logo.png',
                      height: displayHeight(context) / 3.5,
                      width: displayHeight(context) / 2.5,
                    ),
                  ),
                ),
                Container(
                  width: displayHeight(context) / 2.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'title',
                          style: GoogleFonts.barlow(
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(height: 0),
                        Text(
                          "100+ Videos | 2 Projects",
                          style: GoogleFonts.barlow(
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: 0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Price:",
                                  style: GoogleFonts.barlow(
                                    textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 2),
                                Text(
                                  '1\$',
                                  style: GoogleFonts.barlow(
                                    textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Read more",
                                  style: GoogleFonts.barlow(
                                    textStyle: TextStyle(
                                      color: Color(0xFFFFC107), // Use your color constant here
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 3.0),
                                  child: Icon(
                                    Icons.navigate_next_rounded,
                                    size: 18,
                                    color: Color(0xFFFFC107), // Use your color constant here
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    
            )
          ],
        ),
      ),
    );
  }
}
