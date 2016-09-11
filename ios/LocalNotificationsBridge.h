//
//  LocalNotificationsBridge.h
//  RNLocalNotificationsSample
//
//  Created by MacKentoch on 10/09/2016.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RCTBridgeModule.h"
#import "RCTBridge.h"
#import "RCTEventDispatcher.h"
#import "UIKit/UIKit.h"
#import "RCTEventEmitter.h"

@interface LocalNotificationsBridge : RCTEventEmitter <RCTBridgeModule>

//-(void) receivedLocalNotification:(UIApplication *)application
//                            title: (NSString *) title
//                             body: (NSString *) body;
@end
