//
//  SettingsViewController.m
//  MemoryGame
//
//  Created by Guest User on 11-12-16.
/*                                                                                                                                                                              
This file is part of iOS-Memory-Game.                                                                                                                                           
                                                                                                                                                                                
    iOS-Memory-Game is free software: you can redistribute it and/or modify                                                                                                     
    it under the terms of the GNU General Public License as published by                                                                                                        
    the Free Software Foundation, either version 3 of the License, or                                                                                                           
    (at your option) any later version.                                                                                                                                         
                                                                                                                                                                                
    iOS-Memory-Game is distributed in the hope that it will be useful,                                                                                                          
    but WITHOUT ANY WARRANTY; without even the implied warranty of                                                                                                              
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the                                                                                                               
    GNU General Public License for more details.                                                                                                                                
                                                                                                                                                                                
    You should have received a copy of the GNU General Public License                                                                                                           
    along with iOS-Memory-Game.  If not, see <http://www.gnu.org/licenses/>.                                                                                                    
*/


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
    [AppDelegate toggleHardMusic];
    [AppDelegate setHardSound:self.soundSwitch.on];
    if(![AppDelegate getMusic]){
        self.musicSwitch.on=false;
    }else{
        self.musicSwitch.on=true;
    }
}

-(IBAction)toggleSound:(id)sender{
    [AppDelegate toggleSound];
    [AppDelegate toggleHardSound];
    [AppDelegate setHardMusic:self.musicSwitch.on];
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

//- (void)loadView
//{
//    [super viewDidLoad];
//    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
//    {
//        CGSize result = [[UIScreen mainScreen] bounds].size;
//        if(result.height == 480)
//        {
//            // iPhone Classic
//            [[NSBundle mainBundle] loadNibNamed:@"SettingsViewController" owner:self options:nil];
//        }
//        if(result.height == 568)
//        {
//            // iPhone 5
//            [[NSBundle mainBundle] loadNibNamed:@"SettingsViewController-5" owner:self options:nil];
//        }
//    }
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        CGSize result = [[UIScreen mainScreen] bounds].size;
        if(result.height == 480)
        {
            // iPhone Classic
            [[NSBundle mainBundle] loadNibNamed:@"SettingsViewController" owner:self options:nil];
        }
        if(result.height == 568)
        {
            // iPhone 5
            [[NSBundle mainBundle] loadNibNamed:@"SettingsViewController-5" owner:self options:nil];
        }
    }
    
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
