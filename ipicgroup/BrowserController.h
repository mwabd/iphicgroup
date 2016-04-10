//
//  BrowserController.h
//  ipicgroup
//
//  Created by Mind Working Asia on 3/31/16.
//  Copyright © 2016 Mind Working Asia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrowserController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webview;
@property (strong, nonatomic) NSString *url;
@end
