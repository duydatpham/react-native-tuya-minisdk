//
//  TuyaRNActivatorModule.m
//  TuyaRnDemo
//
//  Created by 浩天 on 2019/2/28.
//  Copyright © 2019年 Facebook. All rights reserved.
//

#import "TuyaRNActivatorModule.h"
#import "TuyaSmartActivator.h"

#define kTuyaRNActivatorModuleHomeId @"homeId"
#define kTuyaRNActivatorModuleSSID @"ssid"
#define kTuyaRNActivatorModulePassword @"password"
#define kTuyaRNActivatorModuleActivatorMode @"type"
#define kTuyaRNActivatorModuleOverTime @"time"
#define kTuyaRNActivatorModuleAcccessToken @"token"
#define kTuyaRNActivatorModuleDeviceId @"devId"

static TuyaRNActivatorModule * activatorInstance = nil;

@implementation TuyaRNActivatorModule

RCT_EXPORT_MODULE(TuyaActivatorModule)


RCT_EXPORT_METHOD(initActivator:(NSDictionary *)params resolver:(RCTPromiseResolveBlock)resolver rejecter:(RCTPromiseRejectBlock)rejecter) {
  
  NSString *ssid = params[kTuyaRNActivatorModuleSSID];
  NSString *password = params[kTuyaRNActivatorModulePassword];
  NSNumber *time = params[kTuyaRNActivatorModuleOverTime];
  NSString *type = params[kTuyaRNActivatorModuleActivatorMode];
  NSString *token = params[kTuyaRNActivatorModuleAcccessToken];
  
  TYActivatorMode mode =  TYActivatorModeEZ;
  if ([type isEqualToString:@"TY_EZ"]) {
    mode = TYActivatorModeEZ;
  } else if([type isEqualToString:@"TY_AP"]) {
    mode = TYActivatorModeAP;
  }
  
  if (activatorInstance == nil) {
    activatorInstance = [TuyaRNActivatorModule new];
  }
  
  [[TuyaSmartActivator sharedInstance] startConfigWiFiWithMode:mode ssid:ssid password:password token:token];
}


RCT_EXPORT_METHOD(stopConfig:(RCTPromiseResolveBlock)resolver rejecter:(RCTPromiseRejectBlock)rejecter) {
  
  [[TuyaSmartActivator sharedInstance] stopConfigWiFi];
}


RCT_EXPORT_METHOD(newGwSubDevActivator:(NSDictionary *)params resolver:(RCTPromiseResolveBlock)resolver rejecter:(RCTPromiseRejectBlock)rejecter) {
  
    NSString *token = params[kTuyaRNActivatorModuleAcccessToken];
  if (activatorInstance == nil) {
    activatorInstance = [TuyaRNActivatorModule new];
  }
  
  [[TuyaSmartActivator sharedInstance] startConfigWiredDeviceWithToken:token];
  
}


RCT_EXPORT_METHOD(startDiscovery:(RCTPromiseResolveBlock)resolver rejecter:(RCTPromiseRejectBlock)rejecter) {
    [[TuyaSmartActivator sharedInstance] startDiscovery:^(TYBLEAdvModel *model){
          
    }];
}

RCT_EXPORT_METHOD(stopDiscovery:(RCTPromiseResolveBlock)resolver rejecter:(RCTPromiseRejectBlock)rejecter) {
    [[TuyaSmartActivator sharedInstance] stopDiscovery];
}

RCT_EXPORT_METHOD(startConfigBLEWifi:(NSDictionary *)params resolver:(RCTPromiseResolveBlock)resolver rejecter:(RCTPromiseRejectBlock)rejecter) {
  
//  NSString *ssid = params[kTuyaRNActivatorModuleSSID];
//  NSString *password = params[kTuyaRNActivatorModulePassword];
//  NSNumber *time = params[kTuyaRNActivatorModuleOverTime];
//  NSString *type = params[kTuyaRNActivatorModuleActivatorMode];
//  NSString *token = params[kTuyaRNActivatorModuleAcccessToken];
//
//    TYBLEAdvModel *model = #<startDiscovery result>;
//   NSString *authKey = @""; // from clund
//   NSString *random = @""; // from random
//
//   [[TuyaSmartActivator sharedInstance] startConfigBLEWifiWithAdvModel:model
//                                                               authKey:authKeyauthKey
//                                                                random:random
//                                                                  ssid:ssid
//                                                              password:password
//                                                                 token:token];
}

RCT_EXPORT_METHOD(stopConfigBLEWifi:(RCTPromiseResolveBlock)resolver rejecter:(RCTPromiseRejectBlock)rejecter) {
//    [[TuyaSmartActivator sharedInstance] stopConfigBLEWifiWithAdvModel:#<discoveryModel>];
}



@end
