//
//  LocalNotifications.m
//  RNLocalNotificationsSample
//
//  Created by MacKentoch on 10/09/2016.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "LocalNotifications.h"
#import "UIKit/UIKit.h"

@implementation LocalNotifications


#pragma mark - INIT

-(id) initWithDefault {
  self = [super init];
  
  _notificationsEnabled = YES;
  
  return self;
}


#pragma mark - SETTERS

-(void) setNotificationsEnabled:(BOOL)notificationsEnabled {
  if (notificationsEnabled == NO) {
    [self cancelAllLocalNotifications]; // remove all local notifications since they are no more enabled
  }
}


#pragma mark - METHODS

// active local notifications
-(void) enableLocalNotifications {
  _notificationsEnabled = YES;
}

// disactive local notifications (WARNING all notification will be canceled)
-(void) disableLocalNotifications {
  _notificationsEnabled = NO;
}


// IMPORTANT: prerequisite to enable notifications for your application (otherwise notifications won't fire)
-(void)registerNotification {
  UIUserNotificationType types =  UIUserNotificationTypeBadge |
                                  UIUserNotificationTypeSound |
                                  UIUserNotificationTypeAlert;
  
  UIUserNotificationSettings *mySettings = [UIUserNotificationSettings settingsForTypes: types
                                                                             categories: nil];

  [[UIApplication sharedApplication] registerUserNotificationSettings: mySettings];
}


// cancel all local notifications
-(void) cancelAllLocalNotifications {
  [[UIApplication sharedApplication] cancelAllLocalNotifications];
}

// resets badge number to 0
-(void) resetNotificationBadgeNumber {
  UIApplication *application = [UIApplication sharedApplication];
  application.applicationIconBadgeNumber = 0;
}


// schedule a local notification (define a title, a body and how many seconds from now before apearing)
-(void) scheduleLocalNotification: (NSString *) title
                             body: (NSString *) body
              secondsBeforeAppear: (int) seconds
                         userInfo: (NSDictionary *) userInfo {
  UILocalNotification *notification = [[UILocalNotification alloc] init];
  
  NSString *notificationTitle = title;
  if (!title) { notificationTitle = @"Please define a notification title"; }
  
  NSString *notificationBody = body;
  if (!body) { notificationBody = @"Please define a notification body"; }
  
  int notificationDelay = seconds;
  if (!title) { notificationDelay = 30; } // 30 seconds by default. as an example, 1 hour would be 60*60*24
  
  NSDictionary *notificationUserInfo = userInfo;
  if (userInfo.count <= 0) { notificationUserInfo = @{ @"empty": @YES }; }
  
  
  notification.fireDate = [[NSDate date] dateByAddingTimeInterval: notificationDelay];
  notification.alertTitle = notificationTitle;
  notification.alertBody = notificationBody;
  notification.userInfo = notificationUserInfo;
  
  [[UIApplication sharedApplication] scheduleLocalNotification: notification];
}


// show an immediate local notification (define a title, a body)
-(void) showLocalNotification: (NSString *) title
                         body: (NSString *) body
                     userInfo: (NSDictionary *) userInfo {
  UILocalNotification *notification = [[UILocalNotification alloc] init];
  
  NSString *notificationTitle = title;
  if (!title) { notificationTitle = @"Please define a notification title"; }
  
  NSString *notificationBody = body;
  if (!body) { notificationBody = @"Please define a notification body"; }
  
  NSDictionary *notificationUserInfo = userInfo;
  if (userInfo.count <= 0) { notificationUserInfo = @{ @"empty": @YES }; }
  
  notification.alertTitle = notificationTitle;
  notification.alertBody = notificationBody;
  notification.userInfo = notificationUserInfo;
  
  [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
}


@end
