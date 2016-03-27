//
//  TabBar.m
//  tabview
//
//  Created by bappy on 3/26/16.
//  Copyright © 2016 bGlobal. All rights reserved.
//

#import "TabBar.h"

@implementation TabBar

- (void)drawRect:(CGRect)rect {
    // Drawing code

    UITabBar *tabbar=[[UITabBar alloc]initWithFrame:CGRectMake(0, 8, self.frame.size.width, 100)];
    UIImage *imge=[UIImage imageNamed:@"sportstabw.jpg"];
   [[UITabBar appearance]setBackgroundColor:[UIColor whiteColor]];
    [[UITabBar appearance] setTintColor:[UIColor colorWithRed:0.14 green:0.57 blue:0.22 alpha:1.00]]; // for
    
   // [[UIBarButtonItem appearance]titlePositionAdjustmentForBarMetrics:UIOffsetMake(0, -10) ];
    UITabBarItem *tabBarItem1 = [[UITabBarItem alloc]initWithTitle:@"Sports" image:imge selectedImage:imge];
    UITabBarItem *tabBarItem2 = [[UITabBarItem alloc]initWithTitle:@"Entertainment" image:nil selectedImage:imge];
    UITabBarItem *tabBarItem3 = [[UITabBarItem alloc]initWithTitle:@"Service" image:nil selectedImage:imge];
   
     tabBarItem1.titlePositionAdjustment=UIOffsetMake(0, -5);
    [[UITabBarItem appearance] setTitleTextAttributes:@{
                                                        NSFontAttributeName:[UIFont fontWithName:@"AmericanTypewriter" size:16.0f
                                                                             
                                                                             ],
                                                        NSForegroundColorAttributeName:[UIColor whiteColor]
                                                        } forState:UIControlStateNormal];
    
    tabBarItem1.image=imge;
    tabBarItem2.image=imge;
    tabBarItem3.image=imge;
    [tabBarItem1 setTitlePositionAdjustment:UIOffsetMake(0, -20)];
    [tabBarItem2 setTitlePositionAdjustment:UIOffsetMake(0, -20)];
    [tabBarItem3 setTitlePositionAdjustment:UIOffsetMake(0, -20)];
    NSMutableArray *tabItems=[[NSMutableArray alloc]init];
    [tabItems insertObject:tabBarItem1 atIndex:0];
    [tabItems insertObject:tabBarItem2 atIndex:1];
    [tabItems insertObject:tabBarItem3 atIndex:2];
    
     
     tabbar.items=tabItems;
    [self addSubview:tabbar];
}


@end
