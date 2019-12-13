#import "AliyunVideoPlugin.h"
#import <aliyun_video/aliyun_video-Swift.h>

@implementation AliyunVideoPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAliyunVideoPlugin registerWithRegistrar:registrar];
}
@end
