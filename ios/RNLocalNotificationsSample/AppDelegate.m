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
#import "LocalNotifications.h"

@implementation AppDelegate


// set a global localNotificationsManager:
LocalNotifications *localNotificationsManager;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  ////////////////////////////////////////////////////////////////////////////////////////////
  
  localNotificationsManager = [[LocalNotifications alloc] initWithDefault];
  
  localNotificationsManager.notificationsEnabled = YES;
  
  [localNotificationsManager registerNotification];

  [localNotificationsManager scheduleLocalNotification:@"Test notification"
                                                  body:@"This is a local notification"
                                   secondsBeforeAppear:30];
  
  ////////////////////////////////////////////////////////////////////////////////////////////
  
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
  
  return YES;
}



-(void) cancelAllLocalNotifications {
  [[UIApplication sharedApplication] cancelAllLocalNotifications];
}

// your code here will be executed when taped on a received a local notification:
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
  NSString* title = notification.alertTitle;
  NSString* body = notification.alertBody;
  
  // here show an alert when  receiving a notification:
  [self showNotificationAlert:body
                    withTitle:title];
}

// just for example
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
