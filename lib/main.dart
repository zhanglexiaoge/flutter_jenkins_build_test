import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_jenkins_build_test/flutterNativeChannel/flutter_native_channel_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  String? nativeToFlutter;

  String buttonName = "Flutter To 原生View iOS_Native_TextField_ViewId";
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

//开始监听
  @override
  void initState() {
    super.initState();
    EventChannel _eventChannel = EventChannel(
        ChannelName.NativeToFlutterValue, const StandardMethodCodec());
    _eventChannel
        .receiveBroadcastStream("init")
        .listen(_onEvent, onError: _onError);
  }

  // 数据接收
  void _onEvent(var value) {
    print(value);
    nativeToFlutter = (value ?? '').toString();
    setState(() {});
  }

// 错误处理
  void _onError(dynamic) {}

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Platform.isIOS
                  ? Container(
                      child: const UiKitView(
                      viewType: 'iOS_Native_TextField_ViewId',
                      creationParams: <String, dynamic>{
                        "text": "iOS_Native_TextFieldview"
                      },
                      creationParamsCodec: StandardMessageCodec(),
                      //onPlatformViewCreated: _onPlatformViewCreated, //原生视图创建成功的回调
                    ))
                  : SizedBox(
                      height: 20,
                    ),
            ),
            (nativeToFlutter ?? '').isNotEmpty
                ? Text(nativeToFlutter!)
                : SizedBox(),
            TextButton(
              child: Text(buttonName),
              onPressed: () async {
                ///并接收回调结果
                var result = await ChannelManager.instance.toNative(
                    ChannelName.toiOSNativeTextFieldPluginParam,
                    methodChannelStr:
                        ChannelName.iOSNativeTextFieldPluginChannel,
                    arguments: {
                      'key': 'Flutter To toiOSNativeTextFieldPluginParam Value',
                      "button": "button Name"
                    });
                buttonName = result.toString();
                setState(() {});
              },
            ),
            Platform.isIOS
                ? Container(
                    height: 50,
                    child: const UiKitView(
                      viewType: 'App_Native_View',
                      creationParams: <String, dynamic>{
                        "text": "iOS Native View"
                      },
                      creationParamsCodec: StandardMessageCodec(),
                      //onPlatformViewCreated: _onPlatformViewCreated, //原生视图创建成功的回调
                    ))
                : Container(
                    height: 50,
                    child: const AndroidView(
                      //和你注册的名字一致
                      viewType: "App_Native_View",
                      creationParams: <String, dynamic>{
                        "text": "Android Native View"
                      },
                      creationParamsCodec: StandardMessageCodec(),
                    ),
                  ),
            TextButton(
              child: Text('Flutter传递参数给原生View'),
              onPressed: () async {
                print('111111111');

                ///并接收回调结果
                var result = await ChannelManager.instance.toNative(
                    ChannelName.toNaiveParam,
                    methodChannelStr: ChannelName.flutterChannelName,
                    arguments: {'key': 'Flutter To Native Value'});

                print('Flutter To Native Callback === ' + result.toString());
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
