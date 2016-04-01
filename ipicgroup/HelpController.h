//
//  HelpController.h
//  ipicgroup
//
//  Created by Mind Working Asia on 3/22/16.
//  Copyright © 2016 Mind Working Asia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DOPNavbarMenu.h"
@interface HelpController : UIViewController<DOPNavbarMenuDelegate>
@property (weak, nonatomic) IBOutlet UITabBar *tapbar;


@property (weak, nonatomic) IBOutlet UICollectionView *mycollectionview;

@end
