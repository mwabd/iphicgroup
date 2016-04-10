//
//  mainscreenViewController.h
//  ipicgroup
//
//  Created by Mind Working Asia on 3/18/16.
//  Copyright © 2016 Mind Working Asia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProgressHUD.h"
@interface mainscreenViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (weak, nonatomic) IBOutlet UIImageView *imgeview;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activity;
@end
