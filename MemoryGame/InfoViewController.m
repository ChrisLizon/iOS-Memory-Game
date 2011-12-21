//
//  InfoViewController.m
//  MemoryGame
//
//  Created by Guest User on 11-12-08.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//
//  View controller for the information view controller. Has the labels with the team names 
//  and a link that launches safari into the team's website.

#import "InfoViewController.h"
#import "SwitchViewController.h"

@implementation InfoViewController
@synthesize mobiLabel;

-(IBAction)backToMenu:(id)sender{
    [SwitchViewController switchToMenu];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
    return(interfaceOrientation!=UIInterfaceOrientationPortraitUpsideDown);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	//See if touch was inside the label
	if (CGRectContainsPoint(mobiLabel.frame, [[[event allTouches] anyObject] locationInView:self.view]))
	{
		//Open webpage
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.team615.mobi"]];
	}
}
@end
