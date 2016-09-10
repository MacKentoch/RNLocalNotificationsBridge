// @flow
import React, { Component }       from 'react';
import {
  StyleSheet,
  Text,
  View,
  TouchableHighlight
}                                 from 'react-native';
import { configureNotifications } from './services';
import PushNotification           from 'react-native-push-notification';

class RNLocalNotificationsSample extends Component {
  constructor(props: any) {
    super(props);
  }

  componentWillMount() {
    configureNotifications({
      onNotification: this.onNotification
    });
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
        <TouchableHighlight
          onPress={this.onPressButton}>
          <Text>
            schedule notification in 10 sec
          </Text>
        </TouchableHighlight>
      </View>
    );
  }

  onNotification = () => {
    return (notification) => console.log('---> notification received: ', notification);
  }

  onPressButton = () => {
    const withinMinutes = 1;
    this.createNotification(withinMinutes);
  }

  createNotification(withinMinutes) {
    console.log('create notifications');

    PushNotification.localNotificationSchedule({
         message: 'My Notification Message within 30 seconds', // (required)
        date: new Date(Date.now() + (30 * 1000)) // in 60 secs
    });

    PushNotification.localNotificationSchedule({
         message: `My Notification Message within ${withinMinutes} minutes`, // (required)
        date: new Date(Date.now() + (60 * 1000 * withinMinutes)) // in 60 secs
    });

    PushNotification.localNotificationSchedule({
        message: `My Notification Message within ${withinMinutes + 1} minutes`, // (required)
        date: new Date(Date.now() + (60 * 1000 * (withinMinutes + 1))) // in 60 secs
    });
  }

  //cancelAllLocalNotifications()
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
