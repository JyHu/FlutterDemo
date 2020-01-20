
import 'package:flutter/material.dart';
import 'package:flutter_demo/basic_widges/button_widget_route.dart';
import 'package:flutter_demo/basic_widges/checking_widget_route.dart';
import 'package:flutter_demo/basic_widges/image_widget_route.dart';
import 'package:flutter_demo/basic_widges/input_widget_route.dart';
import 'package:flutter_demo/basic_widges/state_route.dart';
import 'package:flutter_demo/basic_widges/state_x_route.dart';
import 'package:flutter_demo/basic_widges/text_widget_route.dart';
import 'package:flutter_demo/constants/constants.dart';
import 'package:flutter_demo/introduction/argument_route.dart';
import 'package:flutter_demo/introduction/aspect_route.dart';
import 'package:flutter_demo/introduction/counter_route.dart';
import 'package:flutter_demo/introduction/new_route.dart';

class RoutesManager {
  static RoutesManager manager = RoutesManager();

  List pages = <_RoutesModel>[
    _RoutesModel(title: "Open New Route", routes: Constants.routes.newPage, widget: (context) => NewRoute()),
    _RoutesModel(title: "Open Params Page", routes: Constants.routes.paramsPage, widget: (context) =>  ArgumentPage()),
    _RoutesModel(title: "Open Aspect Page", routes: Constants.routes.aspectPage, widget: (context) =>  AspectRoute()),
    _RoutesModel(title: "Open Counter Page", routes: Constants.routes.counterPage, widget: (context) =>  CounterPage()),

    _RoutesModel(title: "Open State Page", routes: Constants.routes.stateXPage, widget: (context) =>  StateXPage()),
    _RoutesModel(title: "Open State Control Page", routes: Constants.routes.statePage, widget: (context) =>  StatePage()),
    _RoutesModel(title: "Open Text Widget Page", routes: Constants.routes.textWidgetPage, widget: (context) => TextWidgetPage()),
    _RoutesModel(title: "Open Button Widget Page", routes: Constants.routes.buttonWidgetPage, widget: (context) => ButtonWidgetPage()),
    _RoutesModel(title: "Open Image Widget Page", routes: Constants.routes.imageWidgetPage, widget: (context) => ImageWidgetPage()),
    _RoutesModel(title: "Open Checking Widget Page", routes: Constants.routes.checkingWidgetPage, widget: (context) => CheckingWidgetPage()),
    _RoutesModel(title: "Open Input Widget Page", routes: Constants.routes.inputWidgetPage, widget: (context) => InputWidgetPage()),
  ];

  Map get routes {
    var rts = <String, WidgetBuilder>{};

    for (var page in pages) {
      rts[page.routes] = page.widget;
    }
    
    return rts;
  }
}


class _RoutesModel {
  _RoutesModel({
    @required this.title, 
    @required this.routes,
    @required this.widget
  });

  final String title;
  final String routes;
  final WidgetBuilder widget;
}