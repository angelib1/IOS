//
//  BIDAddCell.m
//  Exersice11
//
//  Created by Nguyen Thanh Son on 8/1/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import "BIDAddCell.h"

@implementation BIDAddCell
@synthesize Label,image,subLabel,subLabelInfo;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
   
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIFont *a=[UIFont fontWithName:@"Helvetica" size:14];
        // Initialization code
        Label=[[UILabel alloc]initWithFrame:CGRectMake(0, 10, 300, 20)];
        Label.backgroundColor=[UIColor clearColor];
        Label.text=@"Label";
        Label.textColor=[UIColor whiteColor];
        [self addSubview:Label];
        image=[[UIImageView alloc]initWithFrame:CGRectMake(5, 15, 45, 35)];
        [self addSubview:image];
        subLabel=[[UILabel alloc]initWithFrame:CGRectMake(50, 30, 100, 20)];
        subLabel.text=@"Label";
        subLabel.textColor=[UIColor orangeColor];
        subLabel.backgroundColor=[UIColor clearColor];
        subLabel.font=a;
        [self addSubview:subLabel];
        subLabelInfo=[[UILabel alloc]initWithFrame:CGRectMake(170, 30, 100, 20)];
        subLabelInfo.text=@"Label";
        subLabelInfo.textColor=[UIColor orangeColor];
        subLabelInfo.font=a;
        subLabelInfo.backgroundColor=[UIColor clearColor];
        [self addSubview:subLabelInfo];

    }
   
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
