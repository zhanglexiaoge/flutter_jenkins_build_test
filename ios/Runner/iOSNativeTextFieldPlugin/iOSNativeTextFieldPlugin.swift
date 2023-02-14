//
//  iOSNativeTextFieldPlugin.swift
//  Runner
//
//  Created by zhangle on 2023/2/13.
//

import UIKit
import Flutter
let notificationName_iOSNativeTextFieldChange = "NotificationName_iOSNativeTextFieldChange";
class iOSNativeTextFieldPlugin: NSObject , FlutterPlugin, FlutterStreamHandler{
    

    static var shared: iOSNativeTextFieldPlugin!
    ///flutter 向原生传值
    static var channel: FlutterMethodChannel!
    
    
    ///原生向flutter 传值
    var eventSink: FlutterEventSink?
    
    static var channel_event: FlutterEventChannel!
    
   
       
    
    init(messenger: FlutterBinaryMessenger) {
        super.init()
        iOSNativeTextFieldPlugin.channel_event = FlutterEventChannel(name: NativeToFlutterValue, binaryMessenger: messenger)
        iOSNativeTextFieldPlugin.channel_event.setStreamHandler(self)
        }
   ///类
    static func register(with registrar: FlutterPluginRegistrar ) {
         channel = FlutterMethodChannel(name: iOSNativeTextFieldPluginChannel, binaryMessenger: registrar.messenger())
        let instance = iOSNativeTextFieldPlugin.init(messenger: registrar.messenger())
        registrar.addMethodCallDelegate(instance, channel: channel)
        iOSNativeTextFieldPlugin.shared = instance
        
        #if DEBUG
       
        #endif
        
        
        
       

    }
    
    
    
    ///Flutter 调原生
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
           if call.method == ToiOSNativeTextFieldPluginParam {
               guard let dict = call.arguments as? Dictionary<String, Any> else {
                   return
               }
               let key1 = dict["key"] as! String
               let buttonName = dict["button"] as! String
               print(key1)
               print(buttonName)
               
               NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: notificationName_iOSNativeTextFieldChange),
                                               object: nil,
                                               userInfo:  dict)
               
               result("传值成功")
              
           }
       }
    
    ///原生向flutter 发送数据
    @objc public func nativeToFlutter(arguments args: Any?){
        
        if((self.eventSink) != nil) {
            self.eventSink!(args);
        }
       
        
    }
    
    /// 这个onListen是Flutter端开始监听这个channel时的回调，第二个参数 EventSink是用来传数据的载体。
    public func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        self.eventSink = events;

        return nil
    }
    
    /// flutter不再接收
    public func onCancel(withArguments arguments: Any?) -> FlutterError? {
        self.eventSink = nil
        return nil
    }
    
    
}

