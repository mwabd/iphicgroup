//
//  StarsController.m
//  ipicgroup
//
//  Created by Mind Working Asia on 4/12/16.
//  Copyright © 2016 Mind Working Asia. All rights reserved.
//

#import "StarsController.h"
#include "BackgroundLayer.h"
#import "UIImageView+WebCache.h"


@interface StarsController () <UITextViewDelegate, UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@end

@implementation StarsController


NSDictionary *dic_star1;
UICollectionViewCell *cell;
NSMutableArray *all_stars;

-(void) datasource_init:(NSString*)selected
{
    NSURL *mAll = [NSURL URLWithString:@"http://83.138.133.168/ipic/json.php"];
    NSData *ajsonData = [NSData dataWithContentsOfURL:mAll];
    NSError *error = nil;
    NSMutableDictionary *data =[NSJSONSerialization JSONObjectWithData:ajsonData options:0 error:&error];
    
    dic_star1 =  [data valueForKey:@"info"];
   int k=0;
    for (NSDictionary *item in dic_star1) {
       // if([[item objectForKey:@"category_id"]isEqualToString:selected])
        {//sports
            
            all_stars[k] = item;
            k++;
        }
        
    }

    
}
-(void)loadMyview:(NSString*)selected
{
    //TabBar *tab;
        ///
    CAGradientLayer *bgLayer = [BackgroundLayer clubGradient ];
    
    
    bgLayer.frame =self.myStarCollection.bounds;
 //   lbl.textColor=[UIColor whiteColor];
 //   lbl.font=[UIFont fontWithName:@"Cervo-Light" size:25.0f];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flowLayout setMinimumInteritemSpacing:0.0f];
    [flowLayout setMinimumLineSpacing:0.0f];
    [self.myStarCollection setCollectionViewLayout:flowLayout];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    all_stars =[[NSMutableArray alloc]init];
  //  [self loadMyview:@"1"];
    [self datasource_init:@"1"];
    
}

-(BOOL)shouldAutorotate
{
    return NO;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0 , 5, 0,0);//UIEdgeInsetsMake(50, 20, 50, 20);
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize retval =CGSizeMake(180,80);
    return retval;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath  {
    
    
    NSString *string;
    
        NSDictionary *item = all_stars[indexPath.section];
        string = [item objectForKey:@"url_path"];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:string]];
    //UICollectionViewCell *datasetCell =[collectionView cellForItemAtIndexPath:indexPath];
    //datasetCell.backgroundColor = [UIColor blueColor]; // highlight selection
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    
    return [all_stars count];
    ;
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
   cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"star" forIndexPath:indexPath];
    [[cell.contentView viewWithTag:123]removeFromSuperview] ;
    
    NSDictionary *item = all_stars[indexPath.section];
    
    
    NSURL *url = [NSURL URLWithString:[item objectForKey:@"image_path"]];
    UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 80,80)];
    imageview.image = nil;
    [imageview sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"loading_star.png"]];
    imageview.contentMode = UIViewContentModeScaleAspectFit;
   

    UILabel *lblStar=[[UILabel alloc]initWithFrame:CGRectMake(82,20,90 ,20)];
    //[imageview addSubview:label];
    
    //imageview.center=cell.center;
    lblStar.text=nil;
    lblStar.text=[item objectForKey:@"star_name"];
    [lblStar setBackgroundColor:[UIColor whiteColor]];
    lblStar.textColor=[UIColor blackColor];
    
    
    UILabel *lblClub=[[UILabel alloc]initWithFrame:CGRectMake(82,40,120 ,20)];
    //[imageview addSubview:label];
    
    //imageview.center=cell.center;
    lblClub.text=nil;
    lblClub.text=[item objectForKey:@"sub_category_name"];
    [lblClub setBackgroundColor:[UIColor whiteColor]];
    lblClub.textColor=[UIColor blackColor];

    
    [cell.contentView addSubview:imageview];
    [cell.contentView addSubview:lblStar];
    [cell.contentView addSubview:lblClub];
    
    return cell;
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


@end
