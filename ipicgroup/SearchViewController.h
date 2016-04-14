//
//  SearchViewController.h
//  ipicgroup
//
//  Created by Mind Working Asia on 4/11/16.
//  Copyright © 2016 Mind Working Asia. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SearchViewControllerDelegate <NSObject>
@required
- (void)cat_idFromController:(NSString *)cat_id;
- (void)cat_nameFromController:(NSString *)cat_name;
@end

@interface SearchViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>{
    IBOutlet UITableView *myTableView;
    IBOutlet UISearchBar *mysearchBar;
    
    NSMutableArray *contentList;
    NSMutableArray *totalContent;
    NSMutableArray *filteredContentList;
    BOOL isSearching;
    
    
}
@property (nonatomic, weak) IBOutlet UIButton *back;
@property (nonatomic, retain) NSString *cat_id;
@property (nonatomic, retain) NSString *cat_name;
@property (nonatomic, weak) id<SearchViewControllerDelegate> delegate;

-(IBAction)returnToPrevious:(id)sender;
@end
