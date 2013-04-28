//
//  HSViewController.m
//  MemoryGame
//
//  Created by HerpDerp on 12/16/11.
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
    
//    NSBundle *bundle = [NSBundle mainBundle];
//    NSString *filePath = [bundle pathForResource:@"HighScores" ofType:@"plist"];
    
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath =  [documentsDirectory stringByAppendingPathComponent:@"/HighScores.plist"];
    NSLog(@"plist location: %@", filePath);
    
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
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        CGSize result = [[UIScreen mainScreen] bounds].size;
        if(result.height == 480)
        {
            // iPhone Classic
            [[NSBundle mainBundle] loadNibNamed:@"HSViewController" owner:self options:nil];
        }
        if(result.height == 568)
        {
            // iPhone 5
            [[NSBundle mainBundle] loadNibNamed:@"HSViewController-5" owner:self options:nil];
        }
    }
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
