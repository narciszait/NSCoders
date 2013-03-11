//
//  AppDelegate.m
//  NSCoders
//
//  Created by Narcis on 4/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

#import "TwitterFeedViewController.h"

#import "MapViewController.h"

#import "AboutViewController.h"

#import "TwitterFeed.h"

#import "LaunchImageTransition.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;

- (void)dealloc
{
    [_window release];
    [_tabBarController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
        // Override point for customization after application launch.
    UIViewController *twitterFeed = [[[TwitterFeedViewController alloc] initWithNibName:@"TwitterFeedViewController" bundle:nil] autorelease];
    UIViewController *mapView = [[[MapViewController alloc] initWithNibName:@"MapViewController" bundle:nil] autorelease];
    UIViewController *aboutController=[[[AboutViewController alloc] initWithNibName:@"AboutViewController" bundle:nil]autorelease];
   // NavigationViewController *navController=[[NavigationViewController alloc] init];
    //UINavigationController *navigationController=[[UINavigationController alloc] initWithRootViewController:navController];
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:twitterFeed, mapView, aboutController,nil];
    
    self.window.rootViewController = self.tabBarController;
    
    
    if (([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)]) &&
        ([UIScreen mainScreen].scale == 2.0)) {
        UIImageView *splashScreen = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Default@2x.png"]];
        [self.window.rootViewController.view addSubview:splashScreen];
        
        [self.window makeKeyAndVisible];
        
        [UIView animateWithDuration:1.0 animations:^{splashScreen.alpha = 0.0;}
                         completion:(void (^)(BOOL)) ^{
                             [splashScreen removeFromSuperview];
                         }
         ];
    } else {
    UIImageView *splashScreen = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Default.png"]];
    [self.window.rootViewController.view addSubview:splashScreen];
    
    [self.window makeKeyAndVisible];
    
    [UIView animateWithDuration:1.0 animations:^{splashScreen.alpha = 0.0;} completion:(void (^)(BOOL)) ^{
                         [splashScreen removeFromSuperview];
                     }
     ];
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
