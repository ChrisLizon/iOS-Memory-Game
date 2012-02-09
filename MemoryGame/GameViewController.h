//
//  ViewController.h
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
#import "AppDelegate.h"

@interface GameViewController : UIViewController<UIAlertViewDelegate>

@property (retain, nonatomic) IBOutletCollection(UIButton) NSArray *imageviews;
@property (retain) IBOutlet UINavigationBar *topToolbar;
@property (retain) IBOutlet UINavigationBar *bottomToolbar;
@property (retain) IBOutlet UILabel *pairsFoundCounter;
@property (retain) IBOutlet UILabel *turnsTakenCounter;
@property (retain) IBOutlet UILabel *pairsFoundText;
@property (retain) IBOutlet UILabel *turnsTakenText;

@property (retain,nonatomic)IBOutlet UIBarButtonItem *muteButton;

@property (retain) NSArray *cards;
@property (retain) NSMutableArray *assignments;
@property (retain) NSMutableArray *scores;


@property (assign) NSInteger flippedCards;
@property (assign) NSInteger lastCardIndex;
@property (assign) NSInteger currentCardIndex;
@property (assign) NSInteger pairsFound;
@property (assign) NSInteger turnsTaken;
@property (assign) NSInteger scoreInt;



-(IBAction)cardClicked:(id)sender;
-(void)flipCardsBack;
-(IBAction)quitGame:(id)sender;
-(IBAction)volumeToggle:(id)sender;
-(void)winGame;


@end
