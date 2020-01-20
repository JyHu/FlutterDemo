

import 'package:flutter/material.dart';

class ButtonWidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Button Widgets"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("Raised Button"),
            onPressed: () => print("Raised raised button"),
          ),

          FlatButton(
            child: Text("Flat Button"),
            onPressed: () => print("Pressed flat button"),
          ),

          IconButton(
            icon: Icon(
              Icons.thumb_up,
            ),
            onPressed: () => print("Pressed icon button"),
          ),

          RaisedButton.icon(
            icon: Icon(Icons.send),
            label: Text("Send"),
            onPressed: () => print("Pressed iconed raised button"),
          ),

          OutlineButton.icon(
            icon: Icon(Icons.add),
            label: Text("Add"),
            onPressed: () => print("Pressed iconed outline button"),
          ),

          FlatButton.icon(
            icon: Icon(Icons.info),
            label: Text("Info"),
            onPressed: () => print("Pressed iconed flat button"),
          ),

          FlatButton(
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("Customized Flat Button"),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: () => print("Pressed customized button"),
          )
        ],
      ),
    );
  }
}