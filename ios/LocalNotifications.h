//
//  LocalNotifications.h
//  RNLocalNotificationsSample
//
//  Created by MacKentoch on 10/09/2016.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"
#import "RCTComponent.h"

@interface LocalNotifications : NSObject


//////////////////////////////////
//----- PROPERTIES -----//
//////////////////////////////////

// enable / disable notifications
@property (nonatomic, assign) BOOL notificationsEnabled;



////////////////////
//----- INIT -----//
////////////////////
-(id) initWithDefault;


///////////////////////
//----- METHODS -----//
///////////////////////

// disactive local notifications (WARNING all notification will be canceled)
-(void) disableLocalNotifications;

// active local notifications
-(void) enableLocalNotifications;

// IMPORTANT: prerequisite to enable notifications for your application (otherwise notifications won't fire)
-(void) registerNotification;

// cancel all local notifications
-(void) cancelAllLocalNotifications;

// schedule a local notification (define a title, a body and how many seconds from now before apearing)
-(void) scheduleLocalNotification: (NSString *)title
                             body: (NSString *)body
              secondsBeforeAppear: (int) seconds;

// show an immediate local notification (define a title, a body)
-(void) showLocalNotification: (NSString *) title
                         body: (NSString *) body;

//// called when received a local notification
//-(void) receivedLocalNotification:(UIApplication *)application
//                            title: (NSString *) title
//                             body: (NSString *) body;

@end
