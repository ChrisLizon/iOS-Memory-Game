//
//  SwitchViewController.h
//  MemoryGame
//
//  Created by Guest User on 11-12-02.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GameViewController;
@class MenuViewController;

@interface SwitchViewController : UIViewController {
    
    GameViewController *gameViewController;
    MenuViewController *menuViewController;
}
@property (retain, nonatomic) GameViewController *gameViewController;
@property (retain, nonatomic) MenuViewController *menuViewController;


- (void)switchToGame;
+ (void)switchToMenu;
@end
