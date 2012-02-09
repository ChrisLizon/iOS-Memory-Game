//
//  AppDelegate.m
//  MemoryGame
//
//  Created by Guest User on 11-11-15.
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



#import "AppDelegate.h"

#import "SwitchViewController.h"


@implementation AppDelegate

@synthesize window;
@synthesize switchViewController;

static AVAudioPlayer *musicPlayer;
static bool music,sound;//The current values of music and sound
static bool hardSetMusic, hardSetSound;//The user defined choice for music and sound

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    music=sound=hardSetSound=hardSetMusic=true;
    
    //Load up the audio
    NSURL *url=[NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/Theme.mp3",[[NSBundle mainBundle]resourcePath]]];
    NSError *error;
    musicPlayer=[[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    musicPlayer.numberOfLoops=-1;
    [musicPlayer prepareToPlay];
    if(musicPlayer !=nil)
     [musicPlayer play];
     
    
    switchViewController = [[SwitchViewController alloc] initWithNibName:@"SwitchViewController" bundle:nil];
    // Override point for customization after application launch.
	self.window.rootViewController = switchViewController;
    [self.window makeKeyAndVisible];
    
    

    return YES;
}

+(void)toggleMusic{
    if(music)
        music=false;
    else
        music=true;
    if([musicPlayer isPlaying])
        [musicPlayer stop];
    else
        [musicPlayer play];
}
+(void)toggleSound{
    if(sound)
        sound=false;
    else
        sound=true;
}
+(void)toggleHardMusic{
    if(hardSetMusic)
        hardSetMusic=false;
    else
        hardSetMusic=true;
}
+(void)toggleHardSound{
    if(hardSetSound)
        hardSetSound=false;
    else
        hardSetSound=true;
}

+(BOOL)getMusic{return music;}

+(BOOL)getSound{return sound;}

+(BOOL)getHardMusic{return hardSetMusic;}

+(BOOL)getHardSound{return hardSetSound;}

+(void)setHardMusic:(BOOL)on{hardSetMusic=on;} 
+(void)setHardSound:(BOOL)on{hardSetSound=on;} 



+(AVAudioPlayer *)getPlayer
{
    return musicPlayer;
}

+(void)setPlayer:(AVAudioPlayer *)player{
    musicPlayer=player;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
