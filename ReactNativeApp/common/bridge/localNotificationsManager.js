import {
  NativeModules,
  NativeEventEmitter
} from 'react-native';

export const LocalNotificationsManager = NativeModules.LocalNotificationsBridge;

export const LocalNotificationEvents = new NativeEventEmitter(LocalNotificationsManager);
