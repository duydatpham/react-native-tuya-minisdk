import { NativeModules } from 'react-native';

var tuya = NativeModules.TuyaActivatorModule;
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

export { getCurrentWifi, initActivator, openNetworkSettings, stopConfig };
//# sourceMappingURL=react-native-tuya-minisdk.esm.js.map
