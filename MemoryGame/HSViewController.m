//
//  HSViewController.m
//  MemoryGame
//
//  Created by HerpDerp on 12/16/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

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
    
//    NSString *tester = [[plistDict objectForKey:@"Score0"] objectAtIndex:0];
//    NSLog(@"%@",tester);
    
//    NSInteger numberOfScores = 5;
    
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
    
    
////////////////ATTEMPTS TO STREAMLINE THIS, not a priority atm///////////////////
    
//    //NSMutableArray *nameLabelArray;
//    
//    
//    [nameLabelArray addObject:name0];
//    [nameLabelArray addObject:name1];
//    [nameLabelArray addObject:name2];
//    [nameLabelArray addObject:name3];
//    [nameLabelArray addObject:name4];
//    
//    //NSMutableArray *scoreLabelArray;
//    
//    [scoreLabelArray addObject:score0];
//    [scoreLabelArray addObject:score1];
//    [scoreLabelArray addObject:score2];
//    [scoreLabelArray addObject:score3];
//    [scoreLabelArray addObject:score4];
//
////    NSMutableArray *scores;
//    for(int i =0 ; i < numberOfScores; i++){
//        NSString *data = [NSString stringWithFormat:@"Score%i",i];
//        //NSString *nameLabel = [NSString stringWithFormat:@"name%i",i];
//        //NSString *scoreLabel = [NSString stringWithFormat:@"score%i",i];
//        for(int j=0; j < 2;j++){
//
//            [nameLabelArray isKindOfClass:[UILabel class]];
//            [[nameLabelArray objectAtIndex:i] text] = [[plistDict objectForKey:data] objectAtIndex:j];
//            //[[nameLabelArray objectAtIndex:i] text] = [[plistDict objectForKey:data] objectAtIndex:j];
//            //[[nameLabelArray objectAtIndex:i] text] @"Hello"];
//        }
//        name0.text = [[plistDict objectForKey:data] objectAtIndex:0];
////        [scores addObject:[plistDict valueForKey:data]];
//    }
    
//    NSLog(@"%@",[[scores objectAtIndex:2] objectAtIndex:1]);
//    name1.text = [[scores objectAtIndex:0] objectForKey:@"Item 0"];  
    
    
    //NSString *value;
    //value = [plistDict objectForKey:@"Score1"];
    
   // printf("HELLO\n");
    //NSLog(@"%@",value);
    
    //test.text = value;
    
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
