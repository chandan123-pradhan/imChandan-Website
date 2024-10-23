import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_website/controllers/home_controller.dart';
import 'package:my_website/utils/color_constant.dart';
import 'package:my_website/utils/globalMethods.dart';
import 'package:my_website/utils/routings.dart';
import 'package:my_website/widgets/about_our_community_widget.dart';
import 'package:my_website/widgets/botton_widget.dart';
import 'package:my_website/widgets/cources_widget.dart';
import 'package:my_website/widgets/dashboard_appbar.dart';
import 'package:my_website/widgets/typewrite_animated_text.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<HomeController>(context,listen: false).initialize();
   return Scaffold(
      body:  Consumer<HomeController>(
              builder: (context, homeController, child) {
          return Stack(
            children: [
              Column(
                children: [
                  DashbaordAppBar(),
                  Expanded(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.white
                                        .withOpacity(0.3), // Starting color (white)
                                    ColorConstant.backgroundColor
                                        .withOpacity(0.3), // Softer color
                                    ColorConstant.backgroundColor
                                        .withOpacity(0.4), // Even softer color
                                  ],
                                  stops: const [
                                    0.3,
                                    0.5,
                                    1.0
                                  ], // Adjust stops for a smooth transition
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: displayWidth(context) / 12),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: displayHeight(context) / 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: displayWidth(context) / 2.5,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Learn & become A",
                                                style: GoogleFonts.barlow(
                                                  textStyle: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 50,
                                                      fontWeight: FontWeight.w800),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "Complete Mobile App\nDeveloper",
                                                textAlign: TextAlign.start,
                                                style: GoogleFonts.barlow(
                                                  textStyle: TextStyle(
                                                      color: ColorConstant
                                                          .lightRedColor,
                                                      fontSize: 50,
                                                      fontWeight: FontWeight.w800),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              TypeWriterText(
                                                text:
                                                    'Complete Flutter Development Course',
                                              ),
                                              const SizedBox(
                                                height: 30,
                                              ),
                                              BottonWidgets.getMainBotton(
                                                  context: context,
                                                  title: 'Explore News Batches',
                                                  onPressed: () {})
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: displayWidth(context) / 20),
                                          child: Container(
                                            width: displayWidth(context) / 4,
                                            height: displayHeight(context) / 1.8,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(200),
                                                  topRight: Radius.circular(200),
                                                ),
                                                border: Border.all(
                                                    width: 1,
                                                    color: ColorConstant
                                                        .lightRedColor),
                                                image: const DecorationImage(
                                                    image: AssetImage(
                                                      'assets/profile_pic.png',
                                                    ),
                                                    fit: BoxFit.cover)),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 50,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const AboutOurComunityWidget(),
                            Container(
                              width: displayWidth(context),
                             // height: displayHeight(context) / 2,
                              color: Colors.white,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Our Courses",
                                    style: GoogleFonts.barlow(
                                      textStyle: TextStyle(
                                          color: ColorConstant.lightRedColor,
                                          fontSize: 35,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ), 
                                   Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      InkWell(
                                      onTap: (){
                                        Navigator.pushNamed(
            context,
            Routings.courseDetailsRoute,
           
          );
                                      },
                                        child: CourcesWidget(
                                          title: 'Complete Flutter Development',
                                        ),
                                      ),
                                      CourcesWidget(
                                          title: 'Flutter Crash Course',
                                      ),
                                      CourcesWidget(
                                          title: 'Flutter Modules',
                                      ),
                                      
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ), 
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                  bottom: 10,
                  left: 20,
                  child: Image.asset(
                    'assets/messages.png',
                    height: 80,
                    width: 70,
                    fit: BoxFit.fill,
                  ))
            ],
          );
        }
      ),
    );
  }
}
