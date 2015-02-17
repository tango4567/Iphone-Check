//
//  GameViewController.m
//  iTango
//
//  Created by mangal on 25/11/14.
//  Copyright (c) 2014 cdac. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_tile.png"]];
    [self.scorelabel setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"field_score.png"]]];
    
    buttonbeep= [self setupAudioPlayerwithfile:@"ButtonTap" type:@"wav"];
    backgroundbeep= [self setupAudioPlayerwithfile:@"HallOfTheMountainKing" type:@"mp3"];
    secondbeep= [self setupAudioPlayerwithfile:@"SecondBeep" type:@"wav"];
    [self setupgame];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapmebutton:(id)sender {
    
    count++;
    if (seconds!=0) {
        
        self.scorelabel.text=[NSString stringWithFormat:@"Score: %li",(long)count];
    }
    [buttonbeep play];
}

-(AVAudioPlayer*)setupAudioPlayerwithfile:(NSString*)file type:(NSString*)type
{
    
    
    NSString* path=[[NSBundle mainBundle]pathForResource:file ofType:type];
    NSURL* url=[NSURL fileURLWithPath:path];
    NSError* error;
    AVAudioPlayer* audioplayer =[[AVAudioPlayer alloc]initWithContentsOfURL:url error:&error];
    if(!audioplayer)
    {
        
        
        NSLog(@"%@",[error description]);
    }
    
    return audioplayer;
    
    
}
-(void)setupgame
{
    seconds =30 ;
    count=0;
    
    self.timerlabel.text=[NSString stringWithFormat:@"Time:%li",(long)seconds];
    self.scorelabel.text=[NSString stringWithFormat:@"Score:%li",(long)count];
    
    timer=[NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(subtracttime) userInfo:nil repeats:YES];
    [backgroundbeep setVolume:0.3];
    [backgroundbeep play];
    
}

-(void)subtracttime
{
    seconds--;
    self.timerlabel.text=[NSString stringWithFormat:@"Time:%li",(long)seconds];
    if(seconds==0)
    {
        [timer invalidate];
        
    }
    [secondbeep play];
}
@end
