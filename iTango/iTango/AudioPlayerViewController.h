//
//  AudioPlayerViewController.h
//  iTango
//
//  Created by mangal on 25/11/14.
//  Copyright (c) 2014 cdac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface AudioPlayerViewController : UIViewController <AVAudioPlayerDelegate>
{
    AVAudioPlayer* player;
    
    NSTimer* timer;

}
@property(nonatomic,retain) NSTimer *timer;
@property(nonatomic,retain) AVAudioPlayer *player;
@property (strong, nonatomic) IBOutlet UISlider *currentTimeSlider;
@property (strong, nonatomic) IBOutlet UILabel *elapsedTimeLabel;
@property (strong, nonatomic) IBOutlet UILabel *remainingTImeLabel;
@property (strong, nonatomic) IBOutlet UIButton *stopButton;
@property (strong, nonatomic) IBOutlet UIButton *pauseButton;
@property (strong, nonatomic) IBOutlet UIButton *playButton;

- (IBAction)playButtonAction:(id)sender;
- (IBAction)pauseButtonAction:(id)sender;
- (IBAction)stopButtonAction:(id)sender;
- (IBAction)currentTimeSliderTouchUpInside:(id)sender;
- (IBAction)currentTimeSliderValueChanged:(id)sender;
@end
