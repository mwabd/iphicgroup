//
//  BrowserController.m
//  ipicgroup
//
//  Created by Mind Working Asia on 3/31/16.
//  Copyright © 2016 Mind Working Asia. All rights reserved.
//

#import "BrowserController.h"

@interface BrowserController ()

@end

@implementation BrowserController

- (void)viewDidLoad {
    [super viewDidLoad];
    //NSURL *url;
    
    //[[UIApplication sharedApplication] openURL:[NSURL URLWithString: self.url]];
       // Do any additional setup after loading the view.
    //[_webview loadRequest:_urlURL URLWithString: self.url]];
    NSURL *url = [NSURL URLWithString:self.url];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [_webview setScalesPageToFit:YES];
    [_webview loadRequest:request];
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
