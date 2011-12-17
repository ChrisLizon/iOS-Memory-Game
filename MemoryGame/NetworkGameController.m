//
//  NetworkGameController.m
//  MemoryGame
//
//  Created by Guest User on 11-12-16.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "NetworkGameController.h"
#import "SwitchViewController.h"
#import "AppDelegate.h"
#import <stdlib.h>

@implementation NetworkGameController

@synthesize imageviews, topToolbar, bottomToolbar, cards, assignments;
@synthesize flippedCards, lastCardIndex, pairsFound, currentCardIndex;
@synthesize turnsTakenCounter,pairsFoundCounter,turnsTakenText, pairsFoundText;

@synthesize inputStream, outputStream;
@synthesize nameInput;

static bool sound;
static AVAudioPlayer *soundPlayer;

-(IBAction)volumeToggle:(id)sender{
    if(sound){
        if([AppDelegate getMusic]==true)
            [AppDelegate toggleMusic];
        if([AppDelegate getSound]==true)
            [AppDelegate toggleSound];
        sound=false;
        
        if([[AppDelegate getPlayer] isPlaying])
            [[AppDelegate getPlayer] stop];
    }else{
        sound=true;
        if([AppDelegate getMusic]==false)
            [AppDelegate toggleMusic];
        if([AppDelegate getSound]==false)
            [AppDelegate toggleSound];
        if([AppDelegate getMusic]&&[[AppDelegate getPlayer] isPlaying]==false){
            [[AppDelegate getPlayer] play];
        }
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    sound=true;
    if([AppDelegate getMusic]==false&&[AppDelegate getSound]==false){
        sound=false;
    }
    // Do any additional setup after loading the view from its nib.
    
    turnsTakenText.text = @"Opponent's Score";
    pairsFoundText.text = @"Your Score";
    
    cards = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"Card0.png"],
             [UIImage imageNamed:@"Card1.png"],
             [UIImage imageNamed:@"Card2.png"],
             [UIImage imageNamed:@"Card3.png"],
             [UIImage imageNamed:@"Card4.png"],
             [UIImage imageNamed:@"Card5.png"],
             [UIImage imageNamed:@"Card6.png"],
             [UIImage imageNamed:@"Card7.png"],
             [UIImage imageNamed:@"CardBack.png"],
             
             nil];
    
    
    for(int i = 0; i < 16; i++){
        [[imageviews objectAtIndex:i] setImage:[cards objectAtIndex:8] forState:UIControlStateDisabled];
    }
    
    assignments = [[NSMutableArray alloc]initWithCapacity:16];
    for(int i = 0; i < 16; i++){
        
        [assignments addObject:[[NSNumber alloc] initWithInt:0 ]];
    }
    
    if([AppDelegate getSound]){
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"flip" ofType:@"caf"];
        NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:filePath];
        soundPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
        soundPlayer.numberOfLoops=0;
        [soundPlayer prepareToPlay];
    }
}

- (IBAction)cardClicked:(id)sender{
    
    
    //get the car index from the UIButton's tag value.
    
    NSInteger index = [sender tag];
    //[self flipCardAtIndex:index];

    [sender setEnabled:NO];
    
    NSString *response  = [NSString stringWithFormat:@"select %d\n", index];
	NSData *data = [[NSData alloc] initWithData:[response dataUsingEncoding:NSASCIIStringEncoding]];
	[outputStream write:[data bytes] maxLength:[data length]];
    
    flippedCards ++;
    
    if(flippedCards == 2){
        currentCardIndex = index; 
        
        [self disableCards];        
        
        flippedCards = 0;
    }else{
        
        lastCardIndex = index;
    }
    
    
}

- (void) flipCardAtIndex:(int)index{
    if(sound)
        if([AppDelegate getSound]){
            NSString *filePath = [[NSBundle mainBundle] pathForResource:@"flip" ofType:@"caf"];
            NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:filePath];
            soundPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
            soundPlayer.numberOfLoops=0;
            [soundPlayer play];
        }
    
    NSLog(@"Index: %d", index);
    [[imageviews objectAtIndex:index] setImage:[cards objectAtIndex:[[assignments objectAtIndex:index] intValue]] forState:UIControlStateNormal];
    [[imageviews objectAtIndex:index] setImage:[cards objectAtIndex:[[assignments objectAtIndex:index] intValue]] forState:UIControlStateDisabled];
    

}

- (void) disableCards{
    for(int i = 0; i < 16; i++){
        
        [[imageviews objectAtIndex:i] setEnabled:NO];
        
    }
}

- (void) enableCards{
    for(int i = 0; i < 16; i++){
        
        [[imageviews objectAtIndex:i] setEnabled:YES];
        
    }
}

- (void) removeCardsAtIndex:(int)index1 andIndex:(int)index2{
    
    NSLog(@"Removing %d and %d", index1, index2);
    [[imageviews objectAtIndex:index1] setHidden: true];
    [[imageviews objectAtIndex:index2] setHidden: true];
}

- (void) flipCardsBackAtIndex:(int)index1 andIndex:(int)index2{
    //Flop sound
    if(sound)
        if([AppDelegate getSound]){
            NSString *filePath = [[NSBundle mainBundle] pathForResource:@"flop" ofType:@"caf"];
            NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:filePath];
            soundPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
            soundPlayer.numberOfLoops=0;
            [soundPlayer play];
        }
    [[imageviews objectAtIndex:index1] setImage:[cards objectAtIndex:8] forState:UIControlStateNormal];
    [[imageviews objectAtIndex:index1] setImage:[cards objectAtIndex:8] forState:UIControlStateDisabled];
    
    [[imageviews objectAtIndex:index2] setImage:[cards objectAtIndex:8] forState:UIControlStateNormal];
    [[imageviews objectAtIndex:index2] setImage:[cards objectAtIndex:8] forState:UIControlStateDisabled];

}
 
