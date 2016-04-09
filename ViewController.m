#import "ViewController.h"
#import "DOPNavbarMenu.h"
#import "HelpController.h"
#include "BackgroundLayer.h"
#import "AFNetworking.h"
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
    NSMutableArray *head;
//int k;
NSMutableArray *name_of_item;
NSMutableArray *image_of_item;
UILabel *lbl;
NSMutableArray * colors;
UICollectionViewCell *cell;
UILabel *label;
    
    int selecdmenuItem;
    NSDictionary *mdataDictionary;
    NSDictionary *cdataDictionary;
    NSDictionary *pdataDictionary;
    NSMutableArray *name_of_player;
    NSMutableArray *image_of_player;
    
    AFHTTPRequestOperationManager *operation;
    
    //UIActivityIndicatorView *indicator;
}
/*
-(void)createloader
{
    indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    indicator.frame = CGRectMake(0.0, 0.0, 140.0, 140.0);
    indicator.center = self.view.center;
    [_clubview addSubview:indicator];
    [indicator bringSubviewToFront:_clubview];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = TRUE;
    indicator.hidden=NO;
    NSLog(@"%@",indicator);
}
*/

-(void)persemenu:(NSDictionary*) items
{
   NSInteger k=0;
    BOOL flag;
    flag=YES;
    NSLog(@"%@sel",_selectedItem);
    for (NSDictionary *item in items[@"menu"]) {
        
         if([[item objectForKey:@"category_menu"]isEqualToString:_selectedItem])//sports
         {
             if(flag)
             {
                 selecdmenuItem=[[item objectForKey:@"category_id"] intValue];
                 flag=NO;
             }
             parent=[[NSMutableDictionary alloc]init];
             [parent setObject:[item objectForKey:@"category_name"] forKey:@"name"  ];
             [parent setObject:[item objectForKey:@"category_id"] forKey:@"cat_id"];
             [head insertObject:parent atIndex:k];
             k++;
           
         }
   
        
        

    }
   // NSMutableArray *temp=[[NSMutableArray alloc]init];
   // temp=[head objectAtIndex:0];
   // NSLog(@"%@",[temp valueForKey:@"name"]);
    //exit(0);
}
-(void)persestarplayers:(NSDictionary*) items
{
    int k=0;
    NSString *myString=[NSString stringWithFormat: @"%d",(selecdmenuItem)];
   if(selecdmenuItem>0)
    myString =  [NSString stringWithFormat: @"%d",selecdmenuItem];;
    NSLog(@"%@Menuitem",myString);
    for (NSDictionary *item in items[@"info"]) {
        if([[item objectForKey:@"category_id"]isEqualToString:myString])
        {//sports
            name_of_player[k]=[item objectForKey:@"star_name"];
            image_of_player[k]=[item objectForKey:@"image_path"];;
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
    
    for (NSDictionary *item in items[@"category"]) {
         [item objectForKey:@"category_id"];
        if([(NSString*)[item objectForKey:@"category_id"]isEqualToString:myString])
            //football
        {
            name_of_item[k]=[item objectForKey:@"sub_category_name"];
            image_of_item[k]=[item objectForKey:@"logo_path"];
            k++;
        }
        
       
    }
    
}



-(void)loadData
{
    NSString *docPath=[NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES)objectAtIndex:0];
    NSLog(@"%@",docPath);
    NSString *servey=[docPath stringByAppendingPathComponent:@"results.plist"];
    NSLog(@"%@",servey);
    
    if([[NSFileManager defaultManager]fileExistsAtPath:servey])
    {
        NSFileHandle *fileHandle=[NSFileHandle fileHandleForReadingAtPath:servey];
        //NSString *surveresult=[[NSString alloc]initWithData:[fileHandle availableData] encoding:NSUTF8StringEncoding];
        NSString *file = [[NSBundle mainBundle] pathForResource:servey ofType:@"plist"];
        mdataDictionary = [[NSDictionary alloc] initWithContentsOfFile:servey];
       
        [fileHandle closeFile];
        [self loadMyview:self.selectedItem];
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
    
    if(([self.selectedItem isEqual:@"SPORTS"]))
    {
        [_tapbar setSelectedItem:[[_tapbar items] objectAtIndex:0]];
    }
    else  if(([self.selectedItem isEqual:@"ENTERTAINMENT"]))
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
    HelpController *help = [self.storyboard instantiateViewControllerWithIdentifier:@"helpviewcontroller"];
    [self presentViewController:help animated:NO completion:nil];
}

-(void)loadMyview:(NSString*)selected
{
    //TabBar *tab;
    counter=0;
    count=0;;
    
    /*init array*/
    [self persemenu:mdataDictionary];
    [self perseclub:mdataDictionary];
    [self persestarplayers:mdataDictionary];
    
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
    NSMutableArray *temp=[[NSMutableArray alloc]init];
    temp=[head objectAtIndex:0];
    selecdmenuItem=[[temp valueForKey:@"cat_id"] intValue];
    lbl.text=[temp valueForKey:@"name"];
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
    bgLayer = [BackgroundLayer clubGradient];
    bgLayer.frame = self.view.bounds;
    bgLayer.frame=self.clubview.bounds;
    [self.clubview.layer insertSublayer:bgLayer atIndex:0];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //[indicator startAnimating];
    //[self createloader];
    parent=[[NSMutableDictionary alloc]init];
    image_of_item=[[NSMutableArray alloc]init];
    name_of_item=[[NSMutableArray alloc]init];
    head=[[NSMutableArray alloc]init];
    image_of_player=[[NSMutableArray alloc]init];
    name_of_player=[[NSMutableArray alloc]init];
    
    _mycollectionview.delegate=self;
    _mycollectionview.dataSource=self;
    parent=[[NSMutableDictionary alloc]init];
    image_of_item=[[NSMutableArray alloc]init];
    name_of_item=[[NSMutableArray alloc]init];
   // [indicator startAnimating];
    [self loadData];
    
    //[self loadMyview:self.selectedItem];
    [self createTab];
    //
  
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

return [name_of_item count];
}
else
{   return [name_of_player count];
}
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
return 1;
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    [parent removeAllObjects];
    //[self datasource_init:item.title];
    [_mycollectionview reloadData];
    [_myclubcollectionViewConroller reloadData];
    //[cell.contentView.layer removeFromSuperlayer];
    _menu=nil;
    lbl.text=item.title;
   
   
}
- (AFHTTPRequestOperationManager *)operationManager
{
    if (!operation)
    {
        operation = [[AFHTTPRequestOperationManager alloc] init];
        operation.responseSerializer = [AFImageResponseSerializer serializer];
    };
    
    return operation;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
   
    //[_textview.layer insertSublayer:bgLayer atIndex:0];
    

if(collectionView==self.myclubcollectionViewConroller)
{
UILabel *label1=[[UILabel alloc]initWithFrame:CGRectMake(0, 90, 80,20)];
cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"club" forIndexPath:indexPath];
[[cell.contentView viewWithTag:123]removeFromSuperview] ;
    
    ///
    
    
    ///
    
    
    //NSURL *url = [NSURL URLWithString:image_of_item[indexPath.section]];
    //NSData *data = [NSData dataWithContentsOfURL:url];
    //UIImage *img = [[UIImage alloc] initWithData:data];
    UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 80,80)];
    //imageview.image=img;
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    label1.text=nil;
    label1.text=name_of_item[indexPath.section];
    [label1 setBackgroundColor:[UIColor clearColor]];
    label1.textColor=[UIColor whiteColor];
    label1.tag=123;
    
    //cell.imageView.image = [UIImage imageNamed:@"placeholder"];
    
    [[self operationManager] GET:image_of_item[indexPath.section]
                    parameters:nil
                       success:^(AFHTTPRequestOperation *operation, id responseObject) {
                           imageview.image=responseObject;
                           
                       } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                           NSLog(@"Failed with error %@.", error);
                       }];
    
    [cell.contentView addSubview:imageview];
    [cell.contentView addSubview:label1];
