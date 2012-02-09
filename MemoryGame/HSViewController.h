//
//  HSViewController.h
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
