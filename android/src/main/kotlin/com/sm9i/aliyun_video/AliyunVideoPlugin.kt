package com.sm9i.aliyun_video

import android.app.Activity
import android.content.Context
import android.content.Intent
import com.aliyun.common.global.Version
import com.sm9i.aliyun_video.aliyun.activity.AlivcSvideoRecordActivity
import com.sm9i.aliyun_video.aliyun.bean.AlivcRecordInputParam
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugin.common.PluginRegistry.Registrar

class AliyunVideoPlugin(private val context: Context, private val activity: Activity, private val res: PluginRegistry.ActivityResultListener) : MethodCallHandler {

    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), "aliyun_video")
            dp("Version  Info")
            dp("Version.MODULE=====${Version.VERSION}")
            dp("Version.MODULE=====${Version.MODULE}")
            dp("Version.MODULE=====${Version.BUILD_ID}")
            dp("Version.MODULE=====${Version.SRC_COMMIT_ID}")
            dp("Version.MODULE=====${Version.ALIVC_COMMIT_ID}")
            dp("Version.MODULE=====${Version.ANDROID_COMMIT_ID}")
            dp("Version.MODULE=====${Version.RACE_COMMIT_ID}")

            channel.setMethodCallHandler(AliyunVideoPlugin(registrar.context(), registrar.activity(), PluginRegistry.ActivityResultListener { req, resp, intent ->
                val a: Int = 2
                false
            }))
        }
    }


    override fun onMethodCall(call: MethodCall, result: Result) {
        when {
            call.method == "startVideo" -> startVideo(call, result)
            else -> result.notImplemented()
        }
    }

    private lateinit var result: Result

    private fun startVideo(call: MethodCall, result: Result) {
        this.result = result
        AlivcSvideoRecordActivity.startRecord(activity, AlivcRecordInputParam())
    }
}
