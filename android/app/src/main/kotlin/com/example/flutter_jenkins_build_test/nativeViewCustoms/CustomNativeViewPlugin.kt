package com.example.flutter_jenkins_build_test.nativeViewCustoms

import android.content.Context
import android.widget.Toast
import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.*
import io.flutter.plugin.common.EventChannel.StreamHandler
import io.flutter.plugin.platform.PlatformViewRegistry

class CustomNativeViewPlugin(val flutterEngine: FlutterEngine) :  MethodChannel.MethodCallHandler,FlutterPlugin,
    StreamHandler {
    ///插件Channel名字 iOS_Native_TextField_Plugin
    val channel_name = "iOS_Native_TextField_Plugin"

    private lateinit var platformViewRegistry: PlatformViewRegistry
    ///属性 - 0.1  ///flutter 向原生传值
    private lateinit var methodChannel: MethodChannel

    ///原生向flutter 传值


    private lateinit var eventSink: EventChannel.EventSink

    private lateinit var channel_event: EventChannel


    ///新入口 - 开始 0.2
    override fun onAttachedToEngine(@NonNull binding:FlutterPlugin.FlutterPluginBinding) {

        channel_event = EventChannel( binding.binaryMessenger,"Native_toFlutterValue", )
        channel_event.setStreamHandler(this)

        methodChannel = MethodChannel(binding.binaryMessenger, channel_name)
        methodChannel!!.setMethodCallHandler(this)
        platformViewRegistry = binding.platformViewRegistry

        /// 要显示原生ViewChannel "iOS_Native_TextField_ViewId
        platformViewRegistry.registerViewFactory(
            "iOS_Native_TextField_ViewId",
            CustomNativeViewFactory(binding.binaryMessenger)
        )



    }


    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        eventSink = events!!
    }

    override fun onCancel(arguments: Any?) {
    }

    fun removeStreamHandler() {
        channel_event.setStreamHandler(null)
    }



    ///出口 - 结束
    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        methodChannel.setMethodCallHandler(null)

    }

    ///flutter->Android
    override fun onMethodCall(@NonNull methodCall: MethodCall, @NonNull result: MethodChannel.Result) {
        ///Flutter 调原生
        when (methodCall.method) {
            "to_iOS_Native_TextField_Plugin_param" -> {
//                Toast.makeText(applicationContext, methodCall.argument("data") ?: "", Toast.LENGTH_SHORT).show()
            }


        }
    }
}







