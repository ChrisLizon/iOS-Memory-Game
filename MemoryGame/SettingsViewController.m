//
//  SettingsViewController.m
//  MemoryGame
//
//  Created by Guest User on 11-12-16.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "SettingsViewController.h"
#import "SwitchViewController.h"
#import "AppDelegate.h"

@implementation SettingsViewController
@synthesize musicSwitch,soundSwitch;


-(IBAction)backToMenu:(id)sender{
    [SwitchViewController switchToMenu];
}

-(IBAction)toggleMusic:(id)sender{
    [AppDelegate toggleMusic];
    if(![AppDelegate getMusic]){
        self.musicSwitch.on=false;
    }else{
        self.musicSwitch.on=true;
    }
}

-(IBAction)toggleSound:(id)sender{
    [AppDelegate toggleSound];
    if(![AppDelegate getSound])
        self.soundSwitch.on=false;
    else
        self.soundSwitch.on=true;
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
    if(![AppDelegate getMusic]){
        self.musicSwitch.on=false;
    }else{
        self.musicSwitch.on=true;
    }
    if(![AppDelegate getSound])
        self.soundSwitch.on=false;
    else
        self.soundSwitch.on=true;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:true];
    if(![AppDelegate getMusic]){
        self.musicSwitch.on=false;
    }else{
        self.musicSwitch.on=true;
    }
    if(![AppDelegate getSound])
        self.soundSwitch.on=false;
    else
        self.soundSwitch.on=true;
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
