//
//  BIDAddCell.m
//  Exersice11
//
//  Created by Nguyen Thanh Son on 7/31/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import "BIDAddCell.h"

@implementation BIDAddCell
@synthesize image,label,subLabel;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIFont *a=[UIFont fontWithName:@"Helvetica" size:17];
        image=[[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 50, 50)];
        label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 180, 30)];
        subLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 30, 180, 25)];
        [label setFont:a];
        label.backgroundColor=[UIColor orangeColor];
        label.alpha=0.8;
        subLabel.backgroundColor=[UIColor clearColor];
        
        [self addSubview:label];
        [self addSubview:subLabel];
        [self addSubview:image];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
