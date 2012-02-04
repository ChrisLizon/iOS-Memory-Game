//
//  MPViewController.h
//  MemoryGame
//
//  Created by HerpDerp on 12/15/11.
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
-(IBAction)ipFieldDoneEditing:(id)sender;
-(IBAction)portFieldDoneEditing:(id)sender;

-(IBAction)toggleHost:(id)sender;

-(IBAction)startGame:(id)sender;
-(IBAction)joinGame:(id)sender;

@end
