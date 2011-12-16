//
//  NetworkGameController.m
//  MemoryGame
//
//  Created by Guest User on 11-12-16.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "NetworkGameController.h"
#import "SwitchViewController.h"
#import <stdlib.h>

@implementation NetworkGameController

@synthesize imageviews, topToolbar, bottomToolbar, cards, assignments;
@synthesize flippedCards, lastCardIndex, pairsFound, currentCardIndex;
@synthesize turnsTakenLabel,pairsFoundLabel,turnsTaken;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
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
    
}

- (IBAction)cardClicked:(id)sender{
    
    //get the car index from the UIButton's tag value.
    
    NSInteger index = [sender tag];
    [self flipCardAtIndex:index];

    [sender setEnabled:NO];
    
    //TODO SEND SELECT OVER SOCKET
    
    flippedCards ++;
    
    if(flippedCards == 2){
        currentCardIndex = index; 
        
        [self disableCards];        
        
        flippedCards = 0;
    }else{
        
        lastCardIndex = index;
    }
    
    
}

- (void) flipCardAtIndex:(int)index{
    
    [[imageviews objectAtIndex:index] setImage:[cards objectAtIndex:[[assignments objectAtIndex:index] intValue]] forState:UIControlStateNormal];
    [[imageviews objectAtIndex:index] setImage:[cards objectAtIndex:[[assignments objectAtIndex:index] intValue]] forState:UIControlStateDisabled];
    

}

- (void) disableCards{
    for(int i = 0; i < 16; i++){
        
        [[imageviews objectAtIndex:i] setEnabled:NO];
        
    }
}

- (void) enableCards{
    for(int i = 0; i < 16; i++){
        
        [[imageviews objectAtIndex:i] setEnabled:YES];
        
    }
}

- (void) removeCardsAtIndex:(int)index1 andIndex:(int)index2{
    [[imageviews objectAtIndex:index1] setHidden: true];
    [[imageviews objectAtIndex:index2] setHidden: true];
}

- (void) flipCardsBackAtIndex:(int)index1 andIndex:(int)index2{
    [[imageviews objectAtIndex:index1] setImage:[cards objectAtIndex:8] forState:UIControlStateNormal];
    [[imageviews objectAtIndex:index1] setImage:[cards objectAtIndex:8] forState:UIControlStateDisabled];
    
    [[imageviews objectAtIndex:index2] setImage:[cards objectAtIndex:8] forState:UIControlStateNormal];
    [[imageviews objectAtIndex:index2] setImage:[cards objectAtIndex:8] forState:UIControlStateDisabled];

}

- (IBAction)quitGame:(id)sender{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Quit game" 
                                                    message:@"Are you sure?" 
                                                   delegate:self
                                          cancelButtonTitle:@"Yes" 
                                          otherButtonTitles:@"No",nil];
    [alert show];
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == [alertView cancelButtonIndex]){
        //TODO SEND QUIT OVER SOCKET
        //TEAR DOWN SOCKET
        
        [SwitchViewController switchToMenu];
        
    }
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
