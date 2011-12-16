//
//  SettingsViewController.h
//  MemoryGame
//
//  Created by Guest User on 11-12-16.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController
@property (retain,nonatomic)IBOutlet UISwitch *musicSwitch;
@property (retain,nonatomic)IBOutlet UISwitch *soundSwitch;
-(IBAction)backToMenu:(id)sender;
-(IBAction)toggleMusic:(id)sender;
-(IBAction)toggleSound:(id)sender;
@end
