//
//  GameViewController.h
//  iTango
//
//  Created by mangal on 25/11/14.
//  Copyright (c) 2014 cdac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AVFoundation/AVFoundation.h"
@interface GameViewController : UIViewController<UIAlertViewDelegate>
{
    NSInteger count;
    NSInteger seconds;
    NSTimer *timer;
    AVAudioPlayer * buttonbeep;
    AVAudioPlayer * secondbeep;
    AVAudioPlayer * backgroundbeep;
    
}
@property (strong, nonatomic) IBOutlet UILabel *timerlabel;
- (IBAction)tapmebutton:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *scorelabel;
@property (strong, nonatomic) IBOutlet UIButton *buttonlabel;

@end
