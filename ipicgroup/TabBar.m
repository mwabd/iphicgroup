//
//  TabBar.m
//  tabview
//
//  Created by bappy on 3/26/16.
//  Copyright © 2016 bGlobal. All rights reserved.
//

#import "TabBar.h"
#import "ViewController.h"
@interface TabBar()<UITabBarDelegate>

@end


@implementation TabBar
@synthesize delegate;
- (void)drawRect:(CGRect)rect {
    _tapbar=[[UITabBar alloc]initWithFrame:CGRectMake(0, 8, self.frame.size.width, 100)];
    UIImage *imge=[UIImage imageNamed:@"sportstabw.jpg"];
   [[UITabBar appearance]setBackgroundColor:[UIColor whiteColor]];
    [[UITabBar appearance] setTintColor:[UIColor colorWithRed:0.14 green:0.57 blue:0.22 alpha:1.00]]; // for
    
   // [[UIBarButtonItem appearance]titlePositionAdjustmentForBarMetrics:UIOffsetMake(0, -10) ];
    UITabBarItem *tabBarItem1 = [[UITabBarItem alloc]initWithTitle:@"SPORTS" image:imge selectedImage:imge];
    UITabBarItem *tabBarItem2 = [[UITabBarItem alloc]initWithTitle:@"ENTERTAINMENT" image:nil selectedImage:imge];
    UITabBarItem *tabBarItem3 = [[UITabBarItem alloc]initWithTitle:@"SERVICE" image:nil selectedImage:imge];
   
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
    
  
    _tapbar.delegate=self;//GREEN TABED BUTTON
    _tapbar.items=tabItems;
    [self addSubview:_tapbar];
     ;
}
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    
    
    
        ViewController *vc=(ViewController*)[self.delegate process];
        
       
        ViewController *vc2 = (ViewController *)[vc.storyboard instantiateViewControllerWithIdentifier:@"viewcontroller"];
        vc2.selectedItem=item.title ;
        [vc.navigationController pushViewController:vc2 animated:NO];
        
        
    
        
    
    
  


}
@end
