import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_website/controllers/profile_controller.dart';
import 'package:my_website/models/course_model.dart';
import 'package:my_website/utils/app_state.dart';
import 'package:my_website/utils/color_constant.dart';
import 'package:my_website/utils/globalMethods.dart';
import 'package:my_website/utils/global_variables.dart';
import 'package:my_website/utils/routings.dart';
import 'package:my_website/utils/shared_pref.dart';
import 'package:my_website/web_services/url_constant.dart';
import 'package:my_website/widgets/botton_widget.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<CourceModel> courses = [];

  void getCourses() {
    courses.add(CourceModel(
        id: 1,
        title: 'API Integration With GetX In Flutter',
        description: 'Learn How to Integration Rest API using GetX in flutter.',
        icon:
            'https://miro.medium.com/v2/resize:fit:4800/format:webp/1*1jjS1Os2sJmWAKcweEijHA.jpeg',
            date: '22 Apr 2024',
            likes: '120'
            ));
    courses.add(CourceModel(
        id: 1,
        title: 'API, Rest API And RESTful API',
        description:
            'Rest API and RESTful API used in the modern state of client/server architecture in software development.',
        icon:
            'https://miro.medium.com/v2/resize:fit:4800/format:webp/1*OlQoCv6SArciYqImJnZ1HQ.png',
            date: '20 Apr 2024',
            likes: '150'
            ));

    courses.add(CourceModel(
        id: 1,
        title: 'Top 5 Best Resources Which Helps You Can Learn Flutter Easily.',
        description:
            'In This Article I’ll Mention Top 5 Most Easy Tutorial which Helps You Can Learn Flutter Easily. so Let Start.',
        icon:
            'https://miro.medium.com/v2/resize:fit:1400/format:webp/1*sm5TQKtrnMV4sensqyiHWQ.jpeg',
            
             date: '26 Apr 2024',
            likes: '200'
            ));
             courses.add(CourceModel(
        id: 1,
        title: 'API, Rest API And RESTful API',
        description:
            'Rest API and RESTful API used in the modern state of client/server architecture in software development.',
        icon:
            'https://miro.medium.com/v2/resize:fit:4800/format:webp/1*OlQoCv6SArciYqImJnZ1HQ.png',
             date: '28 Apr 2024',
            likes: '250'
            ));
            courses.add(CourceModel(
        id: 1,
        title: 'API Integration With GetX In Flutter',
        description: 'Learn How to Integration Rest API using GetX in flutter.',
        icon:
            'https://miro.medium.com/v2/resize:fit:4800/format:webp/1*1jjS1Os2sJmWAKcweEijHA.jpeg',
             date: '30 Apr 2024',
            likes: '300'
            ));
  }

  @override
  void initState() {
    getCourses();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ProfileController>(context,listen: false).getProfile();
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: displayHeight(context) / 15,
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: displayWidth(context) / 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Consumer<ProfileController>(
              builder: (context, profileController, child) {
                      return Container(
                        width: displayWidth(context) / 4,
                        child: 
                        profileController.currentState==AppState.loading?Center(
                          child: CircularProgressIndicator(),
                        ):
                        
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: displayHeight(context) / 3,
                              width: displayHeight(context) / 3,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 1, color: ColorConstant.lightRedColor),
                                  image:  DecorationImage(
                                      image: NetworkImage(
                                      UrlConstant.base_url+ '/'+profileController.getProfileApiResponse!.data.profilePic
                                      ),
                                      fit: BoxFit.fill)),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              profileController.getProfileApiResponse!.data.fullName,
                              style: GoogleFonts.barlow(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Text(
                              profileController.getProfileApiResponse!.data.email,
                              style: GoogleFonts.barlow(
                                textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: displayWidth(context) / 5,
                              child: RichText(
                                text: TextSpan(
                                  style: GoogleFonts.barlow(
                                    textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  children: [
                                    const TextSpan(
                                        text:
                                            "Full Stack Mobile App Developer/Youtuber: "),
                                    TextSpan(
                                      text: "https://www.youtube.com/@Career_Tips",
                                      style: TextStyle(
                                          color: ColorConstant.lightRedColor,
                                          decoration: TextDecoration.underline),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {},
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                                width: displayWidth(context) / 5,
                                child: BottonWidgets.getSmallMainBotton(
                                    context: context,
                                    title: 'Logout',
                                    onPressed: () {
                                      SharedPref _sharedPref = new SharedPref();
                                      _sharedPref.removeAuthToken();
                                      isLoggedIn=false;
                                      setState(() {
                                        
                                      });
                                      Navigator.pop(context);
                                    })),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/teamwork.png',
                                  height: 22,
                                  width: 22,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "100 Followers",
                                  style: GoogleFonts.barlow(
                                    textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "|",
                                  style: GoogleFonts.barlow(
                                    textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "2 Following",
                                  style: GoogleFonts.barlow(
                                    textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/office.png',
                                  height: 20,
                                  width: 20,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Microsoft",
                                  style: GoogleFonts.barlow(
                                    textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/pin.png',
                                  height: 20,
                                  width: 20,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Banglore",
                                  style: GoogleFonts.barlow(
                                    textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/link.png',
                                  height: 20,
                                  width: 20,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "https://github.com/chandan123-pradhan",
                                  style: GoogleFonts.barlow(
                                    textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: displayWidth(context) / 5,
                              height: 0.3,
                              color: Colors.black26,
                            )
                          ],
                        ),
                      );
                    }
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      height: displayHeight(context),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: displayWidth(context) / 1.9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      8.0), // Optional rounded corners
                                  border: Border.all(
                                      color: Colors.grey), // Optional border
                                ),
                                child: const TextField(
                                  decoration: InputDecoration(
                                    hintText: 'search blogs here...',
                                    isDense: true,
                                    border: InputBorder
                                        .none, // Remove the default border
                                    contentPadding: EdgeInsets.all(
                                        12.0), // Padding inside the TextField
                                  ),
                                ),
                              ),
                              Container(
                                width: displayWidth(context) / 10,
                                height: displayHeight(context) / 16,
                                child: BottonWidgets.getSmallMainBotton(
                                    context: context,
                                    title: 'Start New Blog',
                                    onPressed: () {
                                       Navigator.pushNamed(
  context,
  Routings.writeBlogRoute,
 
);
                                    }),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Expanded(
                              child: 
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: ListView.builder(
                                    itemCount: courses.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8.0),
                                        child: Container(
                                          
                                          width: displayWidth(context),
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      width: 0.3,
                                                      color: ColorConstant
                                                          .lightRedColor))),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: displayWidth(context)/2,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      courses[index].title,
                                                      style: GoogleFonts.barlow(
                                                        textStyle: const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 25,
                                                            fontWeight:
                                                                FontWeight.w600),
                                                      ),
                                                    ),
                                                    SizedBox(height: 10,),
                                                            Text(
                                                      courses[index].description,
                                                      style: GoogleFonts.barlow(
                                                        textStyle: const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w400),
                                                      ),
                                                    ),
                                                      SizedBox(height: 10,),
                                                      Row(
                                                        children: [
                                                               Text(
                                                      courses[index].date,
                                                      style: GoogleFonts.barlow(
                                                        textStyle: const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w400),
                                                      ),
                                                    ),
                                                    SizedBox(width: 10,),
                                                            Text(
                                                      '|',
                                                      style: GoogleFonts.barlow(
                                                        textStyle: const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w400),
                                                      ),
                                                    ),
                                                     SizedBox(width: 10,),
                                                     Icon(Icons.favorite,
                                                     color: ColorConstant.lightRedColor,
                                                     size: 18,
                                                     ),
                                                      SizedBox(width: 5,),
                                                         Text(
                                                      courses[index].likes,
                                                      style: GoogleFonts.barlow(
                                                        textStyle: const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w400),
                                                      ),
                                                    ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 20,)
                                                  ],
                                                ),
                                              ),
                                          Expanded(
                                            child: Container(
                                              height: displayHeight(context)/6,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                border: Border.all(width: 1,
                                                color: ColorConstant.lightRedColor
                                                ),
                                                image: DecorationImage(image: 
                                                NetworkImage(courses[index].icon)
                                                )
                                              ),
                                            ),
                                          )
                                          
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
