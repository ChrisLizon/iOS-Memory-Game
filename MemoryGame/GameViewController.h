//
//  ViewController.h
//  MemoryGame
//
//  Created by Guest User on 11-11-15.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameViewController : UIViewController

@property (retain, nonatomic) IBOutletCollection(UIButton) NSArray *imageviews;
@property (retain) IBOutlet UINavigationBar *topToolbar;
@property (retain) IBOutlet UINavigationBar *bottomToolbar;
@property (retain) NSArray *cards;
@property (retain) NSMutableArray *assignments;

@property (assign) NSInteger flippedCards;
@property (assign) NSInteger lastCardIndex;
@property (assign) NSInteger currentCardIndex;
@property (assign) NSInteger pairsFound;

-(IBAction)cardClicked:(id)sender;
-(void)flipCardsBack;


@end
