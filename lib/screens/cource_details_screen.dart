import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_website/utils/color_constant.dart';
import 'package:my_website/utils/globalMethods.dart';

class CourseDetailsScreen extends StatefulWidget {
  CourseDetailsScreen();

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: displayWidth(context),
            // height: displayHeight(context) / 2,
            color: ColorConstant.lightRedColor,
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: displayWidth(context) / 9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: displayWidth(context) / 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Flutter & Dart - The Complete Guide [2024 Edition]",
                          style: GoogleFonts.barlow(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "A Complete Guide to the Flutter SDK &amp; Flutter Framework for building native iOS and Android apps",
                          style: GoogleFonts.barlow(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Container(
                              width: displayWidth(context) / 18,
                              height: 25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: ColorConstant.yellowLightColor),
                              alignment: Alignment.center,
                              child: Text(
                                "Best Seller",
                                style: GoogleFonts.barlow(
                                  textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "4.6",
                              style: GoogleFonts.barlow(
                                textStyle: TextStyle(
                                    color: ColorConstant.yellowLightColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: List.generate(5, (index) {
                                return Icon(
                                  Icons.star, // Star icon
                                  color: ColorConstant
                                      .yellowLightColor, // Yellow color for the stars
                                  size: 17,
                                );
                              }),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "(500 Ratings)",
                              style: GoogleFonts.barlow(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.date_range_outlined,
                              size: 15,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Last updated 08/2024",
                              style: GoogleFonts.barlow(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "|",
                              style: GoogleFonts.barlow(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.language,
                              size: 15,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              "Hindi",
                              style: GoogleFonts.barlow(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: displayHeight(context) / 3,
                    width: displayWidth(context) / 4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: 1, color: Colors.white),
                        image: const DecorationImage(
                            image: AssetImage('assets/flutter_course.jpg'),
                            fit: BoxFit.fill)),
                    child: Stack(
                      children: [
                        Container(
                          height: displayHeight(context) / 3,
                          width: displayWidth(context) / 4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white54),
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.play_circle_outline_rounded,
                            size: 60,
                            color: Colors.black54,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: displayWidth(context) / 9),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Course Content",
                      style: GoogleFonts.barlow(
                        textStyle: TextStyle(
                            color: ColorConstant.lightRedColor,
                            fontSize: 25,
                            fontWeight: FontWeight.w800),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "16 sections • 307 lectures • 30h 1m total length",
                      style: GoogleFonts.barlow(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          width: 1, color: ColorConstant.lightRedColor)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ListView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: displayHeight(context) / 5,
                                  width: displayWidth(context) / 5,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          width: 1, color: Colors.black),
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/flutter_course.jpg'),
                                          fit: BoxFit.fill)),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Introduction to Flutter",
                                      style: GoogleFonts.barlow(
                                        textStyle: TextStyle(
                                            color: ColorConstant.lightRedColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.",
                                      style: GoogleFonts.barlow(
                                        textStyle: const TextStyle(
                                            color: Colors.black87,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                     const SizedBox(
                                      height: 8,
                                    ),
                                     Text(
                      "20 Min   •   1M+ Views   •   ♡ 200",
                      style: GoogleFonts.barlow(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                                  ],
                                ))
                              ],
                            ),
                          );
                        }),
                  ),
                ),
                SizedBox(height: 20,)
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
