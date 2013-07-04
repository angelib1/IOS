//
//  AssetCell.m
//
//  Created by ELC on 2/15/11.
//  Copyright 2011 ELC Technologies. All rights reserved.
// Thiet lap tung cell trong tableview trong man hinh chon anh thuoc album

#import "ELCAssetCell.h"
#import "ELCAsset.h"
#import <CoreLocation/CoreLocation.h>
#import <ImageIO/ImageIO.h>
#import "ELCImagePickerDemoViewController.h"
#import "ELCAssetTablePicker.h"

ELCAssetTablePicker *picker;
double latitude,longitude;
CLLocationCoordinate2D location;
@interface ELCAssetCell ()

@property (nonatomic, strong) NSArray *rowAssets;
@property (nonatomic, strong) NSMutableArray *imageViewArray;
@property (nonatomic, strong) NSMutableArray *overlayViewArray;
@end

@implementation ELCAssetCell

@synthesize rowAssets = _rowAssets;
@synthesize celldelegate;
@synthesize GPS;

- (id)initWithAssets:(NSArray *)assets reuseIdentifier:(NSString *)identifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
	if(self) {
        UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cellTapped:)];
        [self addGestureRecognizer:tapRecognizer];
        
        NSMutableArray *mutableArray = [[NSMutableArray alloc] initWithCapacity:4];
        self.imageViewArray = mutableArray;
        
        NSMutableArray *overlayArray = [[NSMutableArray alloc] initWithCapacity:4];
        self.overlayViewArray = overlayArray;
        picker=[[ELCAssetTablePicker alloc]init];
        [self setAssets:assets];
        
}
	return self;
}

//anh Overlay
- (void)setAssets:(NSArray *)assets
{
   
    self.rowAssets = assets;
	for (UIView *view in [self subviews]) {
		[view removeFromSuperview];
	}
    //set up a pointer here so we don't keep calling [UIImage imageNamed:] if creating overlays
    UIImage *overlayImage = nil;
    for (int i = 0; i < [_rowAssets count]; ++i) {

        ELCAsset *asset = [_rowAssets objectAtIndex:i];

        if (i < [_imageViewArray count]) {
            UIImageView *imageView = [_imageViewArray objectAtIndex:i];
            imageView.image = [UIImage imageWithCGImage:asset.asset.thumbnail];
        } else {
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageWithCGImage:asset.asset.thumbnail]];
            [_imageViewArray addObject:imageView];
        }
        
        if (i < [_overlayViewArray count]) {
            UIImageView *overlayView = [_overlayViewArray objectAtIndex:i];
            overlayView.hidden = asset.selected ? NO : YES;
        } else {
            if (overlayImage == nil) {
                overlayImage = [UIImage imageNamed:@"Overlay.png"];
            }
            UIImageView *overlayView = [[UIImageView alloc] initWithImage:overlayImage];
            [_overlayViewArray addObject:overlayView];
            overlayView.hidden = asset.selected ? NO : YES;
        }
        if([self loadEXIFInfoFromAsset:asset.asset]==0){
            asset.selected = NO;
            GPS=NO;
            
        }
        else  {
            asset.selected = YES;
            GPS=YES;
        }
    }
}
- (int)loadEXIFInfoFromAsset:(ALAsset *)asset
{
    NSMutableDictionary * exifInfo = [NSMutableDictionary dictionaryWithDictionary:asset.defaultRepresentation.metadata];
    NSMutableDictionary *GPSInfo=[NSMutableDictionary dictionaryWithDictionary:[exifInfo objectForKey:(NSString *)kCGImagePropertyGPSDictionary]];
    //khong co location
    if(GPSInfo.count==0){
        return 0;
    }
	//co location
    latitude=[[GPSInfo valueForKey:@"Latitude"]doubleValue];
    longitude=[[GPSInfo valueForKey:@"Longitude"]doubleValue];
    location.latitude=latitude;
    location.longitude=longitude;
    return 1;
}


- (void)cellTapped:(UITapGestureRecognizer *)tapRecognizer
{

    CGPoint point = [tapRecognizer locationInView:self];
    CGFloat startX = 0;
    
	CGRect frame = CGRectMake(startX, 2, 75, 75);
	for (int i = 0; i < [_rowAssets count]; ++i) {
        if (CGRectContainsPoint(frame, point)) {
            ELCAsset *asset = [_rowAssets objectAtIndex:i];
            ALAssetRepresentation *assetRep = [asset.asset defaultRepresentation];
            
            CGImageRef imgRef = [assetRep fullScreenImage];
            UIImage *img = [UIImage imageWithCGImage:imgRef
                                               scale:[UIScreen mainScreen].scale
                                         orientation:UIImageOrientationUp];
            if(GPS){
                [celldelegate cellDelegate:0 :img :location];
            }
            else if(!asset.selected){
                [celldelegate cellDelegate:1 :img :location];
                break;
            }
        }        
        frame.origin.x = frame.origin.x + frame.size.width + 4;
    }
     
}
- (void)layoutSubviews
{
    CGFloat startX = 0;
	CGRect frame = CGRectMake(startX, 2, 75, 75);
	for (int i = 0; i < [_rowAssets count]; ++i) {
        UIImageView *imageView = [_imageViewArray objectAtIndex:i];
		[imageView setFrame:frame];
		[self addSubview:imageView];
        
        UIImageView *overlayView = [_overlayViewArray objectAtIndex:i];
        [overlayView setFrame:frame];
        [self addSubview:overlayView];
		
		frame.origin.x = frame.origin.x + frame.size.width + 4;
    }
}


@end
