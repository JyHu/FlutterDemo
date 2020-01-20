
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/constants.dart';

class ImageWidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Widget"),
      ),
      body: Column(
        children: <Widget>[
          Image(
            image: AssetImage(
              Constants.images.robot
            ),
            width: 100,
          ),

          Image.asset(
            Constants.images.robot, 
            width: 100
          ),

          Image.network(
            "https://img-blog.csdnimg.cn/2019070207194522.png",
            width: 100,
          ),
          Image(
            image: NetworkImage("https://img-blog.csdnimg.cn/2019070207194522.png"),
          )
        ],
      ),
    );
  }
}