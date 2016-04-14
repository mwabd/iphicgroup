#import "ViewController.h"
#import "DOPNavbarMenu.h"
#import "menu.h"
#import "HelpController.h"
#import "UIImageView+WebCache.h"
#import "SearchViewController.h"
#include "BackgroundLayer.h"
#include "SeeAllController.h"
NSMutableArray *head;
@interface ViewController () <UITextViewDelegate, DOPNavbarMenuDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UITabBarDelegate>

@property (assign, nonatomic) NSInteger numberOfItemsInRow;
@property (strong, nonatomic) DOPNavbarMenu *menu;
-(void)loadData;
@end
@implementation ViewController
{
NSInteger counter;
UIButton *btn;
BOOL enabled;
NSInteger count;
NSMutableDictionary *parent;
//NSMutableArray *head;
    NSInteger indexOfTab;
    NSMutableArray *stars;
    NSMutableArray *sub_categories;
UILabel *lbl;
NSMutableArray * colors;
UICollectionViewCell *cell;
UILabel *label;
    
    int selecdmenuItem;
    int temp2;
   // UIActivityIndicatorView *indicator;
}
-(void) loadData{}

-(void)persemenu:(NSDictionary*) items
{
    
    
   NSInteger k=0;
    BOOL flag;
    flag=YES;
    NSString *string =_selectedItem;
    if(indexOfTab >= 0){
        string = [NSString stringWithFormat: @"%d", (NSInteger)indexOfTab];
    }
   
    
    
    for (NSDictionary *item in items) {
        
         if([[item objectForKey:@"category_menu"] isEqualToString:string])//sports
         {
             
             if(flag)
             {
                 
                 selecdmenuItem=[[item objectForKey:@"category_id"] intValue];
                 _starLabel.text = [item objectForKey:@"star_label"];
                 _clubLabel.text =[item objectForKey:@"category_label"];
                 lbl.text =[item objectForKey:@"category_name"];
                 flag=NO;
             }
           //  tmp[k] = item;
             
             parent=[[NSMutableDictionary alloc]init];
             [parent setObject:[item objectForKey:@"category_name"] forKey:@"name" ];
             [parent setObject:[item objectForKey:@"category_id"] forKey:@"cat_id"];
             [parent setObject:[item objectForKey:@"category_label"] forKey:@"category_label"];
             [parent setObject:[item objectForKey:@"star_label"] forKey:@"star_label"];
             [head insertObject:parent atIndex:k];
             k++;
           
         }
   
        
        

    }
  
}
-(void)persestarplayers:(NSDictionary*) items
{
    int k=0;
    NSString *myString=[NSString stringWithFormat: @"%d",(selecdmenuItem)];
   if(selecdmenuItem>0)
    myString =  [NSString stringWithFormat: @"%d",selecdmenuItem];;
    
    
    for (NSDictionary *item in items) {
        if([[item objectForKey:@"category_id"]isEqualToString:myString])
        {//sports
            
            stars[k] = item;
        k++;
        }
        
    }
    //  NSLog(@"%@",parent);
}


