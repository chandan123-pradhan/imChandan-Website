import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_website/controllers/write_blogs_controller.dart';
import 'package:my_website/models/widgets_item.dart';
import 'package:my_website/utils/globalMethods.dart';
import 'package:my_website/widgets/write_blog_appbar.dart';
import 'package:provider/provider.dart';

class WriteBlogScreen extends StatelessWidget {
  const WriteBlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<WriteBlogsController>(context, listen: false)
        .addDefaultWidget(WidgetsItem.titleWidget);
    return Scaffold(
      body: Column(
        children: [
          WriteBlogAppBar(),
          SizedBox(
            height: 10,
          ),
          Expanded(child: Consumer<WriteBlogsController>(
              builder: (context, writeBlogController, child) {
            return ListView.builder(
                itemCount: writeBlogController.widgetItems.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: displayWidth(context) / 6),
                    child: Container(
                        child: writeBlogController.widgetItems[index].widget),
                  );
                });
          }))
        ],
      ),
    );
  }
}
