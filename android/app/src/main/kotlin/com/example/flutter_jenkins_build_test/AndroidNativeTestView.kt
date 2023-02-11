package com.example.flutter_jenkins_build_test

import android.content.Context
import android.view.View
import android.widget.TextView
import io.flutter.plugin.platform.PlatformView

class AndroidNativeTestView (context: Context) : PlatformView {
    val contentView: TextView = TextView(context)
    override fun getView(): View {
        return contentView
    }
    override fun dispose() {}
}