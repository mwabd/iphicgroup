//
//  mainscreenViewController.m
//  ipicgroup
//
//  Created by Mind Working Asia on 3/18/16.
//  Copyright © 2016 Mind Working Asia. All rights reserved.
//

#import "mainscreenViewController.h"
#import "menu.h"

@interface mainscreenViewController ()

@end

@implementation mainscreenViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    }
-(BOOL)shouldAutorotate{
    return NO;
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}


- (void)buttonClicked:(UIButton*)button
{
    MenuController *addController = [[MenuController alloc] init];
    
    addController.modalPresentationStyle = UIModalPresentationFullScreen;
    addController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:addController animated:YES completion: nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
