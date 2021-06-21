package com.hogar.tuyaminisdk.activator;

import android.content.Intent;
import android.os.Handler;

import androidx.annotation.NonNull;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableMap;
import com.tuya.smart.config.TuyaConfig;

//#define kTuyaRNActivatorModuleHomeId @"homeId"
//        #define kTuyaRNActivatorModuleSSID @"ssid"
//        #define kTuyaRNActivatorModulePassword @"password"
//        #define kTuyaRNActivatorModuleActivatorMode @"type"
//        #define kTuyaRNActivatorModuleOverTime @"time"
//        #define kTuyaRNActivatorModuleAcccessToken @"token"
//        #define kTuyaRNActivatorModuleDeviceId @"devId"
public class TuyaActivatorModule extends ReactContextBaseJavaModule {

    private final ReactApplicationContext reactContext;

    public TuyaActivatorModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }
    @NonNull
    @Override
    public String getName() {
        return "TuyaActivatorModule";
    }

    @ReactMethod
    public void initActivator(ReadableMap options) {
        String ssid = options.getString("ssid");
        String password = options.getString("password");
        String type = options.getString("type");
        String token = options.getString("token");

        if("TY_EZ".equals(type))
            TuyaConfig.getEZInstance().startConfig(ssid,password,token);
        if("TY_AP".equals(type))
            TuyaConfig.getAPInstance().startConfig(this.getReactApplicationContext(),ssid,password,token);
    }

    @ReactMethod
    public void newGwSubDevActivator(ReadableMap options) {
        String token = options.getString("token");
        TuyaConfig.getWiredConfigInstance().startConfig(this.getReactApplicationContext(),token);
    }

    @ReactMethod
    public void stopConfig(){
        TuyaConfig.getWiredConfigInstance().stopConfig();
        TuyaConfig.getAPInstance().stopConfig();
        TuyaConfig.getEZInstance().stopConfig();
    }

    @ReactMethod
    public void openNetworkSettings(){
        try {
            this.getCurrentActivity().startActivity(new Intent(android.provider.Settings.ACTION_SETTINGS));
        } catch (Exception e) {
        }
    }
}
