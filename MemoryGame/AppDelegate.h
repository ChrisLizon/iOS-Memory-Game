//
//  AppDelegate.h
//  MemoryGame
//
//  Created by Guest User on 11-11-15.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@class SwitchViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    UIWindow *window;
    SwitchViewController *switchViewController;
}

@property (strong, nonatomic) UIWindow *window;

@property(strong, nonatomic) SwitchViewController *switchViewController;

+(AVAudioPlayer *)getPlayer;
+(void)setPlayer:(AVAudioPlayer *)player;

@end
