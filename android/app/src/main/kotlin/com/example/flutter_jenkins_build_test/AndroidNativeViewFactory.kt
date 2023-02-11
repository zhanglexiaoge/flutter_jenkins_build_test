package com.example.flutter_jenkins_build_test

import android.app.Activity
import android.content.Context
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class AndroidNativeViewFactory : PlatformViewFactory(StandardMessageCodec.INSTANCE){
    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
        val androidTextView = AndroidNativeTestView(context)
        androidTextView.contentView.id = viewId
        val params = args?.let { args as Map<*, *> }
        val text = params?.get("text") as CharSequence?
        text?.let {
            androidTextView.contentView.text = it
        }
        return androidTextView
    }
}