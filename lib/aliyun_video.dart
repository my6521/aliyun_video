import 'dart:async';

import 'package:flutter/services.dart';

class AliyunVideo {
  static const MethodChannel _channel = const MethodChannel('aliyun_video');

  static Future startVideo() async {
    final String res = await _channel.invokeMethod('startVideo');
    return res;
  }
}
