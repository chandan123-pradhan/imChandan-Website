import 'package:flutter/material.dart';
import 'package:my_website/models/widget_model.dart';
import 'package:my_website/models/widgets_item.dart';
import 'package:my_website/widgets/title_text_field_widget.dart';

class WriteBlogsController extends ChangeNotifier {
  List<WidgetModel> widgetItems = [];
 

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
}
