
import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/constants.dart';

class ArgumentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Params Flow"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: () async => print(await Navigator.pushNamed(context, Constants.routes.tipsPage, arguments: "Param from Arugment Page")),
              child: Text("Turn To Tips Page"),
            )
          ],
        ),
      ),
    );
  }
}