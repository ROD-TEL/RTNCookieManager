#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(RTNCookieManager, NSObject)

RCT_EXTERN_METHOD(getHttpOnlyCookies:(NSString *)url
                  resolve:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)

@end

