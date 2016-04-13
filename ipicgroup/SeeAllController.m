
#import "SeeAllController.h"
#import "DOPNavbarMenu.h"
#import "HelpController.h"
#include "BackgroundLayer.h"
#import "UIImageView+WebCache.h"
#include "ViewController.h"
@interface SeeAllController () <UITextViewDelegate, UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UITabBarDelegate>

@property (assign, nonatomic) NSInteger numberOfItemsInRow;
@property (strong, nonatomic) DOPNavbarMenu *menu;
@end
@implementation SeeAllController
{
    NSInteger counter;
    UIButton *btn;
    BOOL enabled;
    NSInteger count;
    NSMutableArray *parent;
    int k;
    NSMutableArray *name_of_item;
    NSMutableArray *image_of_item;
    UILabel *lbl;
    NSMutableArray * colors;
    UICollectionViewCell *cell;
    UILabel *label;
    NSMutableArray *sub_categories;
}
-(void)createTab
{

    UIImage *imge=[UIImage imageNamed:@"sportstabw.jpg"];
    [[UITabBar appearance]setBackgroundColor:[UIColor whiteColor]];
    [[UITabBar appearance] setTintColor:[UIColor colorWithRed:0.14 green:0.57 blue:0.22 alpha:1.00]]; // for
    UITabBarItem *tabBarItem1 = [[UITabBarItem alloc]initWithTitle:@"SPORTS" image:imge selectedImage:imge];
    
    
    UITabBarItem *tabBarItem2 = [[UITabBarItem alloc]initWithTitle:@"ENTERTAINMENT" image:nil selectedImage:imge];
    UITabBarItem *tabBarItem3 = [[UITabBarItem alloc]initWithTitle:@"SERVICE" image:nil selectedImage:imge];
    
    
    // tabBarItem1.titlePositionAdjustment=UIOffsetMake(0, -5);
    [[UITabBarItem appearance] setTitleTextAttributes:@{
                                                        NSFontAttributeName:[UIFont fontWithName:@"Cervo-Light" size:16.0f
                                                                             
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
    _tapbar.items=tabItems;
    [_tapbar  setBackgroundColor:[UIColor whiteColor]];
    [_tapbar   setTintColor:[UIColor colorWithRed:0.14 green:0.57 blue:0.22 alpha:1.00]];
    
    // self.tabBarController.delegate;
    
    _tapbar.delegate=self;
    
    
    [_tapbar setSelectedItem:[[_tapbar items] objectAtIndex:0]];
}

-(void)perseclub:(NSDictionary*) items
{
    //NSLog(@"%@",items);
    k=0;
    NSLog(@"%@sel",self.selectedItem);
    for (NSDictionary *item in items) {
        [item objectForKey:@"category_id"];
        if([(NSString*)[item objectForKey:@"category_id"]isEqualToString:self.selectedItem])
            //football
            {
            sub_categories[k] = item;
            k++;
            
            }
        
        
    }
    //NSLog(@"%@",sub_categories);
}

-(BOOL)shouldAutorotate
{
    return NO;
}



- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

-(IBAction)searchBtn:(id)sender {
    HelpController *help = [self.storyboard instantiateViewControllerWithIdentifier:@"helpviewcontroller"];
    [self presentViewController:help animated:NO completion:nil];
}

-(void)loadMyview:(NSString*)selected
{
    
    self.numberOfItemsInRow = 1;
    
    ///
    CAGradientLayer *bgLayer = [BackgroundLayer clubGradient ];
    btn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 45)];
    [btn setTitle:@"Back" forState:UIControlStateNormal];;
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    lbl=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 70)];
    UIButton *searchbtn=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width-50, 0, 50, 65)];
    [searchbtn setBackgroundColor:[UIColor clearColor]];
    UIImage *search =[UIImage imageNamed:@"SEARCH.png"];
    [searchbtn setImage:search forState:UIControlStateNormal];
    [searchbtn addTarget:self action:@selector(searchBtn:) forControlEvents:UIControlEventTouchUpInside];
    [searchbtn setBackgroundColor:[UIColor clearColor]];
    bgLayer.frame =self.myclubcollectionViewConroller.bounds;
    lbl.textColor=[UIColor whiteColor];
    lbl.font=[UIFont fontWithName:@"Cervo-Light" size:25.0f];
    lbl.text=@"Clubs";
    lbl.textAlignment=NSTextAlignmentCenter;
    [btn setBackgroundColor:[UIColor clearColor]];
    [self.view  addSubview:btn];
    [self.view addSubview:lbl];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flowLayout setMinimumInteritemSpacing:0.0f];
    [flowLayout setMinimumLineSpacing:0.0f];
   
}
- (void)buttonClicked:(UIButton*)button
{
    [self dismissViewControllerAnimated:YES completion:nil];;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.title=@"Clubs";
    parent=[[NSMutableArray alloc]init];
    image_of_item=[[NSMutableArray alloc]init];
    name_of_item=[[NSMutableArray alloc]init];
    sub_categories=[[NSMutableArray alloc]init];
    parent=[[NSMutableArray alloc]init];
    image_of_item=[[NSMutableArray alloc]init];
    name_of_item=[[NSMutableArray alloc]init];
    [self loadMyview:@"SPORTS"];
    [self createTab];
    [self perseclub:dic_sub_cat];
    
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10 , 10, 20,10);;//UIEdgeInsetsMake(50, 20, 50, 20);
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize retval =CGSizeMake(80,110);
    return retval;
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
//   / NSLog(@"%d",[sub_categories count]);
   // NSLog(@"%f",ceil((float)([sub_categories count]/3)));
    return (int)ceil((float)([sub_categories count]/3));;
;
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [sub_categories count];
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    [parent removeAllObjects];
    //[self datasource_init:item.title];
    [_myclubcollectionViewConroller reloadData];
    //[cell.contentView.layer removeFromSuperlayer];
    //_menu=nil;
    lbl.text=item.title;
    
    
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    //[_textview.layer insertSublayer:bgLayer atIndex:0];
    
    
    
        UILabel *label1=[[UILabel alloc]initWithFrame:CGRectMake(20, 85, 80,20)];
        cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"club" forIndexPath:indexPath];
        //[[cell.contentView viewWithTag:123]removeFromSuperview] ;
        NSDictionary *item = sub_categories[indexPath.row];
        [item objectForKey:@"url_path"];
        NSURL *url = [NSURL URLWithString:[item objectForKey:@"logo_path"]];
        UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 80,80)];
        [imageview sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"loading_logo.png"]];
    
        imageview.contentMode = UIViewContentModeScaleAspectFit;
    label1.font=[UIFont fontWithName:@"Cervo-Light" size:13.0f];
    NSLog(@"%@",[item objectForKey:@"sub_category_name"]);
    label1.text=[item objectForKey:@"sub_category_name"];
    [label1 setBackgroundColor:[UIColor clearColor]];
    label1.textColor=[UIColor blackColor];
    //label1.tag=123;
    NSLog(@"%@",label1);
    //[cell.contentView clearsContextBeforeDrawing];
    [cell.contentView addSubview:imageview];
    [cell.contentView addSubview:label1];
    
    
    return cell;
    
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)didShowMenu:(DOPNavbarMenu *)menu {
    //[self.navigationItem.rightBarButtonItem setTitle:@"dismiss"];
    enabled = YES;
}

- (void)didDismissMenu:(DOPNavbarMenu *)menu {
    //[self.navigationItem.rightBarButtonItem setTitle:@"menu"];
    enabled = YES;
}



@end
