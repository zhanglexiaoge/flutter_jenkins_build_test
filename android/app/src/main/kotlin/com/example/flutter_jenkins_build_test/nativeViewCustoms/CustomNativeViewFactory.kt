package com.example.flutter_jenkins_build_test.nativeViewCustoms

import android.content.Context
import android.text.Editable
import com.example.flutter_jenkins_build_test.AndroidNativeTestView
import com.example.flutter_jenkins_build_test.R
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class CustomNativeViewFactory(val messenger: BinaryMessenger) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {

    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {

        val creationParams = args as Map<String?, Any?>?
        val customnativeView = CustomnativeView(context, messenger, viewId, creationParams)






        return customnativeView
    }



}
