//
//  ViewController.h
//  ipicgroup
//
//  Created by Mind Working Asia on 3/17/16.
//  Copyright (c) 2016 Mind Working Asia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>
@property (strong, nonatomic) IBOutlet UIPickerView *picker;

@property (weak, nonatomic) IBOutlet UIImageView *bluimage;

@end

