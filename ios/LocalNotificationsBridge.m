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


#ifndef SHOW_RCTLOG
#define SHOW_RCTLOG 0 // set 1 only for dev debug otherwise 0
#endif

@implementation LocalNotificationsBridge

RCT_EXPORT_MODULE();


#pragma mark - INNER METHODS

// get reference to singleton appDelegate
- (AppDelegate *) getAppDelegate {
  AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
  return appDelegate;
}


#pragma mark - EXPORTED METHODS

// disactive local notifications (WARNING all notification will be canceled)
RCT_EXPORT_METHOD(enableLocalNotifications)
{
  AppDelegate *appDelegate = [self getAppDelegate];

  LocalNotifications *localNotificationManager = appDelegate.localNotificationsManager;
  if (!localNotificationManager) {return; }
  
  #if SHOW_RCTLOG
    RCTLogInfo(@"'enable' local notifications");
  #endif
  
  

  localNotificationManager.notificationsEnabled = YES;
}

// active local notifications
RCT_EXPORT_METHOD(disableLocalNotifications)
{
  AppDelegate *appDelegate = [self getAppDelegate];
  
  LocalNotifications *localNotificationManager = appDelegate.localNotificationsManager;
  if (!localNotificationManager) {return; }
  
  #if SHOW_RCTLOG
    RCTLogInfo(@"'disable' local notifications");
  #endif
  
  localNotificationManager.notificationsEnabled = NO;
}

// IMPORTANT: prerequisite to enable notifications for your application (otherwise notifications won't fire)
RCT_EXPORT_METHOD(registerNotification)
{
  AppDelegate *appDelegate = [self getAppDelegate];
  
  LocalNotifications *localNotificationManager = appDelegate.localNotificationsManager;
  if (!localNotificationManager) {return; }
  
  #if SHOW_RCTLOG
    RCTLogInfo(@"'register local notifications'");
  #endif
  
  [localNotificationManager registerNotification];
}

// cancel all local notifications
RCT_EXPORT_METHOD(cancelAllLocalNotifications)
{
  AppDelegate *appDelegate = [self getAppDelegate];
  
  LocalNotifications *localNotificationManager = appDelegate.localNotificationsManager;
  if (!localNotificationManager) {return; }
  
  #if SHOW_RCTLOG
    RCTLogInfo(@"'cancel all notifications'");
  #endif
  
  [localNotificationManager cancelAllLocalNotifications];
}

// schedule a local notification (define a title, a body and how many seconds from now before apearing)
RCT_EXPORT_METHOD(scheduleLocalNotification: (NSString *) title body:(NSString *) body secondsBeforeAppear: (int) seconds)
{
  AppDelegate *appDelegate = [self getAppDelegate];
  
  LocalNotifications *localNotificationManager = appDelegate.localNotificationsManager;
  if (!localNotificationManager) {return; }
  
  #if SHOW_RCTLOG
    RCTLogInfo(@"'schedule a local notification' with title: %@ and body: %@", title, body);
  #endif
  
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
  
  #if SHOW_RCTLOG
    RCTLogInfo(@"'show instantly a local notification' with title: %@ and body: %@", title, body);
  #endif

  [localNotificationManager showLocalNotification:title
                                                 body:body];
}


@end
