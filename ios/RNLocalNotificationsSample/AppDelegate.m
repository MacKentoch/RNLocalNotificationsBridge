/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import "AppDelegate.h"

#import "RCTBundleURLProvider.h"
#import "RCTRootView.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  NSURL *jsCodeLocation;

  jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index.ios"
                                                                  fallbackResource:nil];

  RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                      moduleName:@"RNLocalNotificationsSample"
                                               initialProperties:nil
                                                   launchOptions:launchOptions];
  
  rootView.backgroundColor = [[UIColor alloc] initWithRed:1.0f
                                                    green:1.0f
                                                     blue:1.0f
                                                    alpha:1];

  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  UIViewController *rootViewController = [UIViewController new];
  rootViewController.view = rootView;
  self.window.rootViewController = rootViewController;
  [self.window makeKeyAndVisible];
  
  // Notifications:
  [self registerNotification];
  [self scheduleNotification];
  
  return YES;
}



- (void)registerNotification {
  UIUserNotificationType types =  UIUserNotificationTypeBadge |
  UIUserNotificationTypeSound |
  UIUserNotificationTypeAlert;
  
  UIUserNotificationSettings *mySettings = [UIUserNotificationSettings settingsForTypes:types
                                                                             categories:nil
                                            ];
  
  [[UIApplication sharedApplication] registerUserNotificationSettings:mySettings];
}


- (void) scheduleNotification {
  UILocalNotification *notification = [[UILocalNotification alloc] init];
  
  //  notification.fireDate = [[NSDate date] dateByAddingTimeInterval:60*60*24];
  notification.fireDate = [[NSDate date] dateByAddingTimeInterval:60];
  notification.alertBody = @"1 minute passed then this notification came";
  
  // this will schedule the notification to fire at the fire date
  [[UIApplication sharedApplication] scheduleLocalNotification:notification];
  
  // this will fire the notification right away, it will still also fire at the date we set
  //  [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
}


-(void) cancelAllLocalNotifications {
  [[UIApplication sharedApplication] cancelAllLocalNotifications];
}


- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
  [self showNotificationAlert:@"hello world"
                    withTitle:@"Test local notification"];
}

- (void)showNotificationAlert:(NSString*)message withTitle:(NSString *)title{
  dispatch_async(dispatch_get_main_queue(), ^{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction * _Nonnull action) {
                                                        
                                                      }]];
    
    [[[[UIApplication sharedApplication] keyWindow] rootViewController] presentViewController:alertController
                                                                                     animated:YES completion:^{
                                                                                     }];
  });
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
  NSLog(@"%s", __PRETTY_FUNCTION__);
  
  application.applicationIconBadgeNumber = 0;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  NSLog(@"%s", __PRETTY_FUNCTION__);
  
  application.applicationIconBadgeNumber = 0;
  
  //  [self cancelAllLocalNotifications];
  
}

@end
