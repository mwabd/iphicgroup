//
//  SearchViewController.m
//  ipicgroup
//
//  Created by Mind Working Asia on 4/11/16.
//  Copyright © 2016 Mind Working Asia. All rights reserved.
//
#import "menu.h"
#import "SearchViewController.h"


@interface SearchViewController ()

@end


@implementation SearchViewController


-(void) viewDidLoad{
    [super viewDidLoad];
    totalContent=[[NSMutableArray alloc]init];

    myTableView.delegate = self;
    myTableView.dataSource = self;
    mysearchBar.delegate = self;
    UIBarButtonItem *myBackButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.backBarButtonItem = myBackButton;
    [self loadData];
    
    
}

-(IBAction)returnToPrevious:(id)sender
{
    
   // [self ]
}

-(void) searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [myTableView resignFirstResponder];
    
}
-(void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if(searchText.length ==0)
    {
        isSearching = NO;
        [filteredContentList removeAllObjects];
        
    }
    else
    {
        isSearching =YES;
        [filteredContentList removeAllObjects];
        filteredContentList = [[NSMutableArray alloc] init];
        
        for(NSMutableArray *content in totalContent)
        {
            NSString *str =[content valueForKey:@"name"];
            NSRange stringRange = [str rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(stringRange.location != NSNotFound)
            {
                [filteredContentList  addObject:content];
            }
        }
        
        
    }
    [myTableView reloadData];
    
}
-(void)loadData
{
   
   
       NSInteger k=0;
    for (NSDictionary *item in dic_sub_cat) {
     if([[item objectForKey:@"category_id"] isEqualToString:_cat_id])//sports
     {
    NSMutableDictionary *parent=[[NSMutableDictionary alloc]init];
    [parent setObject:[item objectForKey:@"sub_category_name"] forKey:@"name" ];
    [parent setObject:[item objectForKey:@"url_path"] forKey:@"path"];
    [totalContent insertObject:parent atIndex:k];
    k++;
   }
}
    
    for (NSDictionary *item in dic_star) {
        if([[item objectForKey:@"category_id"] isEqualToString:_cat_id])//sports
        {
        NSMutableDictionary *parent=[[NSMutableDictionary alloc]init];
        [parent setObject:[item objectForKey:@"sub_category_name"] forKey:@"club" ];
        [parent setObject:[item objectForKey:@"url_path"] forKey:@"path"];
        [parent setObject:[item objectForKey:@"star_name"] forKey:@"name"];
        [totalContent insertObject:parent atIndex:k];
        k++;
        }
    }
    
    
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(isSearching)
       {
           return [filteredContentList count];
       }
    return [totalContent count];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    NSMutableArray *temp=[[NSMutableArray alloc]init];
    if(filteredContentList.count > 0){
    temp=[filteredContentList objectAtIndex:indexPath.row];
    }
    else{
            temp=[totalContent objectAtIndex:indexPath.row];
    }
    
    NSString *string = [temp valueForKey:@"path"];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:string]];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentityfier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentityfier];
   

    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentityfier];
    }
    if(!isSearching)
    {
        [cell.contentView clearsContextBeforeDrawing];

        NSMutableArray *temp=[[NSMutableArray alloc]init];
        temp=[totalContent objectAtIndex:indexPath.row];
        NSString *club = [temp valueForKey:@"club"];
        cell.textLabel.text =  [temp valueForKey:@"name"];

        if(club != nil){
        
            UILabel *lblClub=[[UILabel alloc]initWithFrame:CGRectMake(20,30,cell.frame.size.width ,20)];
            lblClub.text=nil;
            lblClub.text=[temp valueForKey:@"club"];
            [lblClub setBackgroundColor:[UIColor whiteColor]];
            lblClub.textColor=[UIColor grayColor];
            [lblClub setFont:[UIFont systemFontOfSize:12]];
            [cell.contentView addSubview:lblClub];
            
        }
        
        
    }
    else
    {
        [cell.contentView clearsContextBeforeDrawing];
        NSMutableArray *temp=[[NSMutableArray alloc]init];
        temp=[filteredContentList objectAtIndex:indexPath.row];
        cell.textLabel.text =  [temp valueForKey:@"name"];
        NSString *club = [temp valueForKey:@"club"];
        
        if(club != nil){
            
            UILabel *lblClub=[[UILabel alloc]initWithFrame:CGRectMake(20,30,cell.frame.size.width ,20)];
            lblClub.text=[temp valueForKey:@"club"];
            [lblClub setBackgroundColor:[UIColor whiteColor]];
            lblClub.textColor=[UIColor grayColor];
            [lblClub setFont:[UIFont systemFontOfSize:12]];
            [cell.contentView addSubview:lblClub];
        }

        
    }
    
    return cell;
}


-(void) didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    
}
@end
