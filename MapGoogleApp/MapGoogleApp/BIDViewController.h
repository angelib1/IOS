//
//  BIDViewController.h
//  MapGoogleApp
//
//  Created by Nguyen Thanh Son on 7/4/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>
@interface BIDViewController : UIViewController<GMSMapViewDelegate,UISearchBarDelegate,UISearchDisplayDelegate,
UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
@property (nonatomic,strong) GMSMapView *mapView;
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UISearchDisplayController *searchDisplay;
-(IBAction)zoomIn:(id)sender;
-(IBAction)zoomOut:(id)sender;
@end
