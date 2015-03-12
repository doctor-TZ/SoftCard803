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

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    UITabBarController *tab = [[UITabBarController alloc]init];
    
    CardsTableViewController *tableController = [[CardsTableViewController alloc]init];
    
    
    
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:tableController];
    
    MyCardViewController *controller = [[MyCardViewController alloc] init];
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:controller];
    
    [tab setViewControllers:@[nav1,nav2]];
    
    self.window.rootViewController = tab;
    
 
    
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
