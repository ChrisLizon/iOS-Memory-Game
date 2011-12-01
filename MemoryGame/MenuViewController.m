//
//  MenuViewController.m
//  MemoryGame
//
//  Created by HerpDerp on 11/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MenuViewController.h"
#import "GameViewController.h"

@implementation MenuViewController

@synthesize gameScreen,playButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction) buttonClick:(id)sender{
    //GameViewController *gameView = [[GameViewController alloc] initWithNibName:@"GameViewController_iPhone" bundle:nil];
    //self.gameScreen = [GameViewController alloc];
    self.gameScreen = [[GameViewController alloc] initWithNibName:@"GameViewController_iPhone" bundle:nil];
    
    [self.navigationController pushViewController:gameScreen animated:YES];
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

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

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
