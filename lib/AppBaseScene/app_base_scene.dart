import 'package:flutter/material.dart';
import 'package:flutter_jenkins_build_test/HomePage/myhome_page.dart';
import 'package:flutter_jenkins_build_test/Route/routeob_server_obs.dart';

class AppBaseScene extends StatefulWidget {
  const AppBaseScene({Key? key}) : super(key: key);

  @override
  State<AppBaseScene> createState() => _AppBaseSceneState();
}

class _AppBaseSceneState extends State<AppBaseScene>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance?.addObserver(this);

    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.inactive:
        // 应用状态处于闲置状态，并且没有用户的输入事件，
        // 注意：这个状态切换到 前后台 会触发，所以流程应该是先冻结窗口，然后停止UI
        break;
      case AppLifecycleState.resumed:
        // 进入应用时候不会触发该状态 应用程序处于可见状态，并且可以响应用户的输入事件。它相当于 Android 中Activity的onResume
        // 进入前台

        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        //当前页面即将退出
        break;
      default:
    }
  }

  @override
  void dispose() {
    super.dispose();

    WidgetsBinding.instance?.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorObservers: [RouteObServerObs<PageRoute>()],
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
