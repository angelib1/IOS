//
//  AssetTablePicker.h
//
//  Created by ELC on 2/15/11.
//  Copyright 2011 ELC Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "ELCAsset.h"
#import "ELCAssetSelectionDelegate.h"
#import "ELCAssetCell.h"
@protocol ActionDelegate<NSObject>
-(void)actionNumber:(NSInteger)number;
@end

@interface ELCAssetTablePicker : UITableViewController <CellDelegate, ELCAssetDelegate,UIAlertViewDelegate>
{
    id<ActionDelegate> actionDelegate;
}

@property (nonatomic, weak) id <ELCAssetSelectionDelegate> parent;
@property (nonatomic, strong) ALAssetsGroup *assetGroup;
@property (nonatomic, strong) NSMutableArray *elcAssets;
@property (nonatomic, strong) IBOutlet UILabel *selectedAssetsLabel;
@property (nonatomic, assign) BOOL singleSelection;
@property (nonatomic, assign) BOOL immediateReturn;
@property (nonatomic, strong) UIAlertView *alertView;
@property (nonatomic, strong) id<ActionDelegate> actionDelegate;

- (int)totalSelectedAssets;
- (void)preparePhotos;

- (void)doneAction:(id)sender;

- (void)assetSelected:(ELCAsset *)asset;
-(void)alert;

@end