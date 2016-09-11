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


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions: (NSDictionary *)launchOptions
{
  // instanciate localNotificationsManager:
  _localNotificationsManager = [[LocalNotifications alloc] initWithDefault];
  
  
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


- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
  // increment badge number:
  application.applicationIconBadgeNumber = application.applicationIconBadgeNumber + 1;
  
  NSDictionary *details = @{
                            @"title": notification.alertTitle,
                            @"body": notification.alertBody
                         };
  
  [[NSNotificationCenter defaultCenter] postNotificationName:@"onLocalNotification"
                                                        object:details];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
  // reset badge number:
  application.applicationIconBadgeNumber = 0;
}

@end