-(void)perseclub:(NSDictionary*) items
{
    //NSLog(@"%@",items);
   int k=0;
    NSString *myString=[NSString stringWithFormat: @"%d",(selecdmenuItem)];
    if(selecdmenuItem>0)
        myString =  [NSString stringWithFormat: @"%d",(selecdmenuItem)];
    
    for (NSDictionary *item in items) {
         [item objectForKey:@"category_id"];
        if([(NSString*)[item objectForKey:@"category_id"]isEqualToString:myString])
            //football
        {
            if(k== 0){
                
                 NSURL *url = [NSURL URLWithString:[item objectForKey:@"image_path"]];
                [_bannerImage sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"loading_club.png"]];
                
                
            }
            sub_categories[k] = item;
            k++;
            
        }
        
       
    }
    
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
    
    if(([self.selectedItem isEqual:@"0"]))
    {
        [_tapbar setSelectedItem:[[_tapbar items] objectAtIndex:0]];
    }
    else  if(([self.selectedItem isEqual:@"1"]))
    {
        
        [_tapbar setSelectedItem:[[_tapbar items] objectAtIndex:1]];
    }
    else [_tapbar setSelectedItem:[[_tapbar items] objectAtIndex:2]];
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
 
    
    NSMutableArray *temp=[[NSMutableArray alloc]init];
    
    DOPNavbarMenuItem *item1[[head count]];
    for (int t=0; t<[head count]; t++) {
        temp=[head objectAtIndex:t];
        item1[t]=[DOPNavbarMenuItem ItemWithTitle:[temp valueForKey:@"name"]];
    }
    
    NSMutableArray *item2;
    item2=[[NSMutableArray alloc]init];
    for (int i=0; i<[head count]; i++) {
        [item2 insertObject:item1[i] atIndex:i];
    }
    _menu =[[DOPNavbarMenu alloc] initWithItems:item2 width:self.view.dop_width maximumNumberInRow:_numberOfItemsInRow color:colors];;
    _menu.separatarColor = [UIColor colorWithRed:0.129 green:0.569 blue:0.208 alpha:1];
    _menu.delegate = self;
}
    return _menu;
}

-(IBAction)searchBtn:(id)sender {
    SearchViewController *search = [self.storyboard instantiateViewControllerWithIdentifier:@"searchview"];
    search.cat_id= [NSString stringWithFormat: @"%d", (NSInteger)selecdmenuItem];
    search.cat_name = lbl.text;
    // HelpController *help = [self.storyboard instantiateViewControllerWithIdentifier:@"helpviewcontroller"];
    [self presentViewController:search animated:NO completion:nil];
}

-(IBAction)infoBtn:(id)sender {
    HelpController *help = [self.storyboard instantiateViewControllerWithIdentifier:@"helpviewcontroller"];
    [self presentViewController:help animated:NO completion:nil];
}


