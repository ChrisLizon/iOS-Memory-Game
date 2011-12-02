//
//  ViewController.m
//  MemoryGame
//
//  Created by Guest User on 11-11-15.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "GameViewController.h"
#import "AppDelegate.h"
#import "SwitchViewController.h"
#import <stdlib.h>



@implementation GameViewController


@synthesize imageviews, topToolbar, bottomToolbar, cards, assignments;
@synthesize flippedCards, lastCardIndex, pairsFound, currentCardIndex;
@synthesize turnsTakenLabel,pairsFoundLabel,turnsTaken;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    cards = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"Card0.png"],
             [UIImage imageNamed:@"Card1.png"],
             [UIImage imageNamed:@"Card2.png"],
             [UIImage imageNamed:@"Card3.png"],
             [UIImage imageNamed:@"Card4.png"],
             [UIImage imageNamed:@"Card5.png"],
             [UIImage imageNamed:@"Card6.png"],
             [UIImage imageNamed:@"Card7.png"],
             [UIImage imageNamed:@"CardBack.png"],
             
             nil];
    
    
    
    //assignments = (NSInteger*) calloc(8, sizeof(NSInteger));
    
    
    assignments = [[NSMutableArray alloc]initWithCapacity:16];
    
    
    
    for(int i = 0; i < 16; i++){
        
        [assignments addObject:[[NSNumber alloc] initWithInt:-1 ]];
    }
    
    
    for(int i = 0; i < 8; i++){
        
        for(int j = 0; j <2; j++){
            
            int randomSlot = random() % 16;
            while([[assignments objectAtIndex:randomSlot] intValue] != -1){
                randomSlot = random() % 16;
            }
            printf("Assigning %d to slot %d\n", i, randomSlot);
            [assignments replaceObjectAtIndex:randomSlot withObject:[[NSNumber alloc] initWithInteger: i]];
            printf("Slot %d now contains %d\n", randomSlot, [[assignments objectAtIndex:randomSlot] intValue]);
        }
        
    }
    
    flippedCards = 0;
    
    //    for(int i = 0; i < 8; i++){
    //    
    //        [[imageviews objectAtIndex: i] setImage: [cards objectAtIndex:i] forState:UIControlStateNormal];
    //        [[imageviews objectAtIndex: i+8] setImage: [cards objectAtIndex:i] forState:UIControlStateNormal];
    //        
    //    }
    
    
    [bottomToolbar setTintColor:[[UIColor alloc] initWithRed:.1 green:1 blue:.1 alpha:1]];

}


- (IBAction)cardClicked:(id)sender{
    
    //get the car index from the UIButton's tag value.
    
    NSInteger index = [sender tag];
    
 
    [sender setImage:[cards objectAtIndex:[[assignments objectAtIndex:index] intValue]] forState:UIControlStateNormal];
    [sender setEnabled:NO];
    flippedCards ++;
    
    if(flippedCards == 2){
        currentCardIndex = index; 
        
        //disable all the cards for the next second
        for(int i = 0; i < 16; i++){
            [[imageviews objectAtIndex:i]setEnabled:NO];
        }
        
        //set up a timer to turn the cards back over after 1 second
        [NSTimer scheduledTimerWithTimeInterval:1.0
                                         target:self 
                                       selector:@selector(flipCardsBack) 
                                       userInfo:nil 
                                        repeats:NO];
        
    
        flippedCards = 0;
    }else{
        
        lastCardIndex = index;
    }
    
    
}

- (void) flipCardsBack{
    turnsTaken++;
    if([[assignments objectAtIndex:currentCardIndex] integerValue] ==
       [[assignments objectAtIndex:lastCardIndex]integerValue]){
        [[imageviews objectAtIndex:currentCardIndex] setHidden: true];
        [[imageviews objectAtIndex:lastCardIndex] setHidden: true];
        
        pairsFound++;
        pairsFoundLabel.text = [NSString stringWithFormat:@"%i",pairsFound];
    }else{
        
        [[imageviews objectAtIndex:currentCardIndex] setImage:[cards objectAtIndex:8] forState:UIControlStateNormal];
        [[imageviews objectAtIndex:lastCardIndex] setImage:[cards objectAtIndex:8] forState:UIControlStateNormal];

    }
    turnsTakenLabel.text = [NSString stringWithFormat:@"%i",turnsTaken];

    //re-enable all the cards
    for(int i = 0; i < 16; i++){
        [[imageviews objectAtIndex:i]setEnabled:YES];
    }
    
}

- (IBAction)quitGame:(id)sender{

//    AppDelegate *mainDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//	[mainDelegate goToMenu];
    
    [SwitchViewController switchToMenu];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];


}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
