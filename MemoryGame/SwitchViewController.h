//
//  SwitchViewController.h
//  MemoryGame
//
//  Created by Guest User on 11-12-02.
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
@class GameViewController;
@class MenuViewController;
@class NetworkGameController;
@class InfoViewController;
@class MPViewController;
@class SettingsViewController;
@class HSViewController;

@interface SwitchViewController : UIViewController {
    
    GameViewController *gameViewController;
    MenuViewController *menuViewController;
    InfoViewController *infoViewController;
    MPViewController *mpViewController;
    SettingsViewController *settingsViewController;
    HSViewController *hsViewController;
}
@property (retain, nonatomic) GameViewController *gameViewController;
@property (retain, nonatomic) MenuViewController *menuViewController;
@property (retain, nonatomic) InfoViewController *infoViewController;
@property (retain, nonatomic) MPViewController *mpViewController;
@property (retain, nonatomic) NetworkGameController *netGameController;
@property (retain,nonatomic) SettingsViewController *settingsViewController;
@property (retain, nonatomic) HSViewController *hsViewController;


+ (void)switchToGame;
+ (void)switchToMenu;
+ (void)switchToInfo;
+ (void)switchToMultiplayer;
+ (void)switchToNetworkGame;
+ (void)switchToSettings;
+ (void)switchToHighScore;


@end