-(void)loadMyview:(NSString*)selected
{
    //TabBar *tab;
    counter=0;
    count=0;;
    
    /*init array*/
    [self persemenu:dic_cat];
    [self perseclub:dic_sub_cat];
    [self persestarplayers:dic_star];
    
    self.numberOfItemsInRow = 1;
    
    ///
    CAGradientLayer *bgLayer = [BackgroundLayer clubGradient ];
    CGFloat navBarHeight = 45.0f;
    CGRect frame = CGRectMake(0.0f, 5,self.navigationController.navigationBar.frame.size.width, navBarHeight);
    [self.navigationController.navigationBar setFrame:frame];
    
    UIButton *searchbtn=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width-40, 0, 40, self.navigationController.navigationBar.frame.size.height)];
    [searchbtn setBackgroundColor:[UIColor clearColor]];
    UIImage *search =[UIImage imageNamed:@"SEARCH.png"];
    [searchbtn setImage:search forState:UIControlStateNormal];
    
    [searchbtn setBackgroundColor:[UIColor clearColor]];
    [searchbtn addTarget:self action:@selector(searchBtn:) forControlEvents:UIControlEventTouchUpInside];
    lbl=[[UILabel alloc]initWithFrame:CGRectMake(40, 0, self.view.frame.size.width-80,self.navigationController.navigationBar.frame.size.height)];
    UITapGestureRecognizer* gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openMenu:)];
    bgLayer.frame =self.myclubcollectionViewConroller.bounds;
    //[lbl.layer insertSublayer:bgLayer atIndex:0];
    [self.view.layer insertSublayer:bgLayer atIndex:0];
    [lbl addSubview:searchbtn];
    [lbl setUserInteractionEnabled:YES];
    [lbl addGestureRecognizer:gesture];
    lbl.textColor=[UIColor whiteColor];
    lbl.font=[UIFont fontWithName:@"Cervo-Light" size:25.0f];
    NSMutableArray *temp=[[NSMutableArray alloc]init];
    temp=[head objectAtIndex:0];
    selecdmenuItem=[[temp valueForKey:@"cat_id"] intValue];
    lbl.text=[temp valueForKey:@"name"];
    lbl.textAlignment = NSTextAlignmentCenter;
    lbl.textColor=[UIColor whiteColor];
    [lbl setBackgroundColor:[UIColor colorWithRed:0.031 green:0.231 blue:0.102 alpha:1]];
    btn=[[UIButton alloc]initWithFrame:CGRectMake(lbl.center.x+[lbl.text length]+25.0f,30, 15, 15)];
    float btnwidth =
    [lbl.text boundingRectWithSize:lbl.frame.size
                           options:NSStringDrawingUsesLineFragmentOrigin
                        attributes:@{ NSFontAttributeName:lbl.font }
                           context:nil].size.width;
    [btn setCenter:CGPointMake(lbl.center.x+btnwidth-[lbl.text length],lbl.center.y)];

    [btn setImage:[UIImage imageNamed:@"downarrow.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(openMenu:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.view addSubview:lbl];
    [self.navigationController.view  addSubview:btn];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [flowLayout setMinimumInteritemSpacing:0.0f];
    [self.mycollectionview setPagingEnabled:YES];
    [self.mycollectionview setCollectionViewLayout:flowLayout];
    [self.mycollectionview setBounces:NO];
    bgLayer = [BackgroundLayer clubGradient];
    bgLayer.frame = self.view.bounds;
    bgLayer.frame=self.clubview.bounds;
    [self.clubview.layer insertSublayer:bgLayer atIndex:0];
    
    UICollectionViewFlowLayout *flowLayout2 = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout2 setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [flowLayout2 setMinimumInteritemSpacing:0.0f];
    [flowLayout2 setMinimumLineSpacing:0.0f];
    [self.myclubcollectionViewConroller setCollectionViewLayout:flowLayout2];
    
    bgLayer = [BackgroundLayer clubGradient];
    bgLayer.frame=searchbtn.bounds;
    [bgLayer.contents addSubview:searchbtn];
    //[self.navigationController.view.layer insertSublayer:bgLayer below:searchbtn.layer];
    [searchbtn.layer insertSublayer:bgLayer atIndex:0];
    [searchbtn bringSubviewToFront:searchbtn.imageView];
    [self.navigationController.view addSubview:searchbtn];
    
    
    UIButton *infobtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, self.navigationController.navigationBar.frame.size.height)];
    [infobtn setBackgroundColor:[UIColor colorWithRed:0.141 green:0.569 blue:0.22 alpha:1] ];
    //UIImage *info =[UIImage imageNamed:@"SEARCH.png"];
    [infobtn setImage:[UIImage imageNamed:@"i.png"] forState:UIControlStateNormal];
  //  [infobtn addTarget:self action:@selector(searchBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.view addSubview:infobtn];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self.instance stopAnimating];
    [_activityindicator stopAnimating];
    indexOfTab = -1;
    
    sub_categories=[[NSMutableArray alloc]init];
    stars = [[NSMutableArray alloc] init];
    head=[[NSMutableArray alloc]init];
    
    _mycollectionview.delegate=self;
    _mycollectionview.dataSource=self;
    parent=[[NSMutableDictionary alloc]init];
  
    [self loadMyview:self.selectedItem];
    [self createTab];
    //
  
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
return UIEdgeInsetsMake(10 , 1, 10,1);;//UIEdgeInsetsMake(50, 20, 50, 20);
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
CGSize retval =CGSizeMake(90,120);
return retval;
}

/*
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
if(collectionView==self.mycollectionview)
{

    
    return sub_categories.count;
}
else
{   return stars.count;
}
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
return 1;
}
*/
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section

