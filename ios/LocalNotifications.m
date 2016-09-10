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

////////////////////
//----- INIT -----//
////////////////////

-(id) initWithDefault {
  self = [super init];
  
  _notificationsEnabled = NO;
  
  return self;
}

///////////////////////
//----- SETTERS -----//
///////////////////////

-(void) setNotificationsEnabled:(BOOL)notificationsEnabled {
  if (notificationsEnabled == NO) {
    [self cancelAllLocalNotifications]; // remove all local notifications since they are no more enabled
  }
}

///////////////////////
//----- METHODS -----//
///////////////////////

// IMPORTANT: prerequisite to enable notifications for your application (otherwise notifications won't fire)
-(void)registerNotification {
  UIUserNotificationType types =  UIUserNotificationTypeBadge |
  UIUserNotificationTypeSound |
  UIUserNotificationTypeAlert;
  
  UIUserNotificationSettings *mySettings = [UIUserNotificationSettings settingsForTypes:types
                                                                             categories:nil
                                            ];
  [[UIApplication sharedApplication] registerUserNotificationSettings:mySettings];
}





// cancel all local notifications
-(void) cancelAllLocalNotifications {
  [[UIApplication sharedApplication] cancelAllLocalNotifications];
}




// schedule a local notification (define a title, a body)
-(void) scheduleLocalNotification: (NSString *) title body:(NSString *) body secondsBeforeAppear: (int) seconds {
  UILocalNotification *notification = [[UILocalNotification alloc] init];
  
  NSString *notificationTitle = title;
  if (!title) { notificationTitle = @"Please define a noification title"; }
  
  NSString *notificationBody = body;
  if (!body) { notificationBody = @"Please define a noification body"; }
  
  int notificationDelay = seconds;
  if (!title) { notificationDelay = 30; } // 30 seconds by default. as an example, 1 hour would be 60*60*24
  
  
  notification.fireDate = [[NSDate date] dateByAddingTimeInterval:notificationDelay];
  notification.alertTitle = notificationTitle;
  notification.alertBody = notificationBody;
  
  // this will schedule the notification to fire at the fire date
  [[UIApplication sharedApplication] scheduleLocalNotification:notification];
  
  // this will fire the notification right away, it will still also fire at the date we set
  //  [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
}



@end
