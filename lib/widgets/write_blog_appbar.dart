import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_website/controllers/write_blogs_controller.dart';
import 'package:my_website/models/widgets_item.dart';
import 'package:my_website/screens/sign_in_screen.dart';
import 'package:my_website/utils/color_constant.dart';
import 'package:my_website/utils/globalMethods.dart';
import 'package:my_website/utils/image_utils.dart';
import 'package:my_website/utils/routings.dart';
import 'package:my_website/widgets/botton_widget.dart';
import 'package:provider/provider.dart';

class WriteBlogAppBar extends StatelessWidget {
  WriteBlogAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: displayHeight(context) / 10,
      width: displayWidth(context) / 1,
      decoration: const BoxDecoration(color: Colors.white),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: displayWidth(context) / 12),
        child: Consumer<WriteBlogsController>(
            builder: (context, writeBlogController, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                ImageUtils.logo_img,
                width: displayWidth(context) / 8,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BottonWidgets.tinnySmallMainBotton(
                      context: context, title: 'Publish', onPressed: () {}),
                  SizedBox(
                    width: 20,
                  ),
                  BottonWidgets.tinnySmallMainBotton(
                    context: context,
                    title: '+ Add Items',
                    onPressed: () {
                      // Get the button's position and size using RenderBox
                      final RenderBox button =
                          context.findRenderObject() as RenderBox;
                      final RenderBox overlay = Overlay.of(context)
                          .context
                          .findRenderObject() as RenderBox;

                      final Offset position =
                          button.localToGlobal(Offset.zero, ancestor: overlay);
                      final Size size = button.size;

                      // Adjust the popup to open below the button
                      showMenu(
                        context: context,
                        position: RelativeRect.fromLTRB(
                          position.dx +
                              size.width, // Align the popup with the button horizontally
                          position.dy +
                              size.height, // Open the popup below the button
                          position
                              .dx, // Right boundary (not critical for below positioning)
                          position.dy + size.height, // Bottom boundary
                        ),
                        items: [
                          PopupMenuItem(
                            child: GestureDetector(
                              onTap: () {
                               writeBlogController.addWidget(WidgetsItem.headingWidget);
                               Navigator.pop(context);
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.menu,
                                    size: 18,
                                    color: ColorConstant.lightRedColor,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Heading",
                                    style: GoogleFonts.barlow(
                                      textStyle: TextStyle(
                                        color: ColorConstant.lightRedColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          PopupMenuItem(
                            child: GestureDetector(
                              onTap: () {
                                writeBlogController.addWidget(WidgetsItem.descriptionWidget);
                               Navigator.pop(context);
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.menu,
                                    size: 18,
                                    color: ColorConstant.lightRedColor,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Description",
                                    style: GoogleFonts.barlow(
                                      textStyle: TextStyle(
                                        color: ColorConstant.lightRedColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          PopupMenuItem(
                            child: GestureDetector(
                              onTap: () {
                                writeBlogController.addWidget(WidgetsItem.imageWidget);
                               Navigator.pop(context);
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.menu,
                                    size: 18,
                                    color: ColorConstant.lightRedColor,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Image",
                                    style: GoogleFonts.barlow(
                                      textStyle: TextStyle(
                                        color: ColorConstant.lightRedColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          PopupMenuItem(
                            child: GestureDetector(
                              onTap: () {
                                writeBlogController.addWidget(WidgetsItem.dividerWidget);
                               Navigator.pop(context);
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.menu,
                                    size: 18,
                                    color: ColorConstant.lightRedColor,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Divider",
                                    style: GoogleFonts.barlow(
                                      textStyle: TextStyle(
                                        color: ColorConstant.lightRedColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    color: ColorConstant.greenColor,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              )
            ],
          );
        }),
      ),
    );
  }
}
