import { NativeModules } from 'react-native';

const tuya = NativeModules.TuyaActivatorModule;

export function openNetworkSettings() {
  return tuya.openNetworkSettings({});
}

// export type InitActivatorParams = {
//   homeId: number;
//   ssid: string;
//   password: string;
//   time: number;
//   type: 'TY_EZ' | 'TY_AP' | 'TY_QR';
// };

export function initActivator(
  params
) {
  return tuya.initActivator(params);
}

export function stopConfig() {
  return tuya.stopConfig();
}
