//
//  TangoViewController.m
//  iTango
//
//  Created by mangal on 25/11/14.
//  Copyright (c) 2014 cdac. All rights reserved.
//

#import "TangoViewController.h"

@interface TangoViewController ()

@end

@implementation TangoViewController
{
    NSArray *tableData;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	 tableData = [NSArray arrayWithObjects:@"Audio Player",@"Audio Recoder",@"Video Player",@"Video Recoder",@"Tapping Game",@"User Position",@"Map", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *TableIdentifier = @"TableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:	TableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableIdentifier];
    }
    
    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==0)
    {
        AudioPlayerViewController *audioplayerviewController = [[AudioPlayerViewController alloc]initWithNibName:@"AudioPlayerViewController" bundle:nil];
        [self.navigationController pushViewController:audioplayerviewController animated:YES];
    }
    if(indexPath.row==1)
    {
        AudioRecoderViewController *audiorecoderviewcontroller= [[AudioRecoderViewController alloc]initWithNibName:@"AudioRecoderViewController" bundle:nil];
        [self.navigationController pushViewController:audiorecoderviewcontroller animated:YES];
    }
    if(indexPath.row==2)
    {
        VPlayerViewController *videorecoderviewcontroller= [[ VPlayerViewController alloc]initWithNibName:@"VPlayerViewController" bundle:nil];
        [self.navigationController pushViewController:videorecoderviewcontroller animated:YES];
    }
    if(indexPath.row==3)
    {
        VideoRecoderViewController *videorecoderviewcontroller= [[ VideoRecoderViewController alloc]initWithNibName:@" VideoRecoderViewController" bundle:nil];
        [self.navigationController pushViewController:videorecoderviewcontroller animated:YES];
   }
   if(indexPath.row==4)
   {
       GameViewController *gamviewcontroller=[[GameViewController alloc] initWithNibName:@"GameViewController" bundle:nil];
       [self.navigationController pushViewController:gamviewcontroller animated:YES];
   }

    
}
@end
