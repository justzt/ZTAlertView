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
    button.tag = 1;
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:[UIImage imageNamed:@"buttonBg"] forState:UIControlStateNormal];
    [button setTitle:@"style1" forState:UIControlStateNormal];
    [self.window addSubview:button];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = CGRectMake(100, 180, 200, 35);
    button2.tag = 2;
    [button2 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [button2 setBackgroundImage:[UIImage imageNamed:@"buttonBg"] forState:UIControlStateNormal];
    [button2 setTitle:@"style2" forState:UIControlStateNormal];
    [self.window addSubview:button2];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    button3.frame = CGRectMake(100, 250, 200, 35);
    button3.tag = 3;
    [button3 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [button3 setBackgroundImage:[UIImage imageNamed:@"buttonBg"] forState:UIControlStateNormal];
    [button3 setTitle:@"style3" forState:UIControlStateNormal];
    [self.window addSubview:button3];
    return YES;
}

- (void)buttonAction:(UIButton*)button{
    ZTAlertView *alertView;
    UIImage *bgImage = [UIImage imageNamed:@"buttonBg"];
    switch (button.tag) {
        case 1:{
            alertView = [[ZTAlertView alloc] initWithBackgroundImage:nil
                                                                     contentIamge:[UIImage imageNamed:@"content"]
                                                                         describe:@"ok"
                                                                      delayHidden:1];
            [alertView setDescribeLabelColor:[UIColor greenColor]];
            break;
        }
        case 2:
        case 3:{
            alertView = [[ZTAlertView alloc] initWithBackgroundImage:[UIImage imageNamed:@"alertBG"]
                                                               title:@"title"
                                                            subTitle:@"subTitle"];
            if (button.tag == 2) {
                [alertView setOneButtonWithName:@"ok" backgroundImage:bgImage];
            }else{
                [alertView setTwoButtonWithName:@"cancel" backImg:bgImage okButtonName:@"ok" backImg:bgImage];
            }
            [alertView setTitleColor:[UIColor redColor]];
            [alertView setSubTitleColor:[UIColor redColor]];
            alertView.ZTDelegate = self;
            [alertView setButtonCornerRadius:4];
            break;
        }
        default:
            break;
    }
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
