package com.whitehax.phishSim


import io.flutter.plugins.GeneratedPluginRegistrant
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private  final var CHANNEL = "sampleChannel"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            when {
                call.method.equals("test") -> {
                    result.success(JavaUtil.getOtp())
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }

    
//    protected void onCreate(Bundle savedInstanceState) {
//        super.onCreate(savedInstanceState);
//        GeneratedPluginRegistrant.registerWith( FlutterEngine(this));
//        MethodChannel channel = new MethodChannel(getFlutterEngine().getDartExecutor().getBinaryMessenger(), CHANNEL);
//
//        channel.setMethodCallHandler( MethodChannel.MethodCallHandler() {
//            @Override
//            public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
//                when {
//                    methodCall.method.equals("test") -> {
//                        return 123456
//                    }
//                    methodCall.method.equals("getTotp") -> {
//                        return JavaUtil.getOtp()
//                    }
//                    else -> {
//                        result.notImplemented();
//                    }
//                }
//            }
//        });
//    }
}