//
//  AppDelegate.m
//  MemoryGame
//
//  Created by Guest User on 11-11-15.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

#import "GameViewController.h"
#import "MenuViewController.h"


@implementation AppDelegate

@synthesize window = _window;
@synthesize gameViewController;
@synthesize menuViewController;

//- (void)dealloc
//{
//    [window release];
//    [gameViewController release];
//    [menuViewController release];
//    [super dealloc];
//}

-(void)flipToGame{
    GameViewController *gameView = [[GameViewController alloc] initWithNibName:@"GameViewController_iPhone" bundle:nil];
	[self setGameViewController:gameView];
//	[gameView release];
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:2.0];
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:window cache:YES];
	[menuViewController.view removeFromSuperview];
	[self.window addSubview:[gameViewController view]];
	[UIView commitAnimations];
}

-(void)flipToMenu{
    [UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:1.0];
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:window cache:NO];
	[gameViewController.view removeFromSuperview];
	[self.window addSubview:[menuViewController view]];
	[UIView commitAnimations];
//	[gameViewController release];
    gameViewController = nil;
    
}

//- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
//{
//    [window addSubview:menuViewController.view];
//    [window makeKeyAndVisible];
//    return YES;
//}
//@implementation AppDelegate
//
//@synthesize window = _window;
//@synthesize gameViewController = _viewController;
//@synthesize menuViewController = _menuViewController;
//
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.gameViewController = [[GameViewController alloc] initWithNibName:@"GameViewController_iPhone" bundle:nil];
    self.menuViewController = [[MenuViewController alloc] initWithNibName:@"MenuView" bundle:nil];
    //self.window.rootViewController = self.gameViewController;
    self.window.rootViewController = self.menuViewController;
    [self.window makeKeyAndVisible];
    return YES;
}

//- (void)menuToGameView 

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

@end
