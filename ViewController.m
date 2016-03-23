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
    /* for (float hue = 0.2; hue <= 5; hue += .3) {
     UIColor *color = [UIColor colorWithRed:0.039 green:0.239+hue blue:0.11 alpha:.1+hue];
     [colors addObject:color];
     }
     */
    UIColor *color = [UIColor colorWithRed:0.031 green:0.231 blue:0.102 alpha:1];
    [colors addObject:color];
    color=[UIColor colorWithRed:0.051 green:0.365 blue:0.165 alpha:1];
    [colors addObject:color];
    color=[UIColor colorWithRed:0.071 green:0.533 blue:0.235 alpha:1];
    [colors addObject:color];
    DOPNavbarMenuItem *item1[3];
    item1[0]= [DOPNavbarMenuItem ItemWithTitle:@"Football"];
    item1[1]= [DOPNavbarMenuItem ItemWithTitle:@"Cricket"];
    item1[2]= [DOPNavbarMenuItem ItemWithTitle:@"Rugby"];
    //UIColor *color2=[UIColor colorWithRed:0.271 green:0.533 blue:0.09 alpha:1];;
    _menu =[[DOPNavbarMenu alloc] initWithItems:@[item1[0],item1[1],item1[2]] width:self.view.dop_width maximumNumberInRow:_numberOfItemsInRow color:colors];;
    //_menu.backgroundColor = colors[counter++];
    
    _menu.separatarColor = [UIColor colorWithRed:0.129 green:0.569 blue:0.208 alpha:1];
    _menu.delegate = self;
}
return _menu;
}

- (void)viewDidLoad {
[super viewDidLoad];
counter=0;
    count=0;;


//scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,0,1024,768)];



self.myscrollview.bounces=NO;
int numberOfViews = 5;
for (int i = 0; i < numberOfViews; i++) {
    UIImage *images=[UIImage imageNamed:@"slideshow.jpg"];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i*self.myscrollview.frame.size.width,0,self.myscrollview.frame.size.width,self.myscrollview.frame.size.height)];
    [imageView setImage:images];
    [self.myscrollview addSubview:imageView];
    
}

// Set the contentSize equal to the size of the UIImageView
// scrollView.contentSize = imageView.scrollview.size;
self.myscrollview.contentSize = CGSizeMake(numberOfViews * self.myscrollview.frame.size.width, self.myscrollview.frame.size.height);


// Finally, add the UIScrollView to the controller's view
//[self.view addSubview:scrollView];


// [self.navigationController.navigationBar setTintColor:[UIColor redColor]];
self.numberOfItemsInRow = 1;
//self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"menu" style:UIBarButtonItemStylePlain target:self action:@selector(openMenu:)];
// self.navigationController.view setBackgroundColor:[UI c]
UILabel *lbl=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 70)];
lbl.textColor=[UIColor whiteColor];
lbl.text=@"Football";
lbl.textAlignment = NSTextAlignmentCenter;
lbl.textColor=[UIColor whiteColor];
[lbl setBackgroundColor:[UIColor colorWithRed:0.031 green:0.231 blue:0.102 alpha:1]];
//[self.navigationController.view setBackgroundColor:[UIColor clearColor]];
btn=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2+50,20, 40, 40)];
[btn setImage:[UIImage imageNamed:@"right.jpg"] forState:UIControlStateNormal];
[btn addTarget:self action:@selector(openMenu:) forControlEvents:UIControlEventTouchUpInside];
[self.navigationController.view addSubview:lbl];
[self.navigationController.view  addSubview:btn];
UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
[flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
[flowLayout setMinimumInteritemSpacing:0.0f];
[flowLayout setMinimumLineSpacing:0.0f];
    [self.mycollectionview setPagingEnabled:YES];

[self.mycollectionview setCollectionViewLayout:flowLayout];
[self.mycollectionview setBounces:NO];
    
[self.myclubcollectionViewConroller setCollectionViewLayout:flowLayout];

    
 }

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
return UIEdgeInsetsMake(10, 10, 10, 10);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
CGSize retval =CGSizeMake(100,100);
return retval;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
return 100;

}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath


{
    
   UICollectionViewCell *cell;
    if(collectionView==self.mycollectionview)
    {
cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        UIImage *img=[UIImage imageNamed:@"players-template-rugby.png"];
        
        UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
        imageview.image=img;
        
       
        imageview.contentMode = UIViewContentModeScaleAspectFit;
        imageview.center=cell.center;
        [cell setBackgroundView:imageview];
        return cell;
    }
else if(collectionView==self.myclubcollectionViewConroller)
    {
        
        if(count%2==0)
        {
        cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"club" forIndexPath:indexPath];
        UIImage *img=[UIImage imageNamed:@"clubname.png"];
        
        UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
        imageview.image=img;
        [imageview setBackgroundColor:[UIColor whiteColor]];
        
        imageview.contentMode = UIViewContentModeScaleAspectFit;
        imageview.center=cell.center;
        [cell setBackgroundView:imageview];
        }
        else
        {
            cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"club" forIndexPath:indexPath];
            UIImage *img=[UIImage imageNamed:@"cherryl.png"];
            
            UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
            imageview.image=img;
            [imageview setBackgroundColor:[UIColor whiteColor]];
            
            imageview.contentMode = UIViewContentModeScaleAspectFit;
            imageview.center=cell.center;
            [cell setBackgroundView:imageview];
        }
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
