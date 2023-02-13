//
//  iOSNativeTextFieldPlugin.swift
//  Runner
//
//  Created by zhangle on 2023/2/13.
//

import UIKit
import Flutter

class iOSNativeTextFieldPlugin: NSObject , FlutterPlugin{

    static var shared: iOSNativeTextFieldPlugin!
    static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: iOSNativeTextFieldPluginChannel, binaryMessenger: registrar.messenger())
        let instance = iOSNativeTextFieldPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
        iOSNativeTextFieldPlugin.shared = instance
        
        #if DEBUG
       
        #endif

    }
}
