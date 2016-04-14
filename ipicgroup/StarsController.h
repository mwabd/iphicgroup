//
//  StarsController.h
//  ipicgroup
//
//  Created by Mind Working Asia on 4/12/16.
//  Copyright © 2016 Mind Working Asia. All rights reserved.
//
#import <UIKit/UIKit.h>
@protocol StarsControllerDelegate <NSObject>
@required
- (void)cat_idFromController:(NSString *)cat_id;
- (void)cat_nameFromController:(NSString *)cat_name;
@end

@interface StarsController :  UIViewController <UITableViewDelegate, UITableViewDataSource>{
    IBOutlet UITableView *myTableView;
}
@property (nonatomic, retain) NSString *cat_id;
@property (nonatomic, retain) NSString *cat_name;
@property (nonatomic, weak) id<StarsControllerDelegate> delegate;

@end
