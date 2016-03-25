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
    [_picker selectRow:1 inComponent:0 animated:YES];
    self.view.opaque=NO;
    
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    ViewController *vc=segue.destinationViewController.childViewControllers[0];
    vc.selectedItem=selecteditem;
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
    selecteditem=[_pickerData objectAtIndex:row];



}



- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
  
    return _pickerData.count;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    

    return 70;
}


- (CGFloat)pickerView:(UIPickerView *)pickerView rowWidthForComponent:(NSInteger)component
{
    return self.view.frame.size.width;
}
- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString *title = @"";
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    
    title = [NSString stringWithFormat: @"%@", _pickerData[row]];
    
    
    [paragraphStyle setAlignment:NSTextAlignmentCenter];
    
    
    
    
    return [[NSAttributedString alloc] initWithString:title attributes:
            @{NSForegroundColorAttributeName: [UIColor whiteColor],
              NSFontAttributeName:[UIFont systemFontOfSize:32.0],
              NSParagraphStyleAttributeName: paragraphStyle
              }];
}@end
