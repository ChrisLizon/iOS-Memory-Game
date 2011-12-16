//
//  NetworkGameController.h
//  MemoryGame
//
//  Created by Guest User on 11-12-16.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NetworkGameController : UIViewController


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
-(IBAction)quitGame:(id)sender;

-(void)flipCardAtIndex:(int)index;
-(void)disableCards;
-(void)enableCards;
-(void)removeCardsAtIndex:(int)index1 andIndex:(int)index2;
-(void)flipCardsBackAtIndex:(int)index1 andIndex:(int)index2;


@end
