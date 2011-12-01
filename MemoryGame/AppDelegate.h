//
//  AppDelegate.h
//  MemoryGame
//
//  Created by Guest User on 11-11-15.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GameViewController,MenuViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    IBOutlet UIWindow *window;
    IBOutlet GameViewController *gameViewController;
    IBOutlet MenuViewController *menuViewController;
}

-(void)flipToGame;
-(void)flipToMenu;

//@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) GameViewController *gameViewController;

@property(strong, nonatomic) MenuViewController *menuViewController;

@end
