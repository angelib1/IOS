//
//  ViewController.h
//  Exercise6
//
//  Created by Nguyen Thanh Son on 4/24/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)sliderDateChange:(UISlider *)sender;
//@property (weak, nonatomic) IBOutlet UILabel *lblDate;
//@property (weak, nonatomic) IBOutlet UILabel *lblTime;
@property (weak, nonatomic) IBOutlet UISlider *sliderDate;
@property (weak, nonatomic) IBOutlet UISlider *sliderTime;
//@property (copy,nonatomic) NSArray *date;
@end