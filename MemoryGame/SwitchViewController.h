//
//  SwitchViewController.h
//  MemoryGame
//
//  Created by Guest User on 11-12-02.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@class GameViewController;
@class MenuViewController;
@class NetworkGameController;
@class InfoViewController;
@class MPViewController;
@class SettingsViewController;

@interface SwitchViewController : UIViewController {
    
    GameViewController *gameViewController;
    MenuViewController *menuViewController;
    InfoViewController *infoViewController;
    MPViewController *mpViewController;
    SettingsViewController *settingsViewController;
}
@property (retain, nonatomic) GameViewController *gameViewController;
@property (retain, nonatomic) MenuViewController *menuViewController;
@property (retain, nonatomic) InfoViewController *infoViewController;
@property (retain, nonatomic) MPViewController *mpViewController;
@property (retain, nonatomic) NetworkGameController *netGameController;
@property (retain,nonatomic) SettingsViewController *settingsViewController;


+ (void)switchToGame;
+ (void)switchToMenu;
+ (void)switchToInfo;
+ (void)switchToMultiplayer;
+ (void)switchToNetworkGame;
+ (void)switchToSettings;


@end
