//
//  infoViewController.m
//  ipicgroup
//
//  Created by Mind Working Asia on 4/15/16.
//  Copyright © 2016 Mind Working Asia. All rights reserved.
//

#import "infoViewController.h"

@implementation infoViewController

-(void) viewDidLoad{
    [super viewDidLoad];
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(0, 10, 80, 45)];
    NSString *str = @"<< Back";
    btn.titleLabel.font = [UIFont fontWithName:@"Cervo-Light" size:20];
    // btn.font=[UIFont fontWithName:@"Cervo-Light" size:16.0f];
    [btn setTitle:str forState:UIControlStateNormal];;
    
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(returnToPrevious:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view  addSubview:btn];
    
    
}

-(IBAction)returnToPrevious:(id)sender
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
