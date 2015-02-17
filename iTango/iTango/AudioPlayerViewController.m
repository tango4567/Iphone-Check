//
//  AudioPlayerViewController.m
//  iTango
//
//  Created by mangal on 25/11/14.
//  Copyright (c) 2014 cdac. All rights reserved.
//

#import "AudioPlayerViewController.h"

@interface AudioPlayerViewController ()

@end

@implementation AudioPlayerViewController
@synthesize  player;
@synthesize timer;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSURL* url = [[NSBundle mainBundle] URLForResource:@"" withExtension:@"mp3"];
    NSAssert(url, @"URL is Valid");
    NSError* error = nil;
    self.player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:&error];
    if (!self.player) {
        NSLog(@"error in player creation");
    }
    
    self.currentTimeSlider.minimumValue=0.0;
    self.currentTimeSlider.maximumValue=self.player.duration;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)playButtonAction:(id)sender {
    [self.player play];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
}

- (IBAction)pauseButtonAction:(id)sender {
    [self.player pause];
    [self stopTimer];
    [self updateDisplay];
}

- (IBAction)stopButtonAction:(id)sender {
    [self.player stop];
    [self stopTimer];
    [self updateDisplay];
}

- (IBAction)currentTimeSliderTouchUpInside:(id)sender {
    [self.player stop];
    self.player.currentTime = self.player.currentTime = self.currentTimeSlider.value;
    [self.player prepareToPlay];
    [self playButtonAction:self];
}

- (IBAction)currentTimeSliderValueChanged:(id)sender {
    if (self.timer) {
        [self stopTimer];
        [self updateSliderLabels];
    }
}

-(void)timerFired:(NSTimer*)timer
{
    [self updateDisplay];
}

-(void)stopTimer
{
    [self.timer invalidate];
    self.timer = nil;
}

-(void)updateDisplay
{
    NSTimeInterval currentTime = self.player.currentTime ;
    self.currentTimeSlider.value = currentTime;
    [self updateSliderLabels];
}

-(void)updateSliderLabels
{
    NSTimeInterval currentTime = self.currentTimeSlider.value;
    NSString* currentTimeString = [NSString stringWithFormat:@"%.02f",currentTime];
    self.elapsedTimeLabel.text = currentTimeString;
    self.remainingTImeLabel.text = [NSString stringWithFormat:@"%.02f",self.player.duration - currentTime];
    
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    [self stopTimer];
    [self updateDisplay];
}

/* if an error occurs while decoding it will be reported to the delegate. */
- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error
{
    [self stopTimer];
    [self updateDisplay];
}


@end
