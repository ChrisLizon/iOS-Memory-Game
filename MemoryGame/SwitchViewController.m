//
//  SwitchViewController.m
//  MemoryGame
//
//  Created by Guest User on 11-12-02.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//
//  This class controls the switching of every single view in the game
//

#import "SwitchViewController.h"
#import "MenuViewController.h"
#import "GameViewController.h"
#import "InfoViewController.h"
#import "NetworkGameController.h"
#import "MPViewController.h"
#import "SettingsViewController.h"
#import "HSViewController.h"

@implementation SwitchViewController

@synthesize gameViewController;
@synthesize menuViewController;
@synthesize infoViewController;
@synthesize mpViewController;
@synthesize netGameController;
@synthesize settingsViewController;
@synthesize hsViewController;

static SwitchViewController *instance = NULL;

static NSInteger port;
static NSString *host;

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    instance = self;
    self.menuViewController  = [[MenuViewController alloc] initWithNibName:@"MenuView" bundle:nil];
//    self.gameViewController = [[GameViewController alloc] initWithNibName:@"GameViewController" bundle:nil];
//    self.infoViewController = [[InfoViewController alloc] initWithNibName:@"InfoViewController" bundle:nil];
//    self.mpViewController = [[MPViewController alloc] initWithNibName:@"MPViewController" bundle:nil];
//    self.settingsViewController=[[SettingsViewController alloc] initWithNibName:@"SettingsViewController" bundle:nil];
    [self.view insertSubview:menuViewController.view atIndex:0];

    [super viewDidLoad];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        port = 9999;
        host = @"192.168.69.145";
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
            [instance.infoViewController viewWillDisappear:YES];
            [instance.settingsViewController viewWillDisappear:YES];
            
            [instance.menuViewController.view removeFromSuperview];
            [instance.infoViewController.view removeFromSuperview];
            [instance.settingsViewController.view removeFromSuperview];
            [instance.view insertSubview:instance.gameViewController.view atIndex:0];
            
            [instance.menuViewController viewDidDisappear:YES];
            [instance.infoViewController viewDidDisappear:YES];
            [instance.settingsViewController viewDidDisappear:YES];
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
            [instance.menuViewController viewWillAppear:YES];
            [instance.gameViewController viewWillDisappear:YES];
            [instance.infoViewController viewWillDisappear:YES];
            [instance.mpViewController viewWillDisappear:YES];
            [instance.netGameController viewWillDisappear:YES];
            [instance.settingsViewController viewWillDisappear:YES];
            [instance.hsViewController viewWillDisappear:YES];

            [UIView transitionWithView:instance.view duration:0.5 options: UIViewAnimationOptionTransitionFlipFromLeft animations:^{

                [instance.gameViewController.view removeFromSuperview];
                [instance.infoViewController.view removeFromSuperview];
                [instance.mpViewController.view removeFromSuperview];
                [instance.netGameController.view removeFromSuperview];
                [instance.settingsViewController.view removeFromSuperview];
                [instance.hsViewController.view removeFromSuperview];
                [instance.view insertSubview:instance.menuViewController.view atIndex:0];
                
                [instance.mpViewController viewDidDisappear:YES];
                [instance.gameViewController viewDidDisappear:YES];
                [instance.infoViewController viewDidDisappear:YES];
                [instance.netGameController viewDidDisappear:YES];
                [instance.settingsViewController viewDidDisappear:YES];
                [instance.menuViewController viewDidAppear:YES];
                [instance.hsViewController viewDidDisappear:YES];
            
            } completion:nil];
            

        }
        
    }
    
}

+(void)switchToInfo{
    if (instance.infoViewController.view.superview == nil)
    {
        
        if (instance.infoViewController == nil)
        {
            instance.infoViewController =
            [[InfoViewController alloc] initWithNibName:@"InfoViewController" bundle:nil];
            
        }
        
        [UIView transitionWithView:instance.view duration:0.5 options: UIViewAnimationOptionTransitionFlipFromRight animations:^{
            
            [instance.infoViewController viewWillAppear:YES];
            [instance.gameViewController viewWillDisappear:YES];
            [instance.menuViewController viewWillDisappear:YES];
            [instance.settingsViewController viewWillDisappear:YES];
            
            [instance.menuViewController.view removeFromSuperview];
            [instance.gameViewController.view removeFromSuperview];
            [instance.settingsViewController.view removeFromSuperview];
            [instance.view insertSubview:instance.infoViewController.view atIndex:0];
            
            [instance.menuViewController viewDidDisappear:YES];
            [instance.gameViewController viewDidDisappear:YES];
            [instance.settingsViewController viewDidDisappear:YES];
            [instance.infoViewController viewDidAppear:YES];
            
        } completion:nil];
    }
}

