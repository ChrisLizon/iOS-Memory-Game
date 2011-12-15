//
//  MPViewController.m
//  MemoryGame
//
//  Created by HerpDerp on 12/15/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MPViewController.h"
#import "SwitchViewController.h"

@implementation MPViewController

@synthesize sControl,ipField,portField,joinGameButton,startGameButton;

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

-(IBAction)ipFieldDoneEditing:(id)sender{
    [sender resignFirstResponder];
}

-(IBAction)portFieldDoneEditing:(id)sender{
    [sender resignFirstResponder];
}

- (IBAction)backgroundTap:(id)sender {  
    [ipField resignFirstResponder];
    [portField resignFirstResponder];
}

-(IBAction)toggleHost:(id)sender{
    if([sender selectedSegmentIndex]==1){
        ipField.hidden = FALSE;
        portField.hidden = FALSE;
        joinGameButton.hidden = FALSE;
        startGameButton.hidden = TRUE;
    } else {
        ipField.hidden = YES;
        portField.hidden = YES;
        joinGameButton.hidden = TRUE;
        startGameButton.hidden = FALSE;
    }
    
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
