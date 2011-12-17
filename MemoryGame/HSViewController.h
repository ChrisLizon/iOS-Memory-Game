//
//  HSViewController.h
//  MemoryGame
//
//  Created by HerpDerp on 12/16/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HSViewController : UIViewController{
    UILabel *test;
}

@property (nonatomic,retain) IBOutlet UILabel *test;

-(IBAction)backToMenu:(id)sender;

@end
