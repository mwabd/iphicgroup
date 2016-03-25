//
//  ViewController.h
//  collectionview
//
//  Created by bappy on 3/20/16.
//  Copyright © 2016 bGlobal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
@interface ViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property(nonatomic,weak) IBOutlet UICollectionView *mycollectionview;
@property (weak, nonatomic) IBOutlet UIScrollView *myscrollview;
;
@property (weak, nonatomic) IBOutlet UICollectionView *myclubcollectionViewConroller;

@end
