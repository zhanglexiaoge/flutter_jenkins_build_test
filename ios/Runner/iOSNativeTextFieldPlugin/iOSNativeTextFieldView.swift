//
//  iOSNativeTextFieldView.swift
//  Runner
//
//  Created by zhangle on 2023/2/13.
//

import UIKit
import SnapKit

class iOSNativeTextFieldView: NSObject,FlutterPlatformView  {
    let viewT = UIView()
    let textField = UITextField()
    let button = UIButton()
    

    var methodChannel: FlutterMethodChannel!
    
    //自定义初始化 init
     init(_frame:CGRect,viewId:Int64 ,args :Any?,messenger :FlutterBinaryMessenger) {
        
        super.init()
         
         
         //设置边框样式为圆角矩形
         textField.borderStyle = UITextField.BorderStyle.roundedRect
       

         //修改圆角半径的话需要将masksToBounds设为true
         textField.layer.masksToBounds = true
         textField.layer.cornerRadius = 12.0  //圆角半径
         textField.layer.borderWidth = 2.0  //边框粗细
         textField.layer.borderColor = UIColor.red.cgColor //边框颜色
         viewT.addSubview(textField)
         viewT.addSubview(button)
         textField.snp.makeConstraints { make in
             make.centerX.equalToSuperview()
             make.left.equalTo(30)
             make.height.equalTo(44)
             make.top.equalTo(0)
              
         }
         
         
         button.setTitle("原生向flutter传值", for: .normal)
         button.setTitleColor(.red, for: .normal)
         button.snp.makeConstraints { make in
             make.centerX.equalToSuperview()
             make.left.equalTo(30)
             make.height.equalTo(44)
             make.top.equalTo(44)
         }
         
         
        
        ///flutter 传过来的值  {"text": "Android Text View"},
        if(args is NSDictionary){
            let dict = args as! NSDictionary
            self.textField.text = dict.value(forKey: "text") as? String
        }else {
            self.textField.text = ""
        }
  
         
         
    }
    
    
    
    func view() -> UIView {
               return viewT
           }
}
