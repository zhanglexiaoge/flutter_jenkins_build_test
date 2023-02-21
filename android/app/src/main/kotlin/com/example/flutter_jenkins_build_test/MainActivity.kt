package com.example.flutter_jenkins_build_test

import androidx.annotation.NonNull;
import com.example.flutter_jenkins_build_test.nativeViewCustoms.CustomNativeViewPlugin
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine( flutterEngine: FlutterEngine) {

        GeneratedPluginRegistrant.registerWith(flutterEngine)
        val registry = flutterEngine.platformViewsController.registry
        registry.registerViewFactory("App_Native_View", AndroidNativeViewFactory())
        flutterEngine.plugins.add(CustomNativeViewPlugin(flutterEngine))
    }

}


