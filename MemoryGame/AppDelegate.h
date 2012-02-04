//
//  AppDelegate.h
//  MemoryGame
//
//  Created by Guest User on 11-11-15.
/*
This file is part of iOS-Memory-Game.

    iOS-Memory-Game is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    iOS-Memory-Game is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with iOS-Memory-Game.  If not, see <http://www.gnu.org/licenses/>.
 */

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

+(void)toggleMusic;
+(BOOL)getMusic;
+(void)toggleSound;
+(BOOL)getSound;
+(void)toggleHardMusic;
+(BOOL)getHardMusic;
+(void)setHardMusic:(BOOL)on;
+(void)toggleHardSound;
+(BOOL)getHardSound;
+(void)setHardSound:(BOOL)off;

@end