{
    //[collectionView.collectionViewLayout invalidateLayout];
    if(collectionView==self.myclubcollectionViewConroller)
    {
        
        //NSLog(@"%lu",(unsigned long)[sub_categories count]);
        
        return [sub_categories count];
    }
    else
    {   return stars.count;
    }
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    indexOfTab = (int) [[tabBar items] indexOfObject:item];
    [parent removeAllObjects];
    [head removeAllObjects];
    [stars removeAllObjects];
    [sub_categories removeAllObjects];
    
    
    [self persemenu:dic_cat];
    [self perseclub:dic_sub_cat];
    [self persestarplayers:dic_star];
    
    [_mycollectionview reloadData];
    [_myclubcollectionViewConroller reloadData];
   // [cell.contentView.layer removeFromSuperlayer];
    _menu=nil;
    
    float btnwidth =
    [lbl.text boundingRectWithSize:lbl.frame.size
     options:NSStringDrawingUsesLineFragmentOrigin
     attributes:@{ NSFontAttributeName:lbl.font }
     context:nil].size.width;
    [btn setCenter:CGPointMake(lbl.center.x+btnwidth-[lbl.text length],lbl.center.y)];
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath  {

    
    NSString *string;
    if(collectionView==self.myclubcollectionViewConroller){
        NSDictionary *item = sub_categories[indexPath.section];
        string = [item objectForKey:@"url_path"];
        NSURL *url = [NSURL URLWithString:[item objectForKey:@"image_path"]];
        [_bannerImage sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"loading_club.png"]];

        
    }
    else if(collectionView==self.mycollectionview){
        NSDictionary *item = stars[indexPath.section];
        string = [item objectForKey:@"url_path"];
    }
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:string]];
    //UICollectionViewCell *datasetCell =[collectionView cellForItemAtIndexPath:indexPath];
    //datasetCell.backgroundColor = [UIColor blueColor]; // highlight selection
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
  //  UICollectionViewCell *datasetCell =[collectionView cellForItemAtIndexPath:indexPath];
  //  datasetCell.backgroundColor = [UIColor redColor]; // Default color
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
   
    //[_textview.layer insertSublayer:bgLayer atIndex:0];
   

if(collectionView==self.myclubcollectionViewConroller)
{
UILabel *label1=[[UILabel alloc]initWithFrame:CGRectMake(0, 90, 80,20)];
cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"club" forIndexPath:indexPath];
    [[cell.contentView viewWithTag:123]removeFromSuperview];
//[[cell.contentView viewWithTag:123]removeFromSuperview] ;
  
     NSDictionary *item = sub_categories[indexPath.row];
    [item objectForKey:@"url_path"];
    NSURL *url = [NSURL URLWithString:[item objectForKey:@"logo_path"]];
  //  NSData *data = [NSData dataWithContentsOfURL:url];
    //UIImage *img = [[UIImage alloc] initWithData:data];
   
    
    
    UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake(5, 0, 80,80)];
    [imageview sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"loading_logo.png"]];
    
    //imageview.image=img;
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    label1.text=nil;
    label1.font=[UIFont fontWithName:@"Cervo-Light" size:13.0f];
    label1.textAlignment=NSTextAlignmentCenter;
    label1.text=[item objectForKey:@"sub_category_name"];
    [label1 setBackgroundColor:[UIColor clearColor]];
    label1.textColor=[UIColor whiteColor];
    label1.tag=123;
    [cell.contentView clearsContextBeforeDrawing];
    [cell.contentView addSubview:imageview];
    [cell.contentView addSubview:label1];
    /*
    if (cell.selected) {
        cell.backgroundColor = [UIColor blueColor]; // highlight selection
    }
    else
    {
        cell.backgroundColor = [UIColor redColor]; // Default color
    }
     */
    
