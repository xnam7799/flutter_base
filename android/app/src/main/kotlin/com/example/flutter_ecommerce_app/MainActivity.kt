package com.example.flutter_ecommerce_app

import android.content.Context
import android.content.res.Configuration
import android.os.Build
import android.os.Environment
import android.os.StatFs
import android.util.DisplayMetrics
import androidx.annotation.RequiresApi
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.io.File

class MainActivity : FlutterActivity() {
    companion object {
        private const val CHANNEL = "native-channel"
        private const val METHOD_GET_FLAVOR = "GET_FLAVOR"
        private const val METHOD_LISTEN_ON_FOCUS_CHANGE = "ANDROID_ON_WINDOW_FOCUS_CHANGE"

    }

    private lateinit var channel: MethodChannel

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
        channel.setMethodCallHandler { methodCall: MethodCall, result: MethodChannel.Result ->
            if (methodCall.method == METHOD_GET_FLAVOR) {
                result.success(BuildConfig.FLAVOR)
            } else {
                result.notImplemented()
            }
        }
    }

    override fun onWindowFocusChanged(hasFocus: Boolean) {
        super.onWindowFocusChanged(hasFocus)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            val args: HashMap<String, Any> = HashMap()
            args.put("hasFocus", hasFocus);
            channel.invokeMethod(METHOD_LISTEN_ON_FOCUS_CHANGE, args)
        }
    }

    override fun attachBaseContext(baseContext: Context) {
        val newContext: Context

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            val displayMetrics: DisplayMetrics = baseContext.resources.displayMetrics
            val configuration: Configuration = baseContext.resources.configuration
            if (displayMetrics.densityDpi != DisplayMetrics.DENSITY_DEVICE_STABLE) {
                // Current density is different from Default Density. Override it
                configuration.densityDpi = DisplayMetrics.DENSITY_DEVICE_STABLE
                newContext = baseContext.createConfigurationContext(configuration)
            } else {
                // Same density. Just use same context
                newContext = baseContext
            }
        } else {
            // Old API. Screen zoom not supported
            newContext = baseContext
        }
        super.attachBaseContext(newContext)
    }
}
