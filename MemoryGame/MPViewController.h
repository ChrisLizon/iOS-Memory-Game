//
//  MPViewController.h
//  MemoryGame
//
//  Created by HerpDerp on 12/15/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MPViewController : UIViewController{
    
    UITextField *ipField;
    UITextField *portField;
    UISegmentedControl *sControl;
    UIButton *startGameButton;
    UIButton *joinGameButton;
}

@property(nonatomic,retain) IBOutlet UISegmentedControl *sControl;
@property(nonatomic,retain) IBOutlet UITextField *ipField;
@property(nonatomic,retain) IBOutlet UITextField *portField;
@property(nonatomic,retain) IBOutlet UIButton *joinGameButton;
@property(nonatomic,retain) IBOutlet UIButton *startGameButton;


-(IBAction)backToMenu:(id)sender;
-(IBAction)backgroundTap:(id)sender;
-(IBAction)toggleHost:(id)sender;

@end
