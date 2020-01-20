import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/constants.dart';
import 'package:flutter_demo/home_page.dart';
import 'package:flutter_demo/introduction/aspect_route.dart';
import 'package:flutter_demo/introduction/tips_route.dart';
import 'package:flutter_demo/routes_manager.dart';
import 'package:flutter_demo/unknown_route.dart';

// // 应用的入口，启动flutter应用
// void main() => runApp(MyApp());
void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    print("$details");
  };

  return runApp(MyApp());
}

/// MyApp类代表Flutter应用，它继承了 StatelessWidget类，这也就意味着应用本身也是一个widget。
/// 在Flutter中，大多数东西都是widget（后同“组件”或“部件”），包括对齐(alignment)、填充(padding)和布局(layout)等，它们都是以widget的形式提供。
/// Flutter在构建页面时，会调用组件的build方法，widget的主要工作是提供一个build()方法来描述如何构建UI界面（通常是通过组合、拼装其它基础widget）。
/// MaterialApp 是Material库中提供的Flutter APP框架，通过它可以设置应用的名称、主题、语言、首页及路由列表等。MaterialApp也是一个widget。
/// home 为Flutter应用的首页，它也是一个widget。
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    // 获取所有的路由配置页面
    var routes = RoutesManager.manager.routes;
    routes[Constants.routes.homePage] = (context) => MyHomePage(title: "Flutter Demo");
    // tip2 页面需要在初始化的时候有入参，可以通过获取当前上下文的方式来获取传递的参数
    routes[Constants.routes.tipsPage] = (context) => TipsRoute(text: ModalRoute.of(context).settings.arguments);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Constants.routes.homePage,
      // 应用首页，使用路由表的话，可以用 initialRoute 来表示初始路由页面
      // home: MyHomePage(title: "Flutter Demo"),
      routes: routes,

      // 在打开命名路由的时候，如果在路由表中没有注册的话，会走这里，可以对跳转逻辑做统一的管理、配置
      // 比如跳转的时候，如果登录了跳转A页面，未登录跳转B页面
      // 再比如第一次登录的时候跳转到引导页，以后直接登录
      // 等等
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          String name = settings.name;
          if (name == Constants.routes.aspectPage) {
            return AspectRoute();
          }
          return UnknownPage();
        });
      },
    );
  }
}