+(void)switchToMultiplayer{
    if (instance.mpViewController.view.superview == nil)
    {
        
        if (instance.mpViewController == nil)
        {
            instance.mpViewController =
            [[MPViewController alloc] initWithNibName:@"MPViewController" bundle:nil];
            
        }
        
        [UIView transitionWithView:instance.view duration:0.5 options: UIViewAnimationOptionTransitionFlipFromRight animations:^{
            
            [instance.mpViewController viewWillAppear:YES];
            [instance.gameViewController viewWillDisappear:YES];
            [instance.menuViewController viewWillDisappear:YES];
            
            [instance.menuViewController.view removeFromSuperview];
            [instance.gameViewController.view removeFromSuperview];
            [instance.view insertSubview:instance.mpViewController.view atIndex:0];
            
            [instance.menuViewController viewDidDisappear:YES];
            [instance.gameViewController viewDidDisappear:YES];
            [instance.infoViewController viewDidDisappear:YES];
            [instance.mpViewController viewDidAppear:YES];
            
        } completion:nil];
    }
}

+(void)switchToNetworkGame{
    if (instance.netGameController.view.superview == nil)
    {
        
        //if (instance.netGameController == nil)
//        {
//            instance.netGameController =
//            [[NetworkGameController alloc] initWithNibName:@"GameViewController" bundle:nil];
//            
//        }
        
        instance.netGameController =
            [[NetworkGameController alloc] initWithNibName:@"GameViewController" bundle:nil];
        
        [UIView transitionWithView:instance.view duration:0.5 options: UIViewAnimationOptionTransitionFlipFromRight animations:^{
            
            [instance.mpViewController viewWillDisappear:YES];
            //[instance.netGameController viewWillAppear:YES];
            
            [instance.mpViewController.view removeFromSuperview];
            [instance.view insertSubview:instance.netGameController.view atIndex:0];
            
            [instance.mpViewController viewDidDisappear:YES];
            //[instance.netGameController viewDidAppear:YES];

            
        } completion:nil];
    }
}

+(void)switchToSettings{
    if (instance.settingsViewController.view.superview == nil)
    {
        
        if (instance.settingsViewController == nil)
        {
            instance.settingsViewController =
            [[SettingsViewController alloc] initWithNibName:@"SettingsViewController" bundle:nil];
            
        }
        
        [UIView transitionWithView:instance.view duration:0.5 options: UIViewAnimationOptionTransitionFlipFromRight animations:^{
            
            [instance.settingsViewController viewWillAppear:YES];
            [instance.gameViewController viewWillDisappear:YES];
            [instance.menuViewController viewWillDisappear:YES];
            [instance.infoViewController viewWillDisappear:YES];
            
            [instance.menuViewController.view removeFromSuperview];
            [instance.gameViewController.view removeFromSuperview];
            [instance.infoViewController.view removeFromSuperview];
            [instance.view insertSubview:instance.settingsViewController.view atIndex:0];
            
            [instance.menuViewController viewDidDisappear:YES];
            [instance.gameViewController viewDidDisappear:YES];
            [instance.infoViewController viewDidDisappear:YES];
            [instance.settingsViewController viewDidAppear:YES];
            
        } completion:nil];
    }
}

+(void)switchToHighScore{
    if (instance.hsViewController.view.superview == nil)
    {
        
        if (instance.hsViewController == nil)
        {
            instance.hsViewController =
            [[HSViewController alloc] initWithNibName:@"HSViewController" bundle:nil];
            
        }
        
        [instance.menuViewController viewWillDisappear:YES];
        [instance.hsViewController viewWillAppear:YES];
        
        [UIView transitionWithView:instance.view duration:0.5 options: UIViewAnimationOptionTransitionFlipFromRight animations:^{
            

            [instance.menuViewController.view removeFromSuperview];
          
            [instance.view insertSubview:instance.hsViewController.view atIndex:0];
            
            [instance.menuViewController viewDidDisappear:YES];
            [instance.hsViewController viewDidAppear:YES];
            
        } completion:nil];
    }
}


+ (NSString*)getHost{

    return host;
}
+ (void)setHost:(NSString*)hostname{

    host = hostname;
}
+ (NSInteger)getPort{

    return port;
}

+ (void)setPort:(NSInteger)portNumber{
    port = portNumber;
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
