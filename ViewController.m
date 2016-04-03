#import "ViewController.h"
#import "DOPNavbarMenu.h"
#import "HelpController.h"
#include "BackgroundLayer.h"
@interface ViewController () <UITextViewDelegate, DOPNavbarMenuDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UITabBarDelegate>

@property (assign, nonatomic) NSInteger numberOfItemsInRow;
@property (strong, nonatomic) DOPNavbarMenu *menu;
@end
@implementation ViewController
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
}
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
        parent[k++]=row;
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
-(BOOL)shouldAutorotate
{
return NO;
}



- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
return UIInterfaceOrientationMaskPortrait;
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
DOPNavbarMenuItem *item1[[parent count]];
for (int t=0; t<k; t++) {
item1[t]=[DOPNavbarMenuItem ItemWithTitle:parent[t]];
}

NSMutableArray *item2;
item2=[[NSMutableArray alloc]init];
for (int i=0; i<[parent count]; i++) {
[item2 insertObject:item1[i] atIndex:i];
}
_menu =[[DOPNavbarMenu alloc] initWithItems:item2 width:self.view.dop_width maximumNumberInRow:_numberOfItemsInRow color:colors];;
_menu.separatarColor = [UIColor colorWithRed:0.129 green:0.569 blue:0.208 alpha:1];
_menu.delegate = self;
}
return _menu;
}

-(IBAction)searchBtn:(id)sender {
    HelpController *help = [self.storyboard instantiateViewControllerWithIdentifier:@"helpviewcontroller"];
    [self presentViewController:help animated:NO completion:nil];
}

-(void)loadMyview:(NSString*)selected
{
    //TabBar *tab;
    counter=0;
    count=0;;
    k=0;
    int name_of_item_count=0;
    int image_of_item_count=0;
    /*init array*/
    
    
    NSString *file = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:file];
    for (id row  in dict[@"Category Sub Menu"][selected]) {
        parent[k++]=row;
        for(int i=1;i<=[dict[@"Category Sub Menu"][selected][row] count];i++)
        {
            
            NSString *string = [NSString stringWithFormat:@"%d", i];
            
            string=[@"name" stringByAppendingString:string];
            ;
            if([dict[@"Category Sub Menu"][selected][row][string] length]>0)
            {
                name_of_item[name_of_item_count++]=dict[@"Category Sub Menu"][_selectedItem][row][string];
                
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
    
    
 
    self.numberOfItemsInRow = 1;
    
    ///
    CAGradientLayer *bgLayer = [BackgroundLayer clubGradient ];
   
    
    UIButton *searchbtn=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width-50, 0, 50, 65)];
    [searchbtn setBackgroundColor:[UIColor clearColor]];
    UIImage *search =[UIImage imageNamed:@"SEARCH.png"];
    [searchbtn setImage:search forState:UIControlStateNormal];
    [searchbtn addTarget:self action:@selector(searchBtn:) forControlEvents:UIControlEventTouchUpInside];
    [searchbtn setBackgroundColor:[UIColor clearColor]];
    lbl=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-50,65)];
    UITapGestureRecognizer* gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openMenu:)];
    bgLayer.frame =self.myclubcollectionViewConroller.bounds;
    //[lbl.layer insertSublayer:bgLayer atIndex:0];
    [self.view.layer insertSublayer:bgLayer atIndex:0];
    [lbl addSubview:searchbtn];
    [lbl setUserInteractionEnabled:YES];
    [lbl addGestureRecognizer:gesture];
    lbl.textColor=[UIColor whiteColor];
    lbl.font=[UIFont fontWithName:@"Cervo-Light" size:25.0f];
    lbl.text=_selectedItem;
    lbl.textAlignment = NSTextAlignmentCenter;
    lbl.textColor=[UIColor whiteColor];
    [lbl setBackgroundColor:[UIColor colorWithRed:0.031 green:0.231 blue:0.102 alpha:1]];
    btn=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2+80,30, 15, 15)];
    [btn setImage:[UIImage imageNamed:@"downarrow.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(openMenu:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.view addSubview:lbl];
    [self.navigationController.view  addSubview:btn];
    [self.navigationController.view addSubview:searchbtn];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [flowLayout setMinimumInteritemSpacing:0.0f];
    [flowLayout setMinimumLineSpacing:0.0f];
    [self.mycollectionview setPagingEnabled:YES];
    [self.mycollectionview setCollectionViewLayout:flowLayout];
    [self.mycollectionview setBounces:NO];
    [self.myclubcollectionViewConroller setCollectionViewLayout:flowLayout];
    bgLayer = [BackgroundLayer greenGradient];
    bgLayer.frame = self.view.bounds;
    bgLayer.frame=self.clubview.bounds;
    [self.clubview.layer insertSublayer:bgLayer atIndex:0];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    ;
    parent=[[NSMutableArray alloc]init];
    image_of_item=[[NSMutableArray alloc]init];
    name_of_item=[[NSMutableArray alloc]init];
    _mycollectionview.delegate=self;
    _mycollectionview.dataSource=self;
    parent=[[NSMutableArray alloc]init];
    image_of_item=[[NSMutableArray alloc]init];
    name_of_item=[[NSMutableArray alloc]init];
    
    [self loadMyview:self.selectedItem];
    [self createTab];
    [self datasource_init:self.selectedItem];
  
}

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
    [parent removeAllObjects];
    [self datasource_init:item.title];
    [_mycollectionview reloadData];
    [_myclubcollectionViewConroller reloadData];
    //[cell.contentView.layer removeFromSuperlayer];
    _menu=nil;
    lbl.text=item.title;
   
   
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
   
    //[_textview.layer insertSublayer:bgLayer atIndex:0];
    label=[[UILabel alloc]initWithFrame:CGRectMake(5,80, 80, 20)];

if(collectionView==self.myclubcollectionViewConroller)
{
cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"club" forIndexPath:indexPath];
UIImage *img=[UIImage imageNamed:image_of_item[indexPath.section]];
    //UIImage *img=[UIImage imageNamed:@"HULL.png"];
UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 80,80)];
imageview.image=img;

