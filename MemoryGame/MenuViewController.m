//
//  MenuViewController.m
//  MemoryGame
//
//  Created by HerpDerp on 11/30/11.
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


#import "MenuViewController.h"
//#import "GameViewController.h"
#import "SwitchViewController.h"
//#import "AppDelegate.h"

@implementation MenuViewController

@synthesize playButton;

- (void)loadView
{
    [super viewDidLoad];
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        CGSize result = [[UIScreen mainScreen] bounds].size;
        if(result.height == 480)
        {
            // iPhone Classic
            [[NSBundle mainBundle] loadNibNamed:@"MenuView" owner:self options:nil];
        }
        if(result.height == 568)
        {
            // iPhone 5
            [[NSBundle mainBundle] loadNibNamed:@"MenuView-5" owner:self options:nil];
        }
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction) singlePlayerGame:(id)sender{
    
//    AppDelegate *mainDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//	[mainDelegate goToGame];
    
    [SwitchViewController switchToGame];
    
    //AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    //[appDelegate.switchViewController switchToGame];
}

-(IBAction) infoScreen:(id)sender{
    [SwitchViewController switchToInfo];
}

-(IBAction) settingsScreen:(id)sender{
    [SwitchViewController switchToSettings];
}

-(IBAction)mpScreen:(id)sender{
    //[SwitchViewController switchToMultiplayer];
    
    // Keep alert until Multiplayer is finished.  Currently is not fully implemented. 
    UIAlertView *mpAlert = [[UIAlertView alloc] initWithTitle:@"Multiplayer Coming Soon!" message:@"Multiplayer is currently in development.  Please check back soon!" delegate:self cancelButtonTitle:@"Okay!" otherButtonTitles:nil, nil];
    
    [mpAlert show];
}

-(IBAction)hsScreen:(id)sender{
    [SwitchViewController switchToHighScore];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)createEditableCopyOfPlistIfNeeded
{
    // First, test for existence.
    BOOL success;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *writablePath = [documentsDirectory stringByAppendingPathComponent:@"HighScores.plist"];
    success = [fileManager fileExistsAtPath:writablePath];
    
    if (success)
        return;
    
    // The writable file does not exist, so copy from the bundle to the appropriate location.
    NSString *defaultPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"HighScores.plist"];
    success = [fileManager copyItemAtPath:defaultPath toPath:writablePath error:&error];
    if (!success)
        NSAssert1(0, @"Failed to create writable file with message '%@'.", [error localizedDescription]);
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
    [self createEditableCopyOfPlistIfNeeded];
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
