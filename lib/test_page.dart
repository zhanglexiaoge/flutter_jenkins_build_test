import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('TestPage'),
        ),
        body: Container(
          height: 200,
          color: Colors.white,
          child: const Placeholder(
            color: Colors.blue, // 设置占位符颜色 defalutBlue Grey 70
            strokeWidth: 5, //设置画笔宽度
            fallbackHeight: 200, //设置占位符宽度
            fallbackWidth: 200, //设置占位符高度
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    print('testPage dispose');
  }
}
