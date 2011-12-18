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
    UILabel *name0,*name1,*name2,*name3,*name4;
    UILabel *score0,*score1,*score2,*score3,*score4;
}

@property (nonatomic,retain) IBOutlet UILabel *test;
@property (nonatomic,retain) IBOutlet UILabel *name0,*name1,*name2,*name3,*name4;
@property (nonatomic,retain) IBOutlet UILabel *score0,*score1,*score2,*score3,*score4;
//@property (nonatomic,retain) NSMutableArray *nameLabelArray,*scoreLabelArray;

-(IBAction)backToMenu:(id)sender;

@end
