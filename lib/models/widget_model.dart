import 'package:flutter/material.dart';
import 'package:my_website/models/widgets_item.dart';

class WidgetModel{
  dynamic textEditingController;
  Widget widget;
  WidgetsItem widgetType;

  WidgetModel({required this.textEditingController,required this.widget,required this.widgetType});

}