//
//  TabBar.h
//  tabview
//
//  Created by bappy on 3/26/16.
//  Copyright © 2016 bGlobal. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TabBar;
@protocol SupportDelegate<UITabBarDelegate>
- (instancetype)process;
@end
@interface TabBar : UITabBar

//id<SupportDelegate> obj ;
@property(weak,nonatomic)id <SupportDelegate> delegate;
@property (strong, nonatomic) UITabBar *tapbar;
@end
