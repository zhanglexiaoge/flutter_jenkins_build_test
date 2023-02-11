//
//  iOSNativeView.swift
//  Runner
//
//  Created by zhangle on 2023/2/11.
//

import Foundation
import Flutter

class iOSNativeView:  NSObject,FlutterPlatformView {
    
    let label = UILabel()
    
    //自定义初始化 init
     init(_frame:CGRect,viewId:Int64 ,args :Any?,messenger :FlutterBinaryMessenger) {
        
        super.init()
        
        ///flutter 传过来的值  {"text": "Android Text View"},
        if(args is NSDictionary){
            let dict = args as! NSDictionary
            self.label.text = dict.value(forKey: "text") as? String
        }else {
            self.label.text = "args no dict"
        }
  
    }
    
    func view() -> UIView {
               return label
           }  

}
