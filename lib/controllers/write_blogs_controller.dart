import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_website/models/widget_model.dart';
import 'package:my_website/models/widgets_item.dart';
import 'package:my_website/widgets/add_image_widget.dart';
import 'package:my_website/widgets/divider_widget.dart';
import 'package:my_website/widgets/title_text_field_widget.dart';

class WriteBlogsController extends ChangeNotifier {
  List<WidgetModel> widgetItems = [];

  List<XFile>imageList=[];
 

  void addWidget(Enum widgetsItem) {
    try{
      print(widgetsItem);
      switch (widgetsItem) {
      case WidgetsItem.titleWidget:
        TextEditingController textEditingController =
            new TextEditingController();
        widgetItems.add(
          WidgetModel(textEditingController: textEditingController, widget: titleTextField(), widgetType: WidgetsItem.titleWidget)
        );
        break;
      case WidgetsItem.headingWidget:
        TextEditingController textEditingController =
            new TextEditingController();
       widgetItems.add(
          WidgetModel(textEditingController: textEditingController, widget: headingTextField(), widgetType: WidgetsItem.headingWidget)
        );
        break;
      case WidgetsItem.descriptionWidget:
        TextEditingController textEditingController =
            new TextEditingController();
         widgetItems.add(
          WidgetModel(textEditingController: textEditingController, widget: descriptionTextField(), widgetType: WidgetsItem.dividerWidget)
        );
        break;
      case WidgetsItem.dividerWidget:
        widgetItems.add(
          WidgetModel(textEditingController: null, widget: addDividerWidget(), widgetType: WidgetsItem.dividerWidget)
        );
        break;
      case WidgetsItem.imageWidget:
        widgetItems.add(WidgetModel(textEditingController: null, widget: DynamicImageWidget(),
        widgetType: WidgetsItem.imageWidget)
        );
        break;
    }
   
    }catch(e,_){
      print(_);
    }finally{
       notifyListeners();
    }
  }

  void addDefaultWidget(Enum widgetsItem) {
    switch (widgetsItem) {
      case WidgetsItem.titleWidget:
        TextEditingController textEditingController =
            new TextEditingController();
        widgetItems.add(
          WidgetModel(textEditingController: textEditingController, widget: titleTextField(), widgetType: WidgetsItem.titleWidget)
        );
    }
  }


  void showData(){
    print(widgetItems.last.widget);
  }


void addImage(XFile file){
  imageList.add(file);
  notifyListeners();
}
}
