//
//  SeeAllController.h
//  ipicgroup
//
//  Created by Mind Working Asia on 4/4/16.
//  Copyright © 2016 Mind Working Asia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DOPNavbarMenu.h"
#import  "menu.h"
@interface SeeAllController : UIViewController
@property (weak, nonatomic) IBOutlet UITabBar *tapbar;
@property (weak, nonatomic) IBOutlet UICollectionView *myclubcollectionViewConroller;
@property (strong, nonatomic) NSString *selectedItem;
@end
