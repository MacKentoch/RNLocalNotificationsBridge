import React, { Component } from 'react';
import {
  StyleSheet,
  Text,
  View,
  ListView,
  AlertIOS
}                           from 'react-native';
import {
  LocalNotificationsManager,
  LocalNotificationEvents
}                           from '../common/bridge';

// IMPORTANT: notifications won't be able to work without registering application to notifications
LocalNotificationsManager.registerNotification();

const demoNotifications = [
  {
    id: 1,
    type: 'instant',
    delayInSeconds: null,
    title: 'A notification :)',
    body: 'An instant notification',
    occured: false
  },
  {
    id: 2,
    type: 'schedule',
    delayInSeconds: 10,
    title: 'Another notification',
    body: 'First scheduled notification',
    occured: false
  },
  {
    id: 3,
    type: 'schedule',
    delayInSeconds: 20,
    title: 'Another one',
    body: 'Second scheduled notification',
    occured: false
  }
];

class RNLocalNotificationsSample extends Component {
  constructor(props) {
    super(props);

    const ds = new ListView.DataSource(
      {rowHasChanged: (r1, r2) => r1 !== r2}
    );

    this.state = {
      notificationTypes: ['instant', 'schedule'],
      notifications: [...demoNotifications],
      dataSource: ds.cloneWithRows(demoNotifications)
    };
  }

  componentDidMount() {
    // add a listener to handle received notifications
    LocalNotificationEvents.addListener(
      'onLocalNotification',
      this.onLocalNotification
    );

    // create demo notifications:
    this.createNotifications();
  }

  componentWillUnMount() {
    // never forget to remove listeners
    LocalNotificationEvents.removeAllListeners('onLocalNotification');
 }

  render() {
    const { dataSource } = this.state;
    return (
      <View style={styles.container}>
        <Text style={styles.title}>
          Local notifications: manual bridge
        </Text>
        <ListView
          style={styles.list}
          dataSource={dataSource}
          renderRow={this.renderRow}
        />
      </View>
    );
  }

  createNotifications() {
    const { notifications } = this.state;

    notifications.forEach(
      notification => {
        if (notification.type === 'instant') {
          this.createInstantNotification(notification);
        }
        if (notification.type === 'schedule') {
          this.createScheduledNotification(notification);
        }
      }
    );
  }

  createInstantNotification({id, title, body}) {
    LocalNotificationsManager.showLocalNotification(
      title,
      body
    );
  }

  createScheduledNotification({id, delayInSeconds, title, body}) {
    LocalNotificationsManager.scheduleLocalNotification(
      title,
      body,
      delayInSeconds
    );
  }

  renderRow = ({id, type, delayInSeconds, title, body, occured}) => {
    return (
      <View
        id={id}
        style={styles.rowContainer}>
        <Text style={styles.notificationTitle}>
          {title}
        </Text>
        <Text style={styles.notificationBody}>
          {body}
        </Text>
        {
          occured
          ? false &&
          <Text style={styles.notificationStatus}>
            ...
          </Text>
          : true &&
          <Text style={styles.notificationStatus}>
            done
          </Text>
        }
      </View>
    );
  }

  onEnabeNotifications = () => {
    // NOTE: disable notification = cancel all pending notifications!
    LocalNotificationsManager.enableLocalNotifications();
  }

  onDisableNotifications = () => {
    // NOTE: disable notification = cancel all pending notifications!
    LocalNotificationsManager.disableLocalNotifications();
  }

  onLocalNotification = (notification) => {
    AlertIOS.alert(
      notification.title,
      notification.body,
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#4183D7',
  },
  title: {
    fontSize: 20,
    textAlign: 'center',
    marginTop: 40,
    marginBottom: 40,
    color: '#E4F1FE'
  },
  list: {
    flex: 1,
    borderTopColor: '#ECECEC',
    borderTopWidth: 0.5,
    backgroundColor: '#FFF',
  },
  rowContainer: {
    flex: 1,
    height: 50,
    marginLeft: 2,
    marginRight: 2,
    // backgroundColor: 'red',
    flexDirection: 'row',
    alignItems: 'center',
    borderBottomColor: '#ECECEC',
    borderBottomWidth: 0.5
  },
  notificationTitle: {
    flex:1,
    fontSize: 11,
  },
  notificationBody: {
    flex:2,
    fontSize: 11,
  },
  notificationStatus: {
    flex:1,
    fontSize: 11,
    textAlign: 'right',
    marginRight: 20
  }
});

export default RNLocalNotificationsSample;
