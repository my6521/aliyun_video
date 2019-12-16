import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class AliyunVideo {
  static const MethodChannel _channel = const MethodChannel('aliyun_video');

  //必须传一个文件路径
  static Future startVideo({
    //  @required String videoOutputPath,
    int mResolutionMode = AliyunDefaultConfig.DEFAULT_RESOLUTION_720P,
    int mMaxDuration = AliyunDefaultConfig.DEFAULT_VALUE_MAX_DURATION,
    int mMinDuration = AliyunDefaultConfig.DEFAULT_VALUE_MIN_DURATION,
    int mRatioMode = AliyunDefaultConfig.DEFAULT_RATIO_MODE_9_16,
    int mGop = AliyunDefaultConfig.DEFAULT_VALUE_GOP,
    int mFrame = AliyunDefaultConfig.DEFAULT_VALUE_FRAME,
    String mVideoQuality = AliyunDefaultConfig.DEFAULT_QUALITY_HD,
    String mVideoCodec = AliyunDefaultConfig.DEFAULT_CODECS_H264_HARDWARE,
  }) async {
    final String res = await _channel.invokeMethod('startVideo', {
      "mResolutionMode": mResolutionMode,
      "mMaxDuration": mMaxDuration,
      "mMinDuration": mMinDuration,
      "mRatioMode": mRatioMode,
      "mGop": mGop,
      "mFrame": mFrame,
      "mVideoQuality": mVideoQuality,
      "mVideoCodec": mVideoCodec,
      //  "videoOutputPath": videoOutputPath,
    });
    debugPrint('Response for Native :$res');
    return res;
  }
}

//config
class AliyunDefaultConfig {
  static const int DEFAULT_RESOLUTION_360P = 0;
  static const int DEFAULT_RESOLUTION_480P = 1;
  static const int DEFAULT_RESOLUTION_540P = 2;
  static const int DEFAULT_RESOLUTION_720P = 3;

  static const int DEFAULT_RATIO_MODE_3_4 = 0;
  static const int DEFAULT_RATIO_MODE_1_1 = 1;
  static const int DEFAULT_RATIO_MODE_9_16 = 2;

  static const int DEFAULT_VALUE_MAX_DURATION = 15 * 1000;
  static const int DEFAULT_VALUE_MIN_DURATION = 2 * 1000;
  static const int DEFAULT_VALUE_GOP = 250;
  static const int DEFAULT_VALUE_FRAME = 30;

  static const String DEFAULT_QUALITY_SSD = 'SSD';
  static const String DEFAULT_QUALITY_HD = 'HD';
  static const String DEFAULT_QUALITY_SD = 'SD';
  static const String DEFAULT_QUALITY_LD = 'LD';
  static const String DEFAULT_QUALITY_PD = 'PD';
  static const String DEFAULT_QUALITY_EPD = 'EPD';

  static const String DEFAULT_CODECS_H264_HARDWARE = 'H264_HARDWARE';
  static const String DEFAULT_CODECS_H264_H264_SOFT_OPENH264 =
      'H264_SOFT_OPENH264';
  static const String DEFAULT_CODECS_H264_H264_SOFT_FFMPEG = 'H264_SOFT_FFMPEG';
}
