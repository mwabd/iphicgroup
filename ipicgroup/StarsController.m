//
//  StarsController.m
//  ipicgroup
//
//  Created by Mind Working Asia on 4/12/16.
//  Copyright © 2016 Mind Working Asia. All rights reserved.
//
#import "StarsController.h"
#import "UIImageView+WebCache.h"
#import "menu.h"
#

@interface StarsController ()
@end

@implementation StarsController

UIButton *btn;
UICollectionViewCell *cell;
NSMutableArray *all_stars;

-(void) datasource_init:(NSString*)selected
{
        int k=0;
    for (NSDictionary *item in dic_star) {
         if([[item objectForKey:@"category_id"]isEqualToString:selected])
        {//sports
            
            all_stars[k] = item;
            k++;
        }
        
    }
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    all_stars =[[NSMutableArray alloc]init];
    //  [self loadMyview:@"1"];
    
    [self datasource_init:_cat_id];
    
    myTableView.delegate = self;
    myTableView.dataSource = self;
    
    btn=[[UIButton alloc]initWithFrame:CGRectMake(0, 10, 80, 45)];
    NSString *str = [@"<< " stringByAppendingString:_cat_name];
    btn.titleLabel.font = [UIFont fontWithName:@"Cervo-Light" size:20];
    // btn.font=[UIFont fontWithName:@"Cervo-Light" size:16.0f];
    [btn setTitle:str forState:UIControlStateNormal];;
    
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view  addSubview:btn];
    
    
}
- (void)buttonClicked:(UIButton*)button
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(BOOL)shouldAutorotate
{
    return NO;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [all_stars count];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    NSDictionary *item = all_stars[indexPath.row];
    
    NSString *string = [item objectForKey:@"url_path"];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:string]];
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
    // This is just Programatic method you can also do that by xib !
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentityfier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentityfier];
    
    
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentityfier];
    }
    
    NSDictionary *item = all_stars[indexPath.row];
    
    
    NSURL *url = [NSURL URLWithString:[item objectForKey:@"image_path"]];
    UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake(10, 0, 80,80)];
    imageview.image = nil;
    [imageview sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"loading_star.png"]];
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    
    
    UILabel *lblStar=[[UILabel alloc]initWithFrame:CGRectMake(92,20,130 ,20)];
    //[imageview addSubview:label];
    
    //imageview.center=cell.center;
    lblStar.text=nil;
    lblStar.text=[item objectForKey:@"star_name"];
    [lblStar setBackgroundColor:[UIColor whiteColor]];
    lblStar.textColor=[UIColor blackColor];
    
    
    UILabel *lblClub=[[UILabel alloc]initWithFrame:CGRectMake(92,40,130 ,20)];
    //[imageview addSubview:label];
    
    //imageview.center=cell.center;
    lblClub.text=nil;
    lblClub.text=[item objectForKey:@"sub_category_name"];
    [lblClub setBackgroundColor:[UIColor whiteColor]];
    lblClub.textColor=[UIColor grayColor];
    [lblClub setFont:[UIFont systemFontOfSize:12]];
    
    [cell.contentView addSubview:imageview];
    [cell.contentView addSubview:lblStar];
    [cell.contentView addSubview:lblClub];
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
