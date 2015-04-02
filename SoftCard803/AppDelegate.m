//
//  AppDelegate.m
//  SoftCard803
//
//  Created by apple on 15/3/12.
//  Copyright (c) 2015年 iOSlearning. All rights reserved.
//

#import "AppDelegate.h"

#import "MyCardViewController.h"
#import "CardsTableViewController.h"
#import "TheMasterStore.h"
#import "ContactInfoStore.h"
#import "LoginViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.

    [[UINavigationBar appearance]setBarTintColor:[UIColor colorWithRed:52/255.0 green:52/255.0 blue:52/255.0 alpha:1.0]];
  
   // [[UINavigationBar appearance]setTranslucent:NO];
    
    LoginViewController *controller = [[LoginViewController alloc]init];
    
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:controller];
    controller.navigationItem.title = @"名片";
    
    
    
    self.window.rootViewController = nav1;
    
 
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {

}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [[TheMasterStore defaultStore]saveChanges];
    [[ContactInfoStore defaultStore]saveChanges];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
