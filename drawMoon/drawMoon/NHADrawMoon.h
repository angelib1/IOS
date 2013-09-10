//
//  NHADrawMoon.h
//  drawMoon
//
//  Created by Nguyễn Hữu Anh on 8/28/13.
//  Copyright (c) 2013 anhnh. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface NHADrawMoon : UIView
//- (void)drawRect:(CGRect)rect withRadius: (float)r andOption: (float)f;
@property (nonatomic) float r;
@property (nonatomic) float option;
@property (nonatomic) float phase;
- (id)initWithFrame:(CGRect)frame andRadius: (float)r option: (float)option andPhase: (float)phase;
@end
