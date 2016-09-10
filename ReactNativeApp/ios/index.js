// @flow

import React, { Component } from 'react';
import {
  StyleSheet,
  Text,
  View
}                           from 'react-native';
import {
  LocalNotificationsManager
}                           from '../common/bridge';

LocalNotificationsManager.enableLocalNotifications();
LocalNotificationsManager.registerNotification();


class RNLocalNotificationsSample extends Component {
  componentDidMount() {
    LocalNotificationsManager.showLocalNotification(
      'title from JS',
      'immediate local notification'
    );

    const delayInSeconds = 10;
    LocalNotificationsManager.scheduleLocalNotification(
      'title from JS',
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
