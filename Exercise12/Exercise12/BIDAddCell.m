//
//  BIDAddCell.m
//  Exercise12
//
//  Created by Nguyen Thanh Son on 9/10/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import "BIDAddCell.h"

@implementation BIDAddCell
@synthesize lblLabel1,lblLabel2,lblLabel3;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        UIFont *font=[UIFont fontWithName:@"HelveticaNeue-Light" size:14];
        
        lblLabel1=[[UILabel alloc]initWithFrame:CGRectMake(5, 3, 80, 20)];
        lblLabel1.backgroundColor=[UIColor clearColor];
        lblLabel1.font=font;
        lblLabel1.textColor=[UIColor blueColor];
        
        lblLabel2=[[UILabel alloc]initWithFrame:CGRectMake(85, 3, 80, 20)];
        lblLabel2.backgroundColor=[UIColor clearColor];
        lblLabel2.font=font;
        
        lblLabel3=[[UILabel alloc]initWithFrame:CGRectMake(170, 3, 80, 20)];
        lblLabel3.backgroundColor=[UIColor clearColor];
        lblLabel3.font=font;
        
        [self addSubview:lblLabel1];
        [self addSubview:lblLabel2];
        [self addSubview:lblLabel3];
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
