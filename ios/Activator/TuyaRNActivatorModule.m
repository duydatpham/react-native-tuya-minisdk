//
//  TuyaRNActivatorModule.m
//  TuyaRnDemo
//
//  Created by 浩天 on 2019/2/28.
//  Copyright © 2019年 Facebook. All rights reserved.
//

#import "TuyaRNActivatorModule.h"
#import <TuyaSmartActivatorKit/TuyaSmartActivatorKit.h>
#import "TuyaRNUtils+Network.h"
#import "YYModel.h"

#define kTuyaRNActivatorModuleHomeId @"homeId"
#define kTuyaRNActivatorModuleSSID @"ssid"
#define kTuyaRNActivatorModulePassword @"password"
#define kTuyaRNActivatorModuleActivatorMode @"type"
#define kTuyaRNActivatorModuleOverTime @"time"
#define kTuyaRNActivatorModuleAcccessToken @"token"
#define kTuyaRNActivatorModuleDeviceId @"devId"

static TuyaRNActivatorModule * activatorInstance = nil;

@interface TuyaRNActivatorModule()<TuyaSmartActivatorDelegate>

@property(copy, nonatomic) RCTPromiseResolveBlock promiseResolveBlock;
@property(copy, nonatomic) RCTPromiseRejectBlock promiseRejectBlock;

@end

@implementation TuyaRNActivatorModule

RCT_EXPORT_MODULE(TuyaActivatorModule)


RCT_EXPORT_METHOD(initActivator:(NSDictionary *)params resolver:(RCTPromiseResolveBlock)resolver rejecter:(RCTPromiseRejectBlock)rejecter) {
  
  NSString *ssid = params[kTuyaRNActivatorModuleSSID];
  NSString *password = params[kTuyaRNActivatorModulePassword];
  NSNumber *time = params[kTuyaRNActivatorModuleOverTime];
  NSString *type = params[kTuyaRNActivatorModuleActivatorMode];
  NSString *token = params[kTuyaRNActivatorModuleActivatorToken];
  
  TYActivatorMode mode =  TYActivatorModeEZ;
  if ([type isEqualToString:@"TY_EZ"]) {
    mode = TYActivatorModeEZ;
  } else if([type isEqualToString:@"TY_AP"]) {
    mode = TYActivatorModeAP;
  } else if([type isEqualToString:@"TY_QR"]) {
    mode = TYActivatorModeQRCode;
  }
  
  if (activatorInstance == nil) {
    activatorInstance = [TuyaRNActivatorModule new];
  }
  
  [TuyaSmartActivator sharedInstance].delegate = activatorInstance;
  activatorInstance.promiseResolveBlock = resolver;
  activatorInstance.promiseRejectBlock = rejecter;
  
  [[TuyaSmartActivator sharedInstance] startConfigWiFi:mode ssid:ssid password:password token:token timeout:time.doubleValue];
}


RCT_EXPORT_METHOD(stopConfig:(RCTPromiseResolveBlock)resolver rejecter:(RCTPromiseRejectBlock)rejecter) {
  
  [[TuyaSmartActivator sharedInstance] stopConfigWiFi];
}


RCT_EXPORT_METHOD(newGwSubDevActivator:(NSDictionary *)params resolver:(RCTPromiseResolveBlock)resolver rejecter:(RCTPromiseRejectBlock)rejecter) {
  
  NSString *deviceId = params[kTuyaRNActivatorModuleDeviceId];
  NSNumber *time = params[kTuyaRNActivatorModuleOverTime];
  
  if (activatorInstance == nil) {
    activatorInstance = [TuyaRNActivatorModule new];
  }
  
  [TuyaSmartActivator sharedInstance].delegate = activatorInstance;
  activatorInstance.promiseResolveBlock = resolver;
  activatorInstance.promiseRejectBlock = rejecter;
  
  [[TuyaSmartActivator sharedInstance] activeSubDeviceWithGwId:deviceId timeout:time.doubleValue];
  
}

RCT_EXPORT_METHOD(stopNewGwSubDevActivatorConfig:(NSDictionary *)params resolver:(RCTPromiseResolveBlock)resolver rejecter:(RCTPromiseRejectBlock)rejecter) {
  
  NSString *deviceId = params[kTuyaRNActivatorModuleDeviceId];
  [[TuyaSmartActivator sharedInstance] stopActiveSubDeviceWithGwId:deviceId];
}


RCT_EXPORT_METHOD(getCurrentWifi:(NSDictionary *)params success:(RCTResponseSenderBlock)succ failure:(RCTResponseErrorBlock)fail) {
  NSString *ssid = [TuyaSmartActivator currentWifiSSID];
  if ([ssid isKindOfClass:[NSString class]] && ssid.length > 0) {
    succ(@[ssid]);
  } else {
    fail(nil);
  }
}


RCT_EXPORT_METHOD(openNetworkSettings:(NSDictionary *)params resolver :(RCTPromiseResolveBlock)resolver rejecter:(RCTPromiseRejectBlock)rejecter) {
  
   [TuyaRNUtils openNetworkSettings];
  
}

RCT_EXPORT_METHOD(onDestory:(RCTPromiseResolveBlock)resolver rejecter:(RCTPromiseRejectBlock)rejecter) {
  
}



@end
