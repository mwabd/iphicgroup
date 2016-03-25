#import "ViewController.h"
#import "DOPNavbarMenu.h"



@interface ViewController () <UITextViewDelegate, DOPNavbarMenuDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

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
NSMutableArray *colors=[NSMutableArray array];
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
- (void)viewDidLoad {
[super viewDidLoad];
counter=0;
count=0;;
k=0;
int name_of_item_count=0;
int image_of_item_count=0;

/*init array*/
//selecteditem=@"SPORTS";
parent=[[NSMutableArray alloc]init];
image_of_item=[[NSMutableArray alloc]init];
name_of_item=[[NSMutableArray alloc]init];
NSString *file = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:file];
for (id row  in dict[@"Category Sub Menu"][_selectedItem]) {
       parent[k++]=row;
        for(int i=1;i<=[dict[@"Category Sub Menu"][_selectedItem][row] count];i++)
        {
          
           NSString *string = [NSString stringWithFormat:@"%d", i];
            
            string=[@"name" stringByAppendingString:string];
            ;
            if([dict[@"Category Sub Menu"][_selectedItem][row][string] length]>0)
            {
                name_of_item[name_of_item_count++]=dict[@"Category Sub Menu"][_selectedItem][row][string];
                
            }
            
            string=@"";
            string = [NSString stringWithFormat:@"%d", i];
            string=[@"image" stringByAppendingString:string];
            if([dict[@"Category Sub Menu"][_selectedItem][row][string] length]>0)
            {
               
                image_of_item[image_of_item_count++]=dict[@"Category Sub Menu"][_selectedItem][row][string];
               
            }
        string=@"";
        }
}
    

/*init array*/
self.myscrollview.bounces=NO;
int numberOfViews = 5;
for (int i = 0; i < numberOfViews; i++) {
UIImage *images=[UIImage imageNamed:@"slideshow.jpg"];

UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i*self.myscrollview.frame.size.width,0,self.myscrollview.frame.size.width,self.myscrollview.frame.size.height)];
[imageView setImage:images];
[self.myscrollview addSubview:imageView];
}
self.myscrollview.contentSize = CGSizeMake(numberOfViews * self.myscrollview.frame.size.width, self.myscrollview.frame.size.height+15);
//self.myclubcollectionViewConroller.contentSize = CGSizeMake(numberOfViews * self.myscrollview.frame.size.width, self.myscrollview.frame.size.height+15);
self.numberOfItemsInRow = 1;
UILabel *lbl=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 70)];
lbl.textColor=[UIColor whiteColor];
lbl.text=_selectedItem;
lbl.textAlignment = NSTextAlignmentCenter;
lbl.textColor=[UIColor whiteColor];
[lbl setBackgroundColor:[UIColor colorWithRed:0.031 green:0.231 blue:0.102 alpha:1]];
btn=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2+50,20, 40, 40)];
[btn setImage:[UIImage imageNamed:@"downarrow.png"] forState:UIControlStateNormal];
[btn addTarget:self action:@selector(openMenu:) forControlEvents:UIControlEventTouchUpInside];
[self.navigationController.view addSubview:lbl];
[self.navigationController.view  addSubview:btn];
UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
[flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
[flowLayout setMinimumInteritemSpacing:0.0f];
[flowLayout setMinimumLineSpacing:0.0f];
//self.mycollectionview.contentSize=CGSizeMake(100,100);
//self.myclubcollectionViewConroller.contentSize=CGSizeMake(100,100);
[self.mycollectionview setPagingEnabled:YES];
[self.mycollectionview setCollectionViewLayout:flowLayout];
[self.mycollectionview setBounces:NO];
[self.myclubcollectionViewConroller setCollectionViewLayout:flowLayout];
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
return UIEdgeInsetsMake(30, 30, 30, 30);;//UIEdgeInsetsMake(50, 20, 50, 20);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
CGSize retval =CGSizeMake(80,80);
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

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
  
UICollectionViewCell *cell;
if(collectionView==self.myclubcollectionViewConroller)
{
cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"club" forIndexPath:indexPath];
UIImage *img=[UIImage imageNamed:image_of_item[indexPath.section]];


UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
imageview.image=img;
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0 , 60, 100, 20)];
    [imageview addSubview:label];
imageview.contentMode = UIViewContentModeScaleAspectFit;
imageview.center=cell.center;
label.text=name_of_item[indexPath.section];
    [label setBackgroundColor:[UIColor whiteColor]];
[cell setBackgroundView:imageview];
return cell;
}
else if(collectionView==self.mycollectionview)
{


    cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    UIImage *img=[UIImage imageNamed:@"players-template-rugby.png"];
    
    UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    imageview.image=img;
    [imageview setBackgroundColor:[UIColor whiteColor]];
    
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    imageview.center=cell.center;
    [cell setBackgroundView:imageview];

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
