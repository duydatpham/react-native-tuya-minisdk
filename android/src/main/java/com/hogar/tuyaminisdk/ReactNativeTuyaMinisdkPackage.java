// ReactNativeTuyaMinisdkPackage.java

package com.hogar.tuyaminisdk;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import com.facebook.react.ReactPackage;
import com.facebook.react.bridge.NativeModule;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.uimanager.ViewManager;
import com.hogar.tuyaminisdk.activator.TuyaActivatorModule;

public class ReactNativeTuyaMinisdkPackage implements ReactPackage {
    @Override
    public List<NativeModule> createNativeModules(ReactApplicationContext reactContext) {
        List<NativeModule> lst = new ArrayList<>();
        lst.add(new ReactNativeTuyaMinisdkModule(reactContext));
        lst.add(new TuyaActivatorModule(reactContext));
        return lst;
    }

    @Override
    public List<ViewManager> createViewManagers(ReactApplicationContext reactContext) {
        return Collections.emptyList();
    }
}
