//
//  VPlayerViewController.m
//  iTango
//
//  Created by mangal on 25/11/14.
//  Copyright (c) 2014 cdac. All rights reserved.
//

#import "VPlayerViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface VPlayerViewController ()
@property (strong, nonatomic) MPMoviePlayerController *videoController;
@end

@implementation VPlayerViewController



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
    
    NSURL* videoURL= [[NSBundle mainBundle] URLForResource:@"Sharabi" withExtension:@"mp4"];
    
    self.videoController = [[MPMoviePlayerController alloc] init];
    
    [self.videoController setContentURL:videoURL];
    [self.videoController.view setFrame:CGRectMake (0, 0, 320, 570)];
    [self.view addSubview:self.videoController.view];
    
    [self.videoController play];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