return cell;
}
else if(collectionView==self.mycollectionview)
{

    
    cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    [[cell.contentView viewWithTag:1234]removeFromSuperview] ;
    ;
   // NSURL *url = [NSURL URLWithString:image_of_player[indexPath.section]];
    //NSData *data = [NSData dataWithContentsOfURL:url];
    //UIImage *img = [[UIImage alloc] initWithData:data];
    UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 80,80)];
    //imageview.image=img;
    
    [[self operationManager] GET:image_of_player[indexPath.section]
                      parameters:nil
                         success:^(AFHTTPRequestOperation *operation, id responseObject) {
                             imageview.image=responseObject;
                             
                         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                             NSLog(@"Failed with error %@.", error);
                         }];

    UILabel *label2=[[UILabel alloc]initWithFrame:CGRectMake(0,self.mycollectionview.frame.origin.y+50,cell.frame.size.width ,20)];
    //[imageview addSubview:label];
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    //imageview.center=cell.center;
    label2.text=nil;
    label2.text=name_of_player[indexPath.section];
    [label2 setBackgroundColor:[UIColor clearColor]];
    label2.textColor=[UIColor blackColor];
    [cell.contentView clearsContextBeforeDrawing];
    //[cell.contentView addSubview:imageview];
    label2.tag=1234;
    [cell.contentView addSubview:label2];
    [cell.contentView addSubview:imageview];


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
// UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"you selected" message:[NSString stringWithFormat:@"number %@", @(index+1)] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//[av show];
    //lbl.text=parent[index][@"name"];
    selecdmenuItem=(int)index;
    [parent removeAllObjects];
    //[head removeAllObjects];
    
    [image_of_player removeAllObjects];
    [name_of_player removeAllObjects];
    [name_of_item removeAllObjects];
    [image_of_item removeAllObjects];
    //head=[[NSMutableArray alloc]init];
    NSLog(@"----");
    NSMutableArray *temp=[[NSMutableArray alloc]init];
    temp=[head objectAtIndex:selecdmenuItem];
    selecdmenuItem=[[temp valueForKey:@"cat_id"] intValue];
    lbl.text=[temp valueForKey:@"name"];
    
    [self perseclub:cdataDictionary];
    [self persestarplayers:pdataDictionary];
    //[indicator startAnimating];
    dispatch_async(dispatch_get_main_queue(), ^{
        [_mycollectionview reloadData];
        [_myclubcollectionViewConroller reloadData];
    });
    //[indicator stopAnimating];
   // [self createTab];
    
    
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
