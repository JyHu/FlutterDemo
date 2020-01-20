
import 'package:flutter/material.dart';

class CheckingWidgetPage extends StatefulWidget {
  @override
  _CheckingWidgetPageState createState() => _CheckingWidgetPageState();
}

class _CheckingWidgetPageState extends State<CheckingWidgetPage> {

  bool _switchSelected = true;
  bool _checkboxSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checking Widget Page"),
      ),
      body: Column(
        children: <Widget>[
          Switch(
            value: _switchSelected,
            onChanged: (value) => setState(() => _switchSelected = value)
          ),
          Checkbox(
            value: _checkboxSelected,
            activeColor: Colors.red,
            onChanged: (value) => setState(() => _checkboxSelected = value),
          )
        ],
      ),
    );
  }
}