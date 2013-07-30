//
//  BIDViewController.h
//  MapIOS
//
//  Created by Nguyen Thanh Son on 7/9/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>
#import "BIDDragableMarker.h"
@interface BIDViewController : UIViewController<BIDDraggableMarkerDelegate,GMSMapViewDelegate,UISearchBarDelegate,UISearchDisplayDelegate,UITableViewDelegate,UITableViewDataSource,NSURLConnectionDataDelegate,NSURLConnectionDelegate>
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
@property (nonatomic,strong) IBOutlet GMSMapView *mapView;
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UISearchDisplayController *searchDisplay;
@property (nonatomic, strong) BIDDragableMarker *draggableMarker;
@property (nonatomic, strong) GMSMarker *marker1;
@property (nonatomic, strong) GMSMarker *marker2;
@property (nonatomic, strong) GMSPolyline *polyLine;
@property (nonatomic, strong) GMSMutablePath *path;
@property (nonatomic, strong) NSMutableArray *locationArray;
@property (nonatomic, strong) NSURLConnection *connection;
@property (nonatomic, strong) NSMutableData *dataRespond;
@property (nonatomic, strong) UIBarButtonItem *mapTypeButton;
@property (nonatomic, strong) UIBarButtonItem *streetViewButton;
@property (nonatomic, strong) NSDictionary *locationDic;
@property (nonatomic, strong) GMSPanoramaView *streetView;
@property (nonatomic, strong) NSMutableArray *addressSame;
//@property (nonatomic, copy) NSString *dataBaseName;
//@property (nonatomic, copy) NSString *dataBasePath;
//@property (nonatomic, strong) NSMutableArray *mapData;
@property (nonatomic, strong) NSArray *dataAddress;

-(IBAction)zoomIn:(id)sender;
-(IBAction)zoomOut:(id)sender;
-(IBAction)rotate:(id)sender;
-(IBAction)mapType:(id)sender;
-(IBAction)StreetView:(id)sender;
@end
