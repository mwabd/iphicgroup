//
//  ViewController.h
//  collectionview
//
//  Created by bappy on 3/20/16.
//  Copyright © 2016 bGlobal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property(nonatomic,weak) IBOutlet UICollectionView *mycollectionview;
@property (weak, nonatomic) IBOutlet UIScrollView *myscrollview;
;
@property (weak, nonatomic) NSString *selectedItem;
@property (weak, nonatomic) IBOutlet UICollectionView *myclubcollectionViewConroller;
@property (weak, nonatomic) IBOutlet UITabBar *tapbar;
@end
