import 'package:flutter/services.dart';

class PlatformChannelHandler {
  /*static final PlatformChannelHandler _instance =
      PlatformChannelHandler._init();

  static PlatformChannelHandler get instance => _instance;

  PlatformChannelHandler._init();

  static const platform = MethodChannel('sampleChannel');*/

  static const platform = const MethodChannel('sampleChannel');
  Future<String> getTotp() async {
    var totp = "";
    try {
      totp = await platform.invokeMethod('test');
    } on PlatformException catch (e) {}
    return totp;
  }
}
