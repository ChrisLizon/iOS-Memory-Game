//
//  MenuViewController.h
//  MemoryGame
//
//  Created by HerpDerp on 11/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "GameViewController.h"

@interface MenuViewController : UIViewController;


@property (retain,nonatomic)IBOutlet UIButton *playButton;
//@property (retain) GameViewController *gameScreen;
-(IBAction) singlePlayerGame:(id)sender;

@end
