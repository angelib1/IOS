//
//  AddCell.h
//  Exercise4_2
//
//  Created by Nguyen Thanh Son on 5/8/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblLabel;
@property (weak, nonatomic) IBOutlet UILabel *lblValue;
@property (copy,nonatomic) NSString *lblLabel1;
@property (copy,nonatomic) NSString *lblValue1;

@end
