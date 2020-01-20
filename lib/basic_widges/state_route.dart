
import 'package:flutter/material.dart';

class StatePage extends StatefulWidget {
  @override
  _StatePageState createState() => _StatePageState();
}

class _StatePageState extends State <StatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scaffold"),
      ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TapBoxA(),
            TapBoxBParent(),
            TapBoxCParent()
          ],
        ),
      )
    );
  }
}




////////////////////////////////////////////////////////////////////////////////////////////

/// 作为一个有状态的widget，自己管理和更新自己的状态
class TapBoxA extends StatefulWidget {
  TapBoxA({
    Key key
  }) : super(key: key);

  @override
  _TapBoxAState createState() => _TapBoxAState();
}

class _TapBoxAState extends State<TapBoxA> {

  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            _active ? "Active" : "Inactive",
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600]
        ),
      ),
    );
  }
}



////////////////////////////////////////////////////////////////////////////////////////////

/// 将状态管理、更新放到父widget中
class TapBoxBParent extends StatefulWidget {
  @override
  _TapBoxBParentState createState() => _TapBoxBParentState();
}
class _TapBoxBParentState extends State<TapBoxBParent> {
  bool _active = false;

  void _handleTapBoxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapBoxB(
        active: _active, 
        onChanged: _handleTapBoxChanged
      ),
    );
  }
}

class TapBoxB extends StatelessWidget {

  TapBoxB({
    Key key,
    this.active = false,
    @required this.onChanged
  }) : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!active),
      child:  Container(
        child: Center(
          child: Text(
            active ? "Active" : "Inactive",
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600]
        ),
      )
    );
  }
}



////////////////////////////////////////////////////////////////////////////////////////////



/// 混合管理状态
class TapBoxCParent extends StatefulWidget {
  @override
  _TapBoxCParentState createState() => _TapBoxCParentState();
}
class _TapBoxCParentState extends State<TapBoxCParent> {

  bool _active = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapBoxC(
        active: _active, 
        onChanged: (bool newValue) => setState(() => _active = newValue)
      ),
    );
  }  
}

class TapBoxC extends StatefulWidget {
  TapBoxC({
    Key key,
    this.active = false,
    @required this.onChanged
  }) : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  _TapBoxCState createState() => _TapBoxCState();
}
class _TapBoxCState extends State<TapBoxC> {
  bool _highlighted = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => setState(() => _highlighted = true),
      onTapUp: (details) => setState(() => _highlighted = false),
      onTapCancel: () => setState(() => _highlighted =false),
      onTap: () => widget.onChanged(!widget.active),
      child: Container(
        child: Center(
          child: Text(
            widget.active ? "Active" : "Inactive",
            style: TextStyle(
              fontSize: 32,
              color: Colors.white
            ),
          ),
        ),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlighted ? Border.all(
            color: Colors.teal[700],
            width: 10
          ) : null,
        ),
      ),
    );
  }
}
