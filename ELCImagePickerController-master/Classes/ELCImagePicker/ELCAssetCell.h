//
//  AssetCell.h
//
//  Created by ELC on 2/15/11.
//  Copyright 2011 ELC Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ELCAsset.h"
@protocol CellDelegate <NSObject>

-(void)cellDelegate:(int)number :(UIImage *)image :(CLLocationCoordinate2D)location;

@end
@interface ELCAssetCell : UITableViewCell<UIAlertViewDelegate>
{
    id<CellDelegate> celldelegate;
}

- (id)initWithAssets:(NSArray *)assets reuseIdentifier:(NSString *)identifier;
- (void)setAssets:(NSArray *)assets;
@property (nonatomic, assign) BOOL GPS;
@property (nonatomic, strong) id<CellDelegate> celldelegate;

@end
