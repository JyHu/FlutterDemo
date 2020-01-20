
import 'package:flutter/material.dart';


/// StatelessWidget用于不需要维护状态的场景，
/// 它通常在build方法中通过嵌套其它Widget来构建UI，
/// 在构建过程中会递归的构建其嵌套的Widget。

class StateXPage extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Context Text"),
      ),
      body: Container(
        child: Builder(builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              (context.findAncestorWidgetOfExactType<Scaffold>().appBar as AppBar).title,
              CounterWidget()
            ],
          );
        }),
      ),
    );
  }
}


///////////////////////////////////////////////////////////////////////////////////////////////


class CounterWidget extends StatefulWidget {
  const CounterWidget({
    Key key,
    this.initValue = 0
  });

  final int initValue;

  /// 用于创建和Stateful widget相关的状态，它在Stateful widget的生命周期中可能会被多次调用。
  /// 例如，当一个Stateful widget同时插入到widget树的多个位置时，Flutter framework就会调用
  /// 该方法为每一个位置生成一个独立的State实例，其实，本质上就是一个StatefulElement对应一个State实例
  @override
  _CounterWidget createState() => _CounterWidget();
}


/// 一个StatefulWidget类会对应一个State类，State表示与其对应的StatefulWidget要维护的状态，State中的保存的状态信息可以：
/// 
/// 在widget 构建时可以被同步读取。
/// 在widget生命周期中可以被改变，当State被改变时，可以手动调用其setState()方法通知Flutter framework状态发生改变，
/// Flutter framework在收到消息后，会重新调用其build方法重新构建widget树，从而达到更新UI的目的。
/// 
/// State中有两个常用属性：
///   - widget，它表示与该State实例关联的widget实例，由Flutter framework动态设置。
///     注意，这种关联并非永久的，因为在应用生命周期中，UI树上的某一个节点的widget实例
///     在重新构建时可能会变化，但State实例只会在第一次插入到树中时被创建，当在重新构建
///     时，如果widget被修改了，Flutter framework会动态设置State.widget为新的widget实例。
///   - context。StatefulWidget对应的BuildContext，作用同StatelessWidget的BuildContext。



class _CounterWidget extends State<CounterWidget> {

  int _counter;

  @override
  void initState() {
    super.initState();
    _counter = widget.initValue;
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return FlatButton(
      child: Text("$_counter"),
      onPressed: (){
        setState(() => _counter ++);



        /// 由于StatefulWidget的的具体逻辑都在其State中，所以很多时候，
        /// 我们需要获取StatefulWidget对应的State对象来调用一些方法，
        /// 比如Scaffold组件对应的状态类ScaffoldState中就定义了打开
        /// SnackBar(路由页底部提示条)的方法。我们有两种方法在子widget
        /// 树中获取父级StatefulWidget的State对象。
        /// 
        /// context对象有一个findAncestorStateOfType方法，该方法可以
        /// 从当前节点沿着widget树向上查找指定类型的StatefulWidget对应的State对象。
        ScaffoldState _state = context.findAncestorStateOfType<ScaffoldState>();

        /// 一般来说，如果StatefulWidget的状态是私有的（不应该向外部暴露），那么我们代码中就不应
        /// 该去直接获取其State对象；如果StatefulWidget的状态是希望暴露出的（通常还有一些组件的
        /// 操作方法），我们则可以去直接获取其State对象。但是通过context.findAncestorStateOfType获
        /// 取StatefulWidget的状态的方法是通用的，我们并不能在语法层面指定StatefulWidget的状态
        /// 是否私有，所以在Flutter开发中便有了一个默认的约定：如果StatefulWidget的状态是希望暴
        /// 露出的，应当在StatefulWidget中提供一个of静态方法来获取其State对象，开发者便可直接通
        /// 过该方法来获取；如果State不希望暴露，则不提供of方法。这个约定在Flutter SDK里随处可见。
        /// 所以，上面示例中的Scaffold也提供了一个of方法，我们其实是可以直接调用它的
        /// Scaffold.of(context);
        _state.showSnackBar(
          SnackBar(
            content: Text("我是snackbar"),
          )
        );
      },
    );
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}




/// initState：当Widget第一次插入到Widget树时会被调用，对于每一个State对象，Flutter framework只会调用一次该回调，
/// 所以，通常在该回调中做一些一次性的操作，如状态初始化、订阅子树的事件通知等。
/// 不能在该回调中调用BuildContext.inheritFromWidgetOfExactType（该方法用于在Widget树上获取离当前widget最近的
/// 一个父级InheritFromWidget，关于InheritedWidget我们将在后面章节介绍），
/// 原因是在初始化完成后，Widget树中的InheritFromWidget也可能会发生变化，
/// 所以正确的做法应该在在build（）方法或didChangeDependencies()中调用它。
/// 
/// 
/// didChangeDependencies()：当State对象的依赖发生变化时会被调用；
/// 例如：在之前build() 中包含了一个InheritedWidget，然后在之后的build() 中InheritedWidget发生了变化，
/// 那么此时InheritedWidget的子widget的didChangeDependencies()回调都会被调用。
/// 典型的场景是当系统语言Locale或应用主题改变时，Flutter framework会通知widget调用此回调。
/// 
/// 
/// build()：此回调读者现在应该已经相当熟悉了，它主要是用于构建Widget子树的，会在如下场景被调用：
///   - 在调用initState()之后。 
///   - 在调用didUpdateWidget()之后。
///   - 在调用setState()之后。
///   - 在调用didChangeDependencies()之后。
///   - 在State对象从树中一个位置移除后（会调用deactivate）又重新插入到树的其它位置之后。
/// 
/// 
/// reassemble()：此回调是专门为了开发调试而提供的，在热重载(hot reload)时会被调用，此回调在Release模式下永远不会被调用。
/// 
/// 
/// didUpdateWidget()：在widget重新构建时，Flutter framework会调用Widget.canUpdate来检测Widget树中同一位置的新旧节点，
/// 然后决定是否需要更新，如果Widget.canUpdate返回true则会调用此回调。
/// 正如之前所述，Widget.canUpdate会在新旧widget的key和runtimeType同时相等时会返回true，
/// 也就是说在在新旧widget的key和runtimeType同时相等时didUpdateWidget()就会被调用。
/// 
/// 
/// deactivate()：当State对象从树中被移除时，会调用此回调。在一些场景下，Flutter framework会将State对象重新插到树中，
/// 如包含此State对象的子树在树的一个位置移动到另一个位置时（可以通过GlobalKey来实现）。
/// 如果移除后没有重新插入到树中则紧接着会调用dispose()方法。
/// 
/// 
/// dispose()：当State对象从树中被永久移除时调用；通常在此回调中释放资源。
/// 





/**
 *      Stateful Widget lanuched
 *                 |
 *                 ↓     
 *             initState
 *                 |
 *                 ↓
 *       didChangeDependencies
 *                 |
 *                 |----------- didUpdateWidget <----
 *                 |                   ↑            |
 *                 |                   |            |
 *                 |               reassemble       | NO
 *                 |                   ↑            |
 *                 ↓                   |yes         |
 *               build ----------> hot reload? -----|
 *                 |
 *                 ↓
 *            deactivate
 *                 |
 *                 ↓
 *              dispose
 *                 |
 *                 |
 *                 ↓
 *      StatefulWidget destroyed
 */