//
//  HSViewController.m
//  MemoryGame
//
//  Created by HerpDerp on 12/16/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//
//  View controller for the high score view. Saves high scores into the Highscores.plist file.
//  and handles the logic of how to save high scores properly

#import "HSViewController.h"
#import "SwitchViewController.h"

@implementation HSViewController

@synthesize test;
@synthesize name0,name1,name2,name3,name4;
@synthesize score0,score1,score2,score3,score4;
//@synthesize nameLabelArray,scoreLabelArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)backToMenu:(id)sender{
    [SwitchViewController switchToMenu];
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

-(void)viewWillAppear:(BOOL)animated{
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *filePath = [bundle pathForResource:@"HighScores" ofType:@"plist"];
    
    NSMutableDictionary* plistDict = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    
    name0.text = [[plistDict objectForKey:@"Score0"] objectAtIndex:0];
    score0.text = [[plistDict objectForKey:@"Score0"] objectAtIndex:1];
    
    name1.text = [[plistDict objectForKey:@"Score1"] objectAtIndex:0];
    score1.text = [[plistDict objectForKey:@"Score1"] objectAtIndex:1];
    
    name2.text = [[plistDict objectForKey:@"Score2"] objectAtIndex:0];
    score2.text = [[plistDict objectForKey:@"Score2"] objectAtIndex:1];
    
    name3.text = [[plistDict objectForKey:@"Score3"] objectAtIndex:0];
    score3.text = [[plistDict objectForKey:@"Score3"] objectAtIndex:1];
    
    name4.text = [[plistDict objectForKey:@"Score4"] objectAtIndex:0];
    score4.text = [[plistDict objectForKey:@"Score4"] objectAtIndex:1];
    
    
    [super viewWillAppear:animated];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
   
    [super viewDidLoad];
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
