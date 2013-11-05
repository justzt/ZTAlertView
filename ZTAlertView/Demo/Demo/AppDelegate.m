//
//  AppDelegate.m
//  Demo
//
//  Created by zt on 13-11-5.
//  Copyright (c) 2013年 zt. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 200, 35);
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:[UIImage imageNamed:@"buttonBg"] forState:UIControlStateNormal];
    [button setTitle:@"test" forState:UIControlStateNormal];
    [self.window addSubview:button];
    return YES;
}

- (void)buttonAction:(UIButton*)button{
//    ZTAlertView *alertView = [[ZTAlertView alloc] initWithBackgroundImage:[UIImage imageNamed:@"alertBG"]
//                                                                    title:@"ttt"
//                                                                 subTitle:@"title"];
//    [alertView setCancelButtonWithName:@""
//                          okButtonName:@""
//                       backgroundImage:[UIImage imageNamed:@"buttonBg"]];

    //as notification view like HUD
    ZTAlertView *alertView = [[ZTAlertView alloc] initWithBackgroundImage:nil
                                                             contentIamge:[UIImage imageNamed:@"content"]
                                                                 describe:@"ok"
                                                              delayHidden:1];
    alertView.ZTDelegate = self;
    [alertView setTitleColor:[UIColor redColor]];
    [alertView setSubTitleColor:[UIColor redColor]];
    [alertView setButtonCornerRadius:7];
    [alertView show];
}

- (void)alertView:(id)alertView buttonClickedAtIndex:(int)buttonIndex{
    [ZTAlertView hidden];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
