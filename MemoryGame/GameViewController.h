//
//  ViewController.h
//  MemoryGame
//
//  Created by Guest User on 11-11-15.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "AppDelegate.h"

@interface GameViewController : UIViewController<UIAlertViewDelegate>

@property (retain, nonatomic) IBOutletCollection(UIButton) NSArray *imageviews;
@property (retain) IBOutlet UINavigationBar *topToolbar;
@property (retain) IBOutlet UINavigationBar *playerTurnToolbar;
@property (retain) IBOutlet UINavigationBar *opponentTurnToolbar;
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
