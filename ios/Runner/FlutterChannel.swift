//
//  FlutterChannel.swift
//  Runner
//
//  Created by zhangle on 2023/2/11.
//

/** iOS主插件名  获取flutter 引擎*/
let flutterMethodChannel: String = "flutter_native_ios"

/** flutter 使用iOS 原生View */
let appNativeView: String = "App_Native_View"

///插件名
let iOSNativeTextFieldPluginChannel: String = "iOS_Native_TextField_Plugin"
///展示 iOSNativeTextFieldView 的标识
let iOSNativeTextFieldViewId: String = "iOS_Native_TextField_ViewId"

///原生向flutter 传值
let NativeToFlutterValue: String = "Native_toFlutterValue"

//flutter 向iOS_Native_TextField_Plugin 传值Channel Name
let ToiOSNativeTextFieldPluginParam: String =
    "to_iOS_Native_TextField_Plugin_param"
