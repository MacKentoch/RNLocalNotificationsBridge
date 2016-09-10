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

// get reference to singleton appDelegate
- (AppDelegate *) getAppDelegate {
  // get reference to app delegate
  AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
  
  return appDelegate;
}


RCT_EXPORT_METHOD(enableLocalNotifications)
{
  AppDelegate *appDelegate = [self getAppDelegate];

  LocalNotifications *localNotificationManager = appDelegate.localNotificationsManager;
  if (!localNotificationManager) {return; }
  
  localNotificationManager.notificationsEnabled = YES;
}


RCT_EXPORT_METHOD(disableLocalNotifications)
{
  AppDelegate *appDelegate = [self getAppDelegate];
  
  LocalNotifications *localNotificationManager = appDelegate.localNotificationsManager;
  if (!localNotificationManager) {return; }
  
  localNotificationManager.notificationsEnabled = NO;
}


//
//RCT_EXPORT_METHOD(addEvent:(NSString *)name location:(NSString *)location)
//{
//  RCTLogInfo(@"Pretending to create an event %@ at %@", name, location);
//}
//
@end
