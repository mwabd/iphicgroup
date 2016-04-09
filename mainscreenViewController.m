//
//  mainscreenViewController.m
//  ipicgroup
//
//  Created by Mind Working Asia on 3/18/16.
//  Copyright © 2016 Mind Working Asia. All rights reserved.
//

#import "mainscreenViewController.h"
#import "menu.h"
#include "AFNetworking.h"
@interface mainscreenViewController ()

@end

@implementation mainscreenViewController
-(void)write_file:(NSDictionary*)object
{
    NSString *docPath=[NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES)objectAtIndex:0];
    NSLog(@"%@",docPath);
    NSString *servey=[docPath stringByAppendingPathComponent:@"results.plist"];
    NSLog(@"%@",servey);
    NSError * error = nil;
    [[NSFileManager defaultManager] createDirectoryAtPath:docPath
                              withIntermediateDirectories:YES
                                               attributes:nil
                                                    error:&error];
    if(![[NSFileManager defaultManager]fileExistsAtPath:servey])
    {
        [[NSFileManager defaultManager]createFileAtPath:servey contents:nil attributes:nil];
    }
    NSFileHandle *fileHandle=[NSFileHandle fileHandleForUpdatingAtPath:servey];
    [fileHandle seekToEndOfFile];
    //[fileHandle writeData:[@"Manzoor Husain" dataUsingEncoding:NSUTF8StringEncoding]];
    //[[object JSONRepresentation] writeToURL:servey atomically:YES];
    //[[object ] writeToFile:servey atomically:YES encoding:NSUTF8StringEncoding error:NULL];
     error=nil;
    NSData *data = [NSPropertyListSerialization dataFromPropertyList:object
                                                              format:NSPropertyListXMLFormat_v1_0 errorDescription:&error];
    
    
    // Path in the documents directory to save file
  //  NSString  *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/test.xml"];
    
    // Write the data to file
    if([data writeToFile:servey atomically:YES])
    {
        NSLog(@"Successfully saved");
    }
    [fileHandle closeFile];
    
    
    if([[NSFileManager defaultManager]fileExistsAtPath:servey])
    {
        NSFileHandle *fileHandle=[NSFileHandle fileHandleForReadingAtPath:servey];
        NSString *surveresult=[[NSString alloc]initWithData:[fileHandle availableData] encoding:NSUTF8StringEncoding];
        [fileHandle closeFile];
        NSLog(@"%@",surveresult);
    }
    
}
-(void)loadData
{
    NSLog(@"LOAD DATA");
    NSURL *mURL = [NSURL URLWithString:@"http://83.138.133.168/ipic/json.php"];
    
    //NSData *mjsonData = [NSData dataWithContentsOfURL:mURL];
    //NSData *cjsonData = [NSData dataWithContentsOfURL:cURL];
    //NSData *pjsonData = [NSData dataWithContentsOfURL:pURL];
    
    NSError *error = nil;
    
    ;
    //cdataDictionary = [NSJSONSerialization JSONObjectWithData:cjsonData options:0 error:&error];
    //pdataDictionary = [NSJSONSerialization JSONObjectWithData:pjsonData options:0 error:&error];
    
    
    // NSLog(@"%@",dataDictionary);NSLog(@"%@",cdataDictionary);NSLog(@"%@",pdataDictionary);
    
    
    //NSString *string = BaseURLString;
    //NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:mURL];
    
    // 2
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
     [self write_file:responseObject];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        // 4
        
    }];
    
    // 5
    [operation start];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadData];
    
    }
-(BOOL)shouldAutorotate{
    return NO;
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}


- (void)buttonClicked:(UIButton*)button
{
    MenuController *addController = [[MenuController alloc] init];
    
    addController.modalPresentationStyle = UIModalPresentationFullScreen;
    addController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:addController animated:YES completion: nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
