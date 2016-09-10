//
//  LocalNotificationsBridge.m
//  RNLocalNotificationsSample
//
//  Created by MacKentoch on 10/09/2016.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "LocalNotificationsBridge.h"
#import "LocalNotifications.h"
#import "UIKit/UIKit.h"
#import "AppDelegate.h"

#import "RCTLog.h"

@implementation LocalNotificationsBridge

RCT_EXPORT_MODULE();


////////////////////////////////
//----- INNER METHODS    -----//
////////////////////////////////

// get reference to singleton appDelegate
- (AppDelegate *) getAppDelegate {
  AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
  return appDelegate;
}


////////////////////////////////
//----- EXPORTED METHODS -----//
////////////////////////////////

// disactive local notifications (WARNING all notification will be canceled)
RCT_EXPORT_METHOD(enableLocalNotifications)
{
  AppDelegate *appDelegate = [self getAppDelegate];

  LocalNotifications *localNotificationManager = appDelegate.localNotificationsManager;
  if (!localNotificationManager) {return; }
  
  RCTLogInfo(@"will 'enable local notifications'");
  
  localNotificationManager.notificationsEnabled = YES;
}

// active local notifications
RCT_EXPORT_METHOD(disableLocalNotifications)
{
  AppDelegate *appDelegate = [self getAppDelegate];
  
  LocalNotifications *localNotificationManager = appDelegate.localNotificationsManager;
  if (!localNotificationManager) {return; }
  
  RCTLogInfo(@"will 'disable local notifications'");
  
  localNotificationManager.notificationsEnabled = NO;
}

// IMPORTANT: prerequisite to enable notifications for your application (otherwise notifications won't fire)
RCT_EXPORT_METHOD(registerNotification)
{
  AppDelegate *appDelegate = [self getAppDelegate];
  
  LocalNotifications *localNotificationManager = appDelegate.localNotificationsManager;
  if (!localNotificationManager) {return; }
  
  RCTLogInfo(@"will 'register local notifications'");
  
  [localNotificationManager registerNotification];
}

// cancel all local notifications
RCT_EXPORT_METHOD(cancelAllLocalNotifications)
{
  AppDelegate *appDelegate = [self getAppDelegate];
  
  LocalNotifications *localNotificationManager = appDelegate.localNotificationsManager;
  if (!localNotificationManager) {return; }
  
  RCTLogInfo(@"will 'cancel all notifications'");
  
  [localNotificationManager cancelAllLocalNotifications];
}

// schedule a local notification (define a title, a body and how many seconds from now before apearing)
RCT_EXPORT_METHOD(scheduleLocalNotification: (NSString *) title body:(NSString *) body secondsBeforeAppear: (int) seconds)
{
  AppDelegate *appDelegate = [self getAppDelegate];
  
  LocalNotifications *localNotificationManager = appDelegate.localNotificationsManager;
  if (!localNotificationManager) {return; }
  
  RCTLogInfo(@"will 'schedule a local notification' with title: %@ and body: %@", title, body);
  
  [localNotificationManager scheduleLocalNotification:title
                                                 body:body
                                  secondsBeforeAppear:seconds];
}


// show an immediate local notification (define a title, a body)
RCT_EXPORT_METHOD(showLocalNotification: (NSString *) title body:(NSString *) body)
{
  AppDelegate *appDelegate = [self getAppDelegate];
  
  LocalNotifications *localNotificationManager = appDelegate.localNotificationsManager;
  if (!localNotificationManager) {return; }
  
  RCTLogInfo(@"will 'show instantly a local notification' with title: %@ and body: %@", title, body);
  
  [localNotificationManager showLocalNotification:title
                                                 body:body];
}


@end
