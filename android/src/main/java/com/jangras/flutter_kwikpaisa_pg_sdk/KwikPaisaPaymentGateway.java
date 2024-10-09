package com.jangras.flutter_kwikpaisa_pg_sdk;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class KwikPaisaPaymentGateway implements FlutterPlugin, MethodChannel.MethodCallHandler {
    // Called when the plugin is attached to the Flutter engine
    @Override
    public void onAttachedToEngine(FlutterPlugin.FlutterPluginBinding binding) {
        MethodChannel channel = new MethodChannel(binding.getBinaryMessenger(), "flutter_kwikpaisa_pg_sdk");
        channel.setMethodCallHandler(this);
    }

    // Handle method calls from Dart code
    @Override
    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
        // Implement your method call logic here
        result.success("This is a response from the native code");
    }

    // Called when the plugin is detached from the Flutter engine
    @Override
    public void onDetachedFromEngine(FlutterPlugin.FlutterPluginBinding binding) {
        // Cleanup when the plugin is detached
    }
}
