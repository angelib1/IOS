//
//  BIDAddCell.m
//  Exercise11_1
//
//  Created by Nguyen Thanh Son on 8/5/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import "BIDAddCell.h"

@implementation BIDAddCell
@synthesize Label;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        UIFont *font=[UIFont fontWithName:@"Helvetica" size:17];
        Label=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 300, 30)];
        float a=51.f/255;
        float b=153.f/255;
        float c=255.f/255;
        Label.backgroundColor=[UIColor colorWithRed:a green:b blue:c alpha:0.8];
        Label.text=@"Label";
        Label.font=font;
        Label.textColor=[UIColor whiteColor];
        [self addSubview:Label];
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
@end
