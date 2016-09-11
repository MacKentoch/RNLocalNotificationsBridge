// @flow

import React, { Component } from 'react';
import {
  StyleSheet,
  Text,
  View,
  AlertIOS
}                           from 'react-native';
import {
  LocalNotificationsManager,
  LocalNotificationEvents
}                           from '../common/bridge';


// IMPORTANT:
LocalNotificationsManager.registerNotification();


// LocalNotificationsManager.disableLocalNotifications();
// LocalNotificationsManager.enableLocalNotifications();

class RNLocalNotificationsSample extends Component {
  componentDidMount() {
    LocalNotificationEvents.addListener(
      'onLocalNotification',
      this.onLocalNotification
    );

    LocalNotificationsManager.showLocalNotification(
      'Immediate Notification',
      'immediate local notification'
    );

    const delayInSeconds = 10;
    LocalNotificationsManager.scheduleLocalNotification(
      'Schedule notification',
      `Notification after ${delayInSeconds} seconds`,
      delayInSeconds
    );
  }

  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>
          Welcome to React Native!
        </Text>
        <Text style={styles.instructions}>
          To get started, edit index.ios.js
        </Text>
        <Text style={styles.instructions}>
          Press Cmd+R to reload,{'\n'}
          Cmd+D or shake for dev menu
        </Text>
      </View>
    );
  }

  onLocalNotification = (notification: any) => {
    console.log('JS side: received notification: ', notification);

    AlertIOS.alert(
      notification.title,
      notification.body,
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

export default RNLocalNotificationsSample;
