//
//  iOSNativeViewFactory.swift
//  Runner
//
//  Created by zhangle on 2023/2/11.
//

import UIKit
import Foundation
import Flutter

class iOSNativeViewFactory: NSObject,FlutterPlatformViewFactory {
    
    var messemger:FlutterBinaryMessenger?
        
        override init() {
            super.init()
        }
    
    func setBinaryMessage(messemger:FlutterBinaryMessenger) {

       self.messemger = messemger;
           
       }

       func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
           return iOSNativeView(_frame: frame,viewId: viewId,args: args,messenger: self.messemger!) as FlutterPlatformView
          }
          
          func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
              return FlutterStandardMessageCodec.sharedInstance()
          }

}
