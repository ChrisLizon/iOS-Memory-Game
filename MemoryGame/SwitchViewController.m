//
//  SwitchViewController.m
//  MemoryGame
//
//  Created by Guest User on 11-12-02.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "SwitchViewController.h"
#import "MenuViewController.h"
#import "GameViewController.h"

@implementation SwitchViewController

@synthesize gameViewController;
@synthesize menuViewController;

static SwitchViewController *instance = NULL;

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    instance = self;
    self.menuViewController  = [[MenuViewController alloc] initWithNibName:@"MenuView" bundle:nil];
    self.gameViewController = [[GameViewController alloc] initWithNibName:@"GameViewController" bundle:nil];
    [self.view insertSubview:menuViewController.view atIndex:0];

    [super viewDidLoad];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


+ (void) switchToGame{
    

        
        if (instance.gameViewController.view.superview == nil)
        {
            if (instance.gameViewController == nil)
            {
                instance.gameViewController =
                [[GameViewController alloc] initWithNibName:@"GameViewController" bundle:nil];
                
            }
            
            
            [UIView transitionWithView:instance.view duration:0.5 options: UIViewAnimationOptionTransitionFlipFromRight animations:^{
                
           
            [instance.gameViewController viewWillAppear:YES];
            [instance.menuViewController viewWillDisappear:YES];
            
            [instance.menuViewController.view removeFromSuperview];
            [instance.view insertSubview:instance.gameViewController.view atIndex:0];
            
            [instance.menuViewController viewDidDisappear:YES];
            [instance.gameViewController viewDidAppear:YES];
                
            } completion:nil];

        }
        
    
    
}

+(void) switchToMenu{
    
    if(instance != NULL){
        
        if (instance.menuViewController.view.superview == nil)
        {
            if (instance.menuViewController == nil)
            {
                instance.menuViewController =
                [[MenuViewController alloc] initWithNibName:@"MenuView" bundle:nil];
                
            }


            [UIView transitionWithView:instance.view duration:0.5 options: UIViewAnimationOptionTransitionFlipFromLeft animations:^{

            [instance.menuViewController viewWillAppear:YES];
            [instance.gameViewController viewWillDisappear:YES];
            
            [instance.gameViewController.view removeFromSuperview];
            [instance.view insertSubview:instance.menuViewController.view atIndex:0];
            
            [instance.gameViewController viewDidDisappear:YES];
            [instance.menuViewController viewDidAppear:YES];
            
            } completion:nil];
            

        }
        
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
