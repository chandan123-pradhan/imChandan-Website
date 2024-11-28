import 'dart:convert';
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
          WidgetModel(textEditingController: textEditingController, widget: titleTextField(
            controller: textEditingController
          ), widgetType: WidgetsItem.titleWidget)
        );
        break;
      case WidgetsItem.headingWidget:
        TextEditingController textEditingController =
            new TextEditingController();
       widgetItems.add(
          WidgetModel(textEditingController: textEditingController, widget: headingTextField(
            controller: textEditingController
          ), widgetType: WidgetsItem.headingWidget)
        );
        break;
      case WidgetsItem.descriptionWidget:
        TextEditingController textEditingController =
            new TextEditingController();
         widgetItems.add(
          WidgetModel(textEditingController: textEditingController, widget: descriptionTextField(
            controller: textEditingController
          ), widgetType: WidgetsItem.descriptionWidget)
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
          WidgetModel(textEditingController: textEditingController, widget: titleTextField(
            controller: textEditingController
          ), widgetType: WidgetsItem.titleWidget)
        );
    }
  }


  
void addImage(XFile file){
  imageList.add(file);
  notifyListeners();
}
void showData(){
  List<Map> body=[];
  int imageIndex=0;
   for(int i=1;i<widgetItems.length;i++){
    switch(widgetItems[i].widgetType){
      case WidgetsItem.titleWidget: 
      case WidgetsItem.descriptionWidget:
      case WidgetsItem.headingWidget:
        body.add({
          'type':widgetItems[i].widgetType,
          'content':widgetItems[i].textEditingController.text
        });
        break;
      case WidgetsItem.dividerWidget:
        body.add({
          'type':widgetItems[i].widgetType,
          'content':''
        });
        break;
      case WidgetsItem.imageWidget:
        body.add({
          'type':widgetItems[i].widgetType,
          'content':imageList[imageIndex],
        });  
        imageIndex++;
        break;

    }
   }
   print("body=$body");
    Map<String,dynamic> titleMap={
    
      'title':widgetItems.first.textEditingController.text,
      'thumbnail':'',
      'data':body
    
  };
  var v=titleMap;
  print(v);
   
  }


}
