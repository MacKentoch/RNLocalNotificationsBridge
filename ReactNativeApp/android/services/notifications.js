import PushNotification from 'react-native-push-notification';

const defaultConfig = {
  // (required) Called when a remote or local notification is opened or received
  onNotification(notification) {
    console.log( 'NOTIFICATION:', notification );
  },
  popInitialNotification: true,
  requestPermissions: true,
};

export const configureNotifications = (configuration = defaultConfig) => {
  PushNotification.configure(configuration);
};

//
// function getOnRegisterProperty(configuration) {
//   if (configuration.onRegister && typeof configuration.onRegister === 'function') {
//     return configuration.onRegister;
//   }
//   return null;
// }
//
// function getThisProperty(configurationObject, propertyName, propertyType) {
//   if (!Object.prototype.hasOwnProperty(propertyName).call(configurationObject)) {
//     return null;
//   }
//
//   if (!typeof configurationObject[propertyName] === propertyType) {
//     return null;
//   }
//   return configurationObject[propertyName];
// }

//
// PushNotification.configure({
//
//     // (optional) Called when Token is generated (iOS and Android)
//     onRegister(token) {
//       console.log( 'TOKEN:', token );
//     },
//
//     // (required) Called when a remote or local notification is opened or received
//     onNotification(notification) {
//       console.log( 'NOTIFICATION:', notification );
//     },
//
//     // ANDROID ONLY: (optional) GCM Sender ID.
//     senderID: "YOUR GCM SENDER ID",
//
//     // IOS ONLY (optional): default: all - Permissions to register.
//     permissions: {
//       alert: true,
//       badge: true,
//       sound: true
//     },
//
//     // Should the initial notification be popped automatically
//     // default: true
//     popInitialNotification: true,
//
//     /**
//       * (optional) default: true
//       * - Specified if permissions (ios) and token (android and ios) will requested or not,
//       * - if not, you must call PushNotificationsHandler.requestPermissions() later
//       */
//     requestPermissions: true,
// });
