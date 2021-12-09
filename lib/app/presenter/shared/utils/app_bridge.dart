import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBridge {
  static const _platform = MethodChannel("com.example.methodchannel/method");
  static Future<void> openVr() async {
    try {
      await _platform.invokeMethod('Method1');
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }
}
