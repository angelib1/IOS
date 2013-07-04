//
//  ELCImagePickerDemoViewController.h
//  ELCImagePickerDemo
//
//  Created by ELC on 9/9/10.
//  Copyright 2010 ELC Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "ELCImagePickerController.h"
#import "ELCAssetCell.h"
#import "ELCAsset.h"
#import "ELCAssetTablePicker.h"

@interface ELCImagePickerDemoViewController : UIViewController <ELCImagePickerControllerDelegate,UISearchBarDelegate,UISearchDisplayDelegate, UINavigationControllerDelegate, MKMapViewDelegate,MKMapViewDelegate, UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIButton *btnNormal;
@property (weak, nonatomic) IBOutlet UIButton *btnLimit;
@property (nonatomic, strong) IBOutlet UIView *viewImage;
@property (nonatomic, strong) IBOutlet UIButton *btnOK;
@property (nonatomic, strong) IBOutlet UITextView *lblGPS;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, copy) UIImage *img;
@property (nonatomic, strong) UINavigationBar *naviBar;
@property (nonatomic, strong) UINavigationItem *naviBarItem;
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) MKLocalSearch *localSearch;
@property (nonatomic, strong) UISearchDisplayController *searchDisplayController;
@property (nonatomic, copy) NSMutableArray * history;
@property (nonatomic, copy) NSMutableArray * locationMark;
@property (nonatomic, copy) CLPlacemark *mark;

// the default picker controller
- (IBAction)launchController;

// a special picker controller that limits itself to a single album, and lets the user
// pick just one image from that album.
- (IBAction)launchSpecialController;
-(IBAction)btnOK:(id)sender;
-(IBAction)btnDone:(id)sender;

@end