-(void)setScoreWithPlayerScore:(NSString*)player andOpponentScore:(NSString*)opponent{
    pairsFoundCounter.text = player;
    turnsTakenCounter.text = opponent;
      
}

-(void)win{


}

-(void)lose{


}


- (void)initNetworkCommunication {
    CFReadStreamRef readStream;
    CFWriteStreamRef writeStream;
    CFStreamCreatePairWithSocketToHost(NULL, (CFStringRef)@"192.168.69.145", 9999, &readStream, &writeStream);
    inputStream = (__bridge NSInputStream *)readStream;
    outputStream = (__bridge NSOutputStream *)writeStream;
    
    [inputStream setDelegate:self];
    [outputStream setDelegate:self];
    
    [inputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [outputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    [inputStream open];
    [outputStream open];
    
}

- (void)stream:(NSStream *)theStream handleEvent:(NSStreamEvent)streamEvent {
    
	switch (streamEvent) {
            
		case NSStreamEventOpenCompleted:
			NSLog(@"Stream opened");
			break;
            
		case NSStreamEventHasBytesAvailable:
			if (theStream == inputStream) {
                
                uint8_t buffer[1024];
                int len;
                
                while ([inputStream hasBytesAvailable]) {
                    len = [inputStream read:buffer maxLength:sizeof(buffer)];
                    if (len > 0) {
                        NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
                        [f setNumberStyle:NSNumberFormatterDecimalStyle];
                        
                        NSString *output = [[NSString alloc] initWithBytes:buffer length:len encoding:NSASCIIStringEncoding];
                        
                        NSArray *chunks = [output componentsSeparatedByString:@"\n"];
                        
                        for(int i = 0; i < [chunks count]; i++){
                            
                            NSString *rawcommand = [chunks objectAtIndex:i];
                            NSString *tempcommand = [rawcommand stringByReplacingOccurrencesOfString:@"\r" withString:@""];
                            NSString *command = [tempcommand stringByReplacingOccurrencesOfString:@"\n" withString:@""];

                           
                            if (command != nil && ![command isEqualToString:@""]) {
                                
                                if([command isEqualToString:@"loaded"]){
                                    //remove progress dialogs?
                                }else if([command hasPrefix:@"cardorder"]){
                                    NSArray * vals = [command componentsSeparatedByString:@" "];
                                    for(int i = 0; i< 16; i++){
                                    
                                        NSNumber * card = [f numberFromString:[vals objectAtIndex:i+1]];
                                        
                                        [assignments replaceObjectAtIndex:i withObject:card];

                                        
                                    }

                                }else if([command hasPrefix:@"flip"]){
                                    NSArray * vals = [command componentsSeparatedByString:@" "];
                                    NSNumber * test = [f numberFromString:[vals objectAtIndex:1]];
                                    NSLog(@"flipping \"%@\"", [vals objectAtIndex:1] );
                                    [self flipCardAtIndex: [test integerValue]];
                                        
                                }else if([command hasPrefix:@"remove"]){
                                    
                                    NSArray * vals = [command componentsSeparatedByString:@" "];
                                    [self removeCardsAtIndex:[[f numberFromString:[vals objectAtIndex:1]] integerValue]
                                                      andIndex:[[f numberFromString:[vals objectAtIndex:2]] integerValue]];
                                        
                                }else if([command hasPrefix:@"flop"]){
                                    
                                    NSArray * vals = [command componentsSeparatedByString:@" "];
                                    [self flipCardsBackAtIndex:[[f numberFromString:[vals objectAtIndex:1]] integerValue]
                                                      andIndex:[[f numberFromString:[vals objectAtIndex:2]] integerValue]];
                                    
                                }else if([command hasPrefix:@"enableall"]){
                                    [self enableCards];
                                    
                                }else if([command hasPrefix:@"disableall"]){
                                    [self disableCards];
                                }else if([command hasPrefix:@"win"]){
                                    [self win];
                                    
                                }else if([command hasPrefix:@"lose"]){
                                    [self lose];
                                }else if([command hasPrefix:@"score"]){
                                    NSArray * vals = [command componentsSeparatedByString:@" "];
                                    [self setScoreWithPlayerScore:[vals objectAtIndex:1]
                                                      andOpponentScore:[vals objectAtIndex:2]];
                                }
                                
                                
                                NSLog(@"server said: %@", command);
                            }
                        }
//                        
//                        if (nil != output) {
//                            NSLog(@"server said: %@", output);
//                        }
                    }
                }
            }
            break;			
            
		case NSStreamEventErrorOccurred:
            //TELL THE USER THE CONNECTION DROPPED
			NSLog(@"Can not connect to the host!");
			break;
            
		case NSStreamEventEndEncountered:
			break;
            
		//default:
			//NSLog(@"Unknown event");
	}
    
}


- (IBAction)quitGame:(id)sender{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Quit game" 
                                                    message:@"Are you sure?" 
                                                   delegate:self
                                          cancelButtonTitle:@"Yes" 
                                          otherButtonTitles:@"No",nil];
    [alert show];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    sound=true;
    if([AppDelegate getMusic]==false&&[AppDelegate getSound]==false){
        sound=false;
    }
        [self initNetworkCommunication];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == [alertView cancelButtonIndex]){
   
        
        NSString *response  = @"quit\n";
        NSData *data = [[NSData alloc] initWithData:[response dataUsingEncoding:NSASCIIStringEncoding]];
        [outputStream write:[data bytes] maxLength:[data length]];
        
        //TEAR DOWN SOCKET

        [SwitchViewController switchToMenu];
        
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
