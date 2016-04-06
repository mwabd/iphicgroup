//
//  ViewController.m
//  ipicgroup
//
//  Created by Mind Working Asia on 3/17/16.
//  Copyright (c) 2016 Mind Working Asia. All rights reserved.
//

#import "menu.h"
#include "ViewController.h"
@interface MenuController ()
{
NSArray *_pickerData;
//UIPickerView *picker;
    NSString *selecteditem;
}

@end
@implementation MenuController

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}
-(BOOL)shouldAutorotate{
    return NO;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _pickerData = @[@"SPORTS", @"ENTERTAINMENT", @"SERVICES"];
   _picker.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    _picker.showsSelectionIndicator=NO;
    _picker.dataSource = self;
    _picker.delegate = self;
    selecteditem=@"ENTERTAINMENT";
    [_picker selectRow:1 inComponent:0 animated:YES];
    self.view.opaque=NO;
    //[self loadData];
      
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    ViewController *vc=segue.destinationViewController.childViewControllers[0];
    if([selecteditem isEqual:(@"SPORTS")])
        vc.selectedItem=@"0";
    if([selecteditem isEqual:(@"ENTERTAINMENT")])
        vc.selectedItem=@"1";
    if([selecteditem isEqual:(@"SERVICES")])
        vc.selectedItem=@"2";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    
    return 1;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    selecteditem=[_pickerData objectAtIndex:row%3];
     [self pickerViewLoaded:nil];

}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
  
    return 3;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    

    return 70;
}




-(void)pickerViewLoaded: (id)blah {
    NSUInteger max = 1638;
    NSUInteger base10 = (max/2)-(max/2)%3;
    [_picker selectRow:[_picker selectedRowInComponent:0]%3+base10 inComponent:0 animated:NO];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowWidthForComponent:(NSInteger)component
{
    return self.view.frame.size.width;
}
 -(NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString *title = @"";
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    
    title = [NSString stringWithFormat: @"%@", _pickerData[row%3]];
    
    
    [paragraphStyle setAlignment:NSTextAlignmentCenter];
    
    
    
    
    return [[NSAttributedString alloc] initWithString:title attributes:
            @{NSForegroundColorAttributeName: [UIColor whiteColor],
              NSFontAttributeName:[UIFont systemFontOfSize:32.0],
              NSParagraphStyleAttributeName: paragraphStyle
              }];
}
 @end
