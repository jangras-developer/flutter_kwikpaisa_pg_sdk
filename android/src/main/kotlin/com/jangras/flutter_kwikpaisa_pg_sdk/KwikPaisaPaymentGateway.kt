package com.jangras.flutter_kwikpaisa_pg_sdk

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class KwikPaisaPaymentGateway : FlutterPlugin, MethodChannel.MethodCallHandler {
    // Called when the plugin is attached to the Flutter engine
    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        val channel = MethodChannel(binding.binaryMessenger, "flutter_kwikpaisa_pg_sdk")
        channel.setMethodCallHandler(this)
    }

    // Handle method calls from Dart code
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        // Implement your method call logic here
        result.success("This is a response from the native code")
    }

    // Called when the plugin is detached from the Flutter engine
    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        // Cleanup when the plugin is detached
    }
}
