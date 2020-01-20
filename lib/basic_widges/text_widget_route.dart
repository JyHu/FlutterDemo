

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextWidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Widget"),
      ),
      body: Column(
        children: <Widget>[
          /// textAlign：文本的对齐方式；可以选择左对齐、右对齐还是居中。注意，对齐的参考系
          /// 是Text widget本身。本例中虽然是指定了居中对齐，但因为Text文本内容宽度不足一行，
          /// Text的宽度和文本内容长度相等，那么这时指定对齐方式是没有意义的，只有Text宽度大
          /// 于文本内容长度时指定此属性才有意义。
          Text(
            "Hello World",
            textAlign: TextAlign.left,
          ),
          Text(
            "Hello world" * 8,
            textAlign: TextAlign.center,
          ),


          /// maxLines、overflow：指定文本显示的最大行数，默认情况下，文本是自动折行的，如果
          /// 指定此参数，则文本最多不会超过指定的行。如果有多余的文本，可以通过overflow来指定
          /// 截断方式，默认是直接截断，本例中指定的截断方式TextOverflow.ellipsis，它会将多余
          /// 文本截断后以省略符“...”表示；TextOverflow的其它截断方式请参考SDK文档。
          Text(
            "Hello world! I'm Jack" * 4,
            maxLines: 1,
            overflow: TextOverflow.ellipsis
          ),


          /// textScaleFactor：代表文本相对于当前字体大小的缩放因子，相对于去设置文本的
          /// 样式style属性的fontSize，它是调整字体大小的一个快捷方式。该属性的默认值可以
          /// 通过MediaQueryData.textScaleFactor获得，如果没有MediaQuery，那么会默认值将为1.0。
          Text(
            "Hello world",
            textScaleFactor: 1.5,
          ),



          /// TextStyle用于指定文本显示的样式如颜色、字体、粗细、背景等。
          /// 
          /// height：该属性用于指定行高，但它并不是一个绝对值，而是一个因子，具体的行高等于fontSize*height。
          /// fontFamily ：由于不同平台默认支持的字体集不同，所以在手动指定字体时一定要先在不同平台测试一下。
          /// fontSize：该属性和Text的textScaleFactor都用于控制字体大小。但是有两个主要区别：
          ///   - fontSize可以精确指定字体大小，而textScaleFactor只能通过缩放比例来控制。
          ///   - textScaleFactor主要是用于系统字体大小设置改变时对Flutter应用字体进行全局调整，
          ///       而fontSize通常用于单个文本，字体大小不会跟随系统字体大小变化。
          Text(
            "Hello World",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18,
              height: 1.2,
              fontFamily: "Courier",
              background: Paint()..color = Colors.yellow,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.dashed
            ),
          ),



          /// const TextSpan({
          ///   TextStyle style, 
          ///   Sting text,
          ///   List<TextSpan> children,
          ///   GestureRecognizer recognizer,
          /// });
          /// 
          /// 其中style 和 text属性代表该文本片段的样式和内容。 children是一个TextSpan的数组，
          /// 也就是说TextSpan可以包括其他TextSpan。而recognizer用于对该文本片段上用于手势进行识别处理。
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "home: "
                ),
                TextSpan(
                  text: "https:flutterchina.club",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                  recognizer: TapGestureRecognizer(),
                )
              ]
            )
          ),



          /// 在Widget树中，文本的样式默认是可以被继承的（子类文本类组件未指定具体样式时可以使用Widget树中
          /// 父级设置的默认样式），因此，如果在Widget树的某一个节点处设置一个默认的文本样式，那么该节点的
          /// 子树中所有文本都会默认使用这个样式，而DefaultTextStyle正是用于设置默认文本样式的。
          DefaultTextStyle(
            // 1.设置文本默认样式 
            style: TextStyle(
              color: Colors.red,
              fontSize: 20
            ),
            textAlign: TextAlign.start,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("hello world"),
                Text("hello world"),
                Text(
                  "hello world",
                  style: TextStyle(
                    inherit: false, //2.不继承默认样式
                    color: Colors.grey
                  ),
                )
              ],
            ),
          ),



          ///
          Text(
            "Generate fonts",
            style: const TextStyle(
              fontFamily: "baozou"
            ), 
          )
        ],
      ),
    );
  }
}


