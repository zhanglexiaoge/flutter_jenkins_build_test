import UIKit
import Flutter


//启动图尺寸：
//
//选 640x1136、750x1334、1242x2688、分别加入1x、2x、3x里
//
//第一个是图片的名字，LaunchScreen 第二个是填充方式 Aspect fill

//logo尺寸
//
//40x40    60x60  58x58  87x87    80x80  120x120  180x180  1024x1024

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    
      let registrar:FlutterPluginRegistrar = self.registrar(forPlugin:flutterMethodChannel)!
          let factory = iOSNativeViewFactory.init()
          factory.setBinaryMessage(messemger: registrar.messenger())
      ///注册 FlutterViewFactory
          registrar.register(factory, withId: appNativeView)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