//return cell;
}
else if(collectionView==self.mycollectionview)
{
    
    
    cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    [[cell.contentView viewWithTag:1234]removeFromSuperview] ;
    NSDictionary *item = stars[indexPath.row];
    
    
    
    NSURL *url = [NSURL URLWithString:[item objectForKey:@"image_path"]];
    // NSData *data = [NSData dataWithContentsOfURL:url];
    // UIImage *img = [[UIImage alloc] initWithData:data];
    UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 80,80)];
    imageview.image = nil;
    [imageview sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"loading_star.png"]];
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    // imageview.image=img;
    UILabel *label2=[[UILabel alloc]initWithFrame:CGRectMake(0,self.mycollectionview.frame.origin.y+60,cell.frame.size.width ,20)];
    //[imageview addSubview:label];
    
    //imageview.center=cell.center;
    label2.text=nil;
    label2.font=[UIFont fontWithName:@"Cervo-Light" size:16.0f];
    label2.text=[item objectForKey:@"star_name"];
    [label2 setBackgroundColor:[UIColor whiteColor]];
    label2.textColor=[UIColor blackColor];
    label2.textAlignment=NSTextAlignmentCenter;
    // imageview.image=img;
    UILabel *label3=[[UILabel alloc]initWithFrame:CGRectMake(0,self.mycollectionview.frame.origin.y+80,cell.frame.size.width ,20)];
    //[imageview addSubview:label];
    
    //imageview.center=cell.center;
    
    label3.text=nil;
    label3.font=[UIFont fontWithName:@"Cervo-Light" size:13.0f];
    label3.text=[item objectForKey:@"sub_category_name"];
    [label3 setBackgroundColor:[UIColor whiteColor]];
    label3.textColor=[UIColor blackColor];
    label3.textAlignment=NSTextAlignmentCenter;
    [cell.contentView clearsContextBeforeDrawing];
    [cell.contentView addSubview:imageview];
    label2.tag=1234;
    label3.tag=1234;
    
    [cell.contentView addSubview:label2];
    [cell.contentView addSubview:label3];
    
    
    
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

    temp2=(int)index;//selected menu
    
    selecdmenuItem=(int)index;
    [parent removeAllObjects];
    [stars removeAllObjects];
    [sub_categories removeAllObjects];
    
    
    NSMutableArray *temp=[[NSMutableArray alloc]init];
    temp=[head objectAtIndex:selecdmenuItem];
    selecdmenuItem=[[temp valueForKey:@"cat_id"] intValue];
    lbl.text=[temp valueForKey:@"name"];
    
    
    float btnwidth =
    [lbl.text boundingRectWithSize:lbl.frame.size
                           options:NSStringDrawingUsesLineFragmentOrigin
                        attributes:@{ NSFontAttributeName:lbl.font }
                           context:nil].size.width;
    [btn setCenter:CGPointMake(lbl.center.x+btnwidth-[lbl.text length] ,lbl.center.y)];

    
    
    _starLabel.text = [temp valueForKey:@"star_label"];
    _clubLabel.text =[temp valueForKey:@"category_label"];
    
    [self perseclub:dic_sub_cat];
    [self persestarplayers:dic_star];
    [_activityindicator startAnimating];
    dispatch_async(dispatch_get_main_queue(), ^{
        [_mycollectionview reloadData];
        [_myclubcollectionViewConroller reloadData];
    });
    [_activityindicator stopAnimating];
    [_activityindicator setHidden:YES];
    
    [_mycollectionview reloadData];
    [_myclubcollectionViewConroller reloadData];
    
    
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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"seeAll"])

    {
        SeeAllController *vc=segue.destinationViewController;
        vc.selectedButtonText=head[temp2][@"name"];;
        //vc.head_menu=[[NSMutableArray alloc]init];
        //vc.head_menu=head;
       // NSLog(@"%@",segue.destinationViewController);
        
        if(selecdmenuItem>0)
        {
           vc.selectedItem = [NSString stringWithFormat:@"%d", selecdmenuItem];
            
        }
        else
        {
          vc.selectedItem=@"0";
        }
        
    }
    
    
}
-(BOOL)prefersStatusBarHidden{
    return YES;
}

@end
