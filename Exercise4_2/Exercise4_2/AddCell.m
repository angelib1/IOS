//
//  AddCell.m
//  Exercise4_2
//
//  Created by Nguyen Thanh Son on 5/8/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import "AddCell.h"

@implementation AddCell
@synthesize lblLabel;
@synthesize lblValue;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)setLblLabel1:(NSString *)lblLabel1{
    if(![lblLabel1 isEqualToString:_lblLabel1]){
        _lblLabel1=[lblLabel1 copy];
        lblLabel.text=_lblLabel1;
    }

}
-(void)setLblValue1:(NSString *)lblValue1{
    if(![lblValue1 isEqualToString:_lblValue1]){
        _lblValue1=[lblValue1 copy];
        lblValue.text=_lblValue1;
    }

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
