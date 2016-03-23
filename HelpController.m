//
//  HelpController.m
//  ipicgroup
//
//  Created by Mind Working Asia on 3/22/16.
//  Copyright © 2016 Mind Working Asia. All rights reserved.
//

#import "HelpController.h"
#import "DOPNavbarMenu.h"
@interface HelpController ()
{
    BOOL enabled;
    UIButton *btn;
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
    
    UILabel *lbl=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 70)];
    lbl.textColor=[UIColor whiteColor];
    lbl.text=@"Football";
    lbl.textAlignment = NSTextAlignmentCenter;
    lbl.textColor=[UIColor whiteColor];
    [lbl setBackgroundColor:[UIColor colorWithRed:0.031 green:0.231 blue:0.102 alpha:1]];
    //[self.navigationController.view setBackgroundColor:[UIColor clearColor]];
    btn=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2+50,20, 40, 40)];
    [btn setImage:[UIImage imageNamed:@"downarrow.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(openMenu:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.view addSubview:lbl];
    [self.navigationController.view  addSubview:btn];
    // Do any additional setup after loading the view.
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
        _menu =[[DOPNavbarMenu alloc] initWithItems:@[item1[0],item1[1],item1[2]] width:self.view.dop_width maximumNumberInRow:1 color:colors];;
        //_menu.backgroundColor = colors[counter++];
        
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

@end
