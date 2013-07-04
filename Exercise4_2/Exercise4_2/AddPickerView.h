//
//  AddPickerView.h
//  Exercise4_2
//
//  Created by Nguyen Thanh Son on 5/7/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddCell.h"

@interface AddPickerView : UIPickerView
<UIPickerViewDataSource,UIPickerViewDelegate>
@property (copy,nonatomic) NSArray *dayType;
@property (copy,nonatomic) NSArray *monthType;
@property (copy,nonatomic) NSArray *yearType;
@property (strong,nonatomic) IBOutlet UIPickerView *datePicker;
@property (copy,nonatomic) IBOutlet UIToolbar *toolbar;
-(IBAction)btnClick:(id)sender;
- (void) setCell:(AddCell *) c;
@end
