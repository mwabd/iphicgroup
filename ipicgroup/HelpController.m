//
//  HelpController.m
//  ipicgroup
//
//  Created by Mind Working Asia on 3/22/16.
//  Copyright © 2016 Mind Working Asia. All rights reserved.
//

#import "HelpController.h"
#import "DOPNavbarMenu.h"
#import  "BackgroundLayer.h"
@interface HelpController ()<UITabBarDelegate>
{
    BOOL enabled;
    
    
    
    //
    NSInteger counter;
    UIButton *btn;
    NSInteger count;
    NSMutableArray *header;
    int k;
    NSMutableArray *name_of_item;
    NSMutableArray *image_of_item;
    UILabel *lbl;
    NSMutableArray * colors;
    UICollectionViewCell *cell;
    UILabel *label;
}

@property (assign, nonatomic) NSInteger numberOfItemsInRow;
@property (strong, nonatomic) DOPNavbarMenu *menu;
@end

@implementation HelpController

-(BOOL)shouldAutorotate
{
    return NO;
}


- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (void)didSelectedMenu:(DOPNavbarMenu *)menu atIndex:(NSInteger)index {
    // UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"you selected" message:[NSString stringWithFormat:@"number %@", @(index+1)] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    //[av show];
}
- (void)didDismissMenu:(DOPNavbarMenu *)menu {
    //[self.navigationItem.rightBarButtonItem setTitle:@"menu"];
    enabled = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _menu=nil;
    _numberOfItemsInRow=1;
    CAGradientLayer *bgLayer = [BackgroundLayer greenGradient];
    bgLayer.frame = self.view.bounds;
    [_textview.layer insertSublayer:bgLayer atIndex:0];
    [self.view.layer insertSublayer:bgLayer atIndex:0];
    name_of_item=[NSMutableArray array];
    header=[NSMutableArray array];
    image_of_item=[NSMutableArray array];
    colors=[NSMutableArray array];
    [self datasource_init:@"SPORTS"];
    [self menu];
    [self createTab];
    
    //[self.navigationController.view setBackgroundColor:[UIColor clearColor]];
    btn=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2+50,20, 40, 40)];
    [btn setImage:[UIImage imageNamed:@"downarrow.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(openMenu:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.navigationController.view  addSubview:btn];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [flowLayout setMinimumInteritemSpacing:0.0f];
    [flowLayout setMinimumLineSpacing:0.0f];
    [self.mycollectionview setPagingEnabled:YES];
    [self.mycollectionview setCollectionViewLayout:flowLayout];
    [self.mycollectionview setBounces:NO];
    
}
-(void)createTab
{
    _tapbar.delegate=self;
    UIImage *imge=[UIImage imageNamed:@"sportstabw.jpg"];
    [[UITabBar appearance]setBackgroundColor:[UIColor whiteColor]];
    UITabBarItem *tabBarItem1 = [[UITabBarItem alloc]initWithTitle:@"SPORTS" image:imge selectedImage:imge];
    UITabBarItem *tabBarItem2 = [[UITabBarItem alloc]initWithTitle:@"ENTERTAINMENT" image:imge selectedImage:imge];
    UITabBarItem *tabBarItem3 = [[UITabBarItem alloc]initWithTitle:@"SERVICE" image:imge selectedImage:imge];
   
    
    // tabBarItem1.titlePositionAdjustment=UIOffsetMake(0, -5);
    [[UITabBarItem appearance] setTitleTextAttributes:@{
                                                        NSFontAttributeName:[UIFont fontWithName:@"Cervo-Light" size:16.0f
                                                                             
                                                                             ],
                                                        NSForegroundColorAttributeName:[UIColor whiteColor]
                                                        } forState:UIControlStateNormal];
    
  
    
    [[UITabBar appearance]setBackgroundColor:[UIColor whiteColor]];
    [UITabBar appearance].itemPositioning=UITabBarItemPositioningFill ;
    [_tapbar   setTintColor:[UIColor colorWithRed:0.14 green:0.57 blue:0.22 alpha:1.00]];
    _tapbar.itemPositioning=UITabBarItemPositioningFill;;
    [tabBarItem1 setTitlePositionAdjustment:UIOffsetMake(0, -20)];
    [tabBarItem2 setTitlePositionAdjustment:UIOffsetMake(0, -20)];
    [tabBarItem3 setTitlePositionAdjustment:UIOffsetMake(0, -20)];
    NSMutableArray *tabItems=[[NSMutableArray alloc]init];
    [tabItems insertObject:tabBarItem1 atIndex:0];
    [tabItems insertObject:tabBarItem2 atIndex:1];
    [tabItems insertObject:tabBarItem3 atIndex:2];
    _tapbar.items=tabItems;
    [_tapbar setSelectedItem:_tapbar.items[0]];
}
/*-(void) datasource_init:(NSString*)string
{
    
    k=0;
    count=0;
    
    [image_of_item removeAllObjects];
    [name_of_item removeAllObjects];
    [colors removeAllObjects];
//   / [parent removeAllObjects];
    
    NSString *file = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:file];
  
    for (id row  in dict[@"Category Sub Menu"][string]) {
        [header addObject:row];
        
        k++;
        
    }
    
    }
*/
-(void) datasource_init:(NSString*)selected
{
    int name_of_item_count=0;
    int image_of_item_count=0;
    k=0;
    [image_of_item removeAllObjects];
    [name_of_item removeAllObjects];
    [colors removeAllObjects];
    
    NSString *file = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:file];
    for (id row  in dict[@"Category Sub Menu"][selected]) {
        header[k++]=row;
        for(int i=1;i<=[dict[@"Category Sub Menu"][selected][row] count];i++)
        {
            
            NSString *string = [NSString stringWithFormat:@"%d", i];
            
            string=[@"name" stringByAppendingString:string];
            ;
            if([dict[@"Category Sub Menu"][selected][row][string] length]>0)
            {
                name_of_item[name_of_item_count++]=dict[@"Category Sub Menu"][selected][row][string];
                
            }
            
            string=@"";
            string = [NSString stringWithFormat:@"%d", i];
            string=[@"image" stringByAppendingString:string];
            if([dict[@"Category Sub Menu"][selected][row][string] length]>0)
            {
                
                image_of_item[image_of_item_count++]=dict[@"Category Sub Menu"][selected][row][string];
                
            }
            string=@"";
        }
    }
    
}
- (DOPNavbarMenu *)menu {
    
    if (_menu == nil) {
        colors=[NSMutableArray array];
        UIColor *color = [UIColor colorWithRed:0.031 green:0.231 blue:0.102 alpha:1];
        [colors addObject:color];
        color=[UIColor colorWithRed:0.051 green:0.365 blue:0.165 alpha:1];
        [colors addObject:color];
        color=[UIColor colorWithRed:0.071 green:0.533 blue:0.235 alpha:1];
        [colors addObject:color];
        color=[UIColor colorWithRed:0.051 green:0.365 blue:0.165 alpha:1];
        [colors addObject:color];
        color=[UIColor colorWithRed:0.071 green:0.533 blue:0.235 alpha:1];
        [colors addObject:color];
        color=[UIColor colorWithRed:0.051 green:0.365 blue:0.165 alpha:1];
        [colors addObject:color];
        color=[UIColor colorWithRed:0.071 green:0.533 blue:0.235 alpha:1];
        [colors addObject:color];
        color=[UIColor colorWithRed:0.051 green:0.365 blue:0.165 alpha:1];
        [colors addObject:color];
    
        
        
        DOPNavbarMenuItem *item1[[header count]];
        for (int t=0; t<[header count]; t++) {
            item1[t]=[DOPNavbarMenuItem ItemWithTitle:header[t]];
        }
        
        NSMutableArray *item2;
        item2=[NSMutableArray array];
        for (int i=0; i<[header count]; i++) {
            [item2 insertObject:item1[i] atIndex:i];
        }
        _menu =[[DOPNavbarMenu alloc] initWithItems:item2 width:self.view.dop_width maximumNumberInRow:_numberOfItemsInRow color:colors];;
        _menu.separatarColor = [UIColor colorWithRed:0.129 green:0.569 blue:0.208 alpha:1];
        _menu.delegate = self;
        
    }
    return _menu;
}
- (IBAction)openMenu:(id)sender {
    
    enabled = NO;
    if (self.menu.isOpen) {
        [self.menu dismissWithAnimation:YES];
    } else {
        [self.menu showInNavigationController:self.navigationController];
        
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)didShowMenu:(DOPNavbarMenu *)menu {
    //[self.navigationItem.rightBarButtonItem setTitle:@"dismiss"];
    enabled = YES;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//collection view controller//
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10 , 10, 10,10);;//UIEdgeInsetsMake(50, 20, 50, 20);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize retval =CGSizeMake(100,120);
    return retval;
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    if(collectionView==self.mycollectionview)
    {
        
        return [image_of_item count];
    }
    else
    {   return [name_of_item count];
    }
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    [header removeAllObjects];
    [self datasource_init:item.title];
    [_mycollectionview reloadData];
    
    //[cell.contentView.layer removeFromSuperlayer];
    _menu=nil;
    lbl.text=item.title;
    
    
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    label=[[UILabel alloc]initWithFrame:CGRectMake(5,80, 80, 20)];
    
     if(collectionView==self.mycollectionview)
    {
        
        
        cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        UIImage *img=[UIImage imageNamed:image_of_item[indexPath.section]];
        //UIImage *img=[UIImage imageNamed:@"HULL.png"];
        UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 80,80)];
        imageview.image=img;
        
        //[imageview addSubview:label];
        imageview.contentMode = UIViewContentModeScaleAspectFit;
        //imageview.center=cell.center;
        label.text=nil;
        label.text=name_of_item[indexPath.section];
        [label setBackgroundColor:[UIColor whiteColor]];
        label.textColor=[UIColor blackColor];
        [cell.contentView clearsContextBeforeDrawing];
        [cell.contentView addSubview:imageview];
        [cell.contentView addSubview:label];
        
        
        
        count++;
        return cell;
        
    }
    
    return cell;
    
    
    
}



- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if (self.menu) {
        [self.menu dismissWithAnimation:NO];
    }
}



@end
