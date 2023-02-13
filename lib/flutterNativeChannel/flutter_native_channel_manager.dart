import 'package:flutter/services.dart';

class ChannelName {
  ///主channel 主要iOS 使用
  static String flutterChannelName = "flutter_native_ios";

  static String flutterTestChannelName = "flutter_test_native";

  /// toNaiveParam  flutter 像原生传值交互方法
  static String toNaiveParam = "to_naive_param";

  // ///插件名 iOS_Native_TextField_Plugin
  // static String iOSNativeTextFieldPluginChannel = "iOS_Native_TextField_Plugin";
}

///可以注册多个

const _flutterNativeMethodChannel = MethodChannel("flutter_native_ios");

const _flutterTestNativeMethodChannel = MethodChannel("flutter_test_native");

// ///插件名 iOS_Native_TextField_Plugin
// const _iOSNativeTextFieldPluginMethodChannel =
//     MethodChannel("iOS_Native_TextField_Plugin");

class ChannelManager {
  ///设置channel·
  static ChannelManager setUp() {
    var i = ChannelManager();
    _flutterNativeMethodChannel.setMethodCallHandler(i._nativeHandler);
    _flutterTestNativeMethodChannel.setMethodCallHandler(i._nativeHandler);
    // _iOSNativeTextFieldPluginMethodChannel
    //     .setMethodCallHandler(i._nativeHandler);

    return i;
  }

  static ChannelManager? _instance;
  static ChannelManager get instance {
    _instance ??= setUp();
    return _instance!;
  }

  ///  Flutter 向 原生中 发送消息 的方法封装
  /// [method] 为方法标识 交互方法名
  /// [arguments] 为参数
  /// [methodChannelStr] 交互通道名
  Future<dynamic> toNative(String method,
      {Map? arguments, String? methodChannelStr}) async {
    late MethodChannel methodChannel;
    if (methodChannelStr == ChannelName.flutterChannelName) {
      methodChannel = _flutterNativeMethodChannel;
    } else if (methodChannelStr == ChannelName.flutterTestChannelName) {
      methodChannel = _flutterTestNativeMethodChannel;
    }

    // else if (methodChannelStr ==
    //     ChannelName.iOSNativeTextFieldPluginChannel) {
    //   methodChannel = _iOSNativeTextFieldPluginMethodChannel;
    // }
    var result =
        await methodChannel.invokeMethod(method, arguments).catchError((error) {
      print(error.toString());
    });
    print(result);
    return result;
  }

  /// 收到原生调用 [handler] 回调
  Future<dynamic> _nativeHandler(MethodCall handler) async {
    // if (nativeReturn.containsKey(handler.method)) {
    //   return nativeReturn[handler.method]!(handler.arguments);
    // }
    return null;
  }
}