//[imageview addSubview:label];
imageview.contentMode = UIViewContentModeScaleAspectFit;
//imageview.center=cell.center;
label.text=nil;
label.text=name_of_item[indexPath.section];
//[label setBackgroundColor:[UIColor colorWithRed:0 green:0.4 blue:0 alpha:1]];
    [label setBackgroundColor:[UIColor clearColor]];
    label.textColor=[UIColor whiteColor];
                     [cell.contentView clearsContextBeforeDrawing];
[cell.contentView addSubview:imageview];
[cell.contentView addSubview:label];
//return cell;
}
else if(collectionView==self.mycollectionview)
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
    [label setBackgroundColor:[UIColor clearColor]];
    label.textColor=[UIColor blackColor];
    [cell.contentView clearsContextBeforeDrawing];
    [cell.contentView addSubview:imageview];
    [cell.contentView addSubview:label];
    


count++;
//return cell;

}

return cell;



}



- (void)viewWillDisappear:(BOOL)animated {
[super viewWillDisappear:animated];
if (self.menu) {
[self.menu dismissWithAnimation:NO];
}
}

- (IBAction)openMenu:(id)sender {

enabled = NO;
if (self.menu.isOpen) {
[self.menu dismissWithAnimation:YES];
} else {
[self.menu showInNavigationController:self.navigationController];

}
}

- (void)didShowMenu:(DOPNavbarMenu *)menu {
//[self.navigationItem.rightBarButtonItem setTitle:@"dismiss"];
enabled = YES;
}

- (void)didDismissMenu:(DOPNavbarMenu *)menu {
//[self.navigationItem.rightBarButtonItem setTitle:@"menu"];
enabled = YES;
}

- (void)didSelectedMenu:(DOPNavbarMenu *)menu atIndex:(NSInteger)index {
// UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"you selected" message:[NSString stringWithFormat:@"number %@", @(index+1)] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//[av show];
    lbl.text=parent[index];
    
  
}

- (void)didReceiveMemoryWarning {
[super didReceiveMemoryWarning];
// Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
return UIStatusBarStyleLightContent;
}

- (void)textViewDidChange:(UITextView *)textView {
self.numberOfItemsInRow = [textView.text integerValue];
self.menu = nil;
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
self.menu = nil;
}


@end
