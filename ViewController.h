//
//  ViewController.h
//  collectionview
//
//  Created by bappy on 3/20/16.
//  Copyright © 2016 bGlobal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BackgroundLayer.h"
@interface ViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property(nonatomic,weak) IBOutlet UICollectionView *mycollectionview;
@property (weak, nonatomic) IBOutlet UIScrollView *myscrollview;
;
@property (weak, nonatomic) NSString *selectedItem;
@property (weak, nonatomic) IBOutlet UICollectionView *myclubcollectionViewConroller;
@property (strong, nonatomic) IBOutlet UITabBar *tapbar;
@property (weak, nonatomic) IBOutlet UIButton *searchbtn;
@property (weak, nonatomic) IBOutlet UIView *clubview;
@property (weak, nonatomic) IBOutlet UIView *starplayers;

@end
