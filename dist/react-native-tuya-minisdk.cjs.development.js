'use strict';

Object.defineProperty(exports, '__esModule', { value: true });

var reactNative = require('react-native');

var tuya = reactNative.NativeModules.TuyaActivatorModule;
function openNetworkSettings() {
  return tuya.openNetworkSettings({});
}
function initActivator(params) {
  return tuya.initActivator(params);
}
function stopConfig() {
  return tuya.stopConfig();
}
function getCurrentWifi(success, error) {
  // We need the Allow While Using App location permission to use this.
  return tuya.getCurrentWifi({}, success, error);
}

exports.getCurrentWifi = getCurrentWifi;
exports.initActivator = initActivator;
exports.openNetworkSettings = openNetworkSettings;
exports.stopConfig = stopConfig;
//# sourceMappingURL=react-native-tuya-minisdk.cjs.development.js.map
