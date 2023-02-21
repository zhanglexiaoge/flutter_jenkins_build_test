package com.example.flutter_jenkins_build_test.nativeViewCustoms

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.inputmethod.EditorInfo
import android.widget.Button
import android.widget.EditText
import android.widget.TextView
import androidx.fragment.app.Fragment
import com.example.flutter_jenkins_build_test.R
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView


class CustomnativeView(context: Context, messenger: BinaryMessenger, id: Int?, val creationParams: Map<String?, Any?>?) :
    PlatformView{

    private var contentView: View = LayoutInflater.from(context).inflate(R.layout.customnativeview,null)

    val cEditText: EditText = contentView.findViewById(R.id.custom_native_view_editext)

    var cButton: Button = contentView.findViewById(R.id.custom_native_view_button)

    init {
        ///flutter 初始化原生View 传过来的值  {"text": "Android Text View"},

        //赋值
        cEditText.setText(creationParams!!["text"] as String)


//        cEditText.setInputType(EditorInfo.TYPE_TEXT_VARIATION_EMAIL_ADDRESS)
//        cEditText.setFocusable(true);
        //取值
//        String strSmsPhone=m_txtSmsPhone.getText().toString();

       ///原生向flutter 传值
        cButton.setOnClickListener {

        }


    }

    override fun getView(): View {
        return contentView
    }

    override fun dispose() {
    }




}


