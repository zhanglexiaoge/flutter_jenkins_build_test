import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_jenkins_build_test/AppBaseScene/app_base_scene.dart';

void main() async {
  /// 初始化  我所知，插件需要特定于平台的通道，因为WidgetsFlutterBinding.ensureInitialized（）被放置在flutter应用的main（）函数中
  WidgetsFlutterBinding.ensureInitialized();

  if (kDebugMode) {
    runApp(AppBaseScene());
  } else {
    runApp(AppBaseScene());
  }
}
