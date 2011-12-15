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

@interface GameViewController : UIViewController

@property (retain, nonatomic) IBOutletCollection(UIButton) NSArray *imageviews;
@property (retain) IBOutlet UINavigationBar *topToolbar;
@property (retain) IBOutlet UINavigationBar *bottomToolbar;
@property (retain) IBOutlet UILabel *pairsFoundLabel;
@property (retain) IBOutlet UILabel *turnsTakenLabel;
@property (retain) NSArray *cards;
@property (retain) NSMutableArray *assignments;

@property (assign) NSInteger flippedCards;
@property (assign) NSInteger lastCardIndex;
@property (assign) NSInteger currentCardIndex;
@property (assign) NSInteger pairsFound;
@property (assign) NSInteger turnsTaken;



-(IBAction)cardClicked:(id)sender;
-(void)flipCardsBack;
-(IBAction)quitGame:(id)sender;

@end
