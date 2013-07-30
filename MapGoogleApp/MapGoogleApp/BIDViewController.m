//
//  BIDViewController.m
//  MapGoogleApp
//
//  Created by Nguyen Thanh Son on 7/4/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import "BIDViewController.h"
#import <GoogleMaps/GoogleMaps.h>
@interface BIDViewController ()

@end

@implementation BIDViewController
@synthesize  mapView,toolbar;
@synthesize searchBar,searchDisplay;
- (void)viewDidLoad
{
    [super viewDidLoad];
    mapView.delegate=self;
	// Do any additional setup after loading the view, typically from a nib.
    //toolbar
    UIBarButtonItem *zoomInButton=[[UIBarButtonItem alloc]initWithTitle:@"Zoom In" style:UIBarButtonItemStyleBordered target:self action:@selector(zoomIn:)];
    UIBarButtonItem *zoomOutButton=[[UIBarButtonItem alloc]initWithTitle:@"Zoom Out" style:UIBarButtonItemStyleBordered target:self action:@selector(zoomOut:)];
    NSArray *button=[[NSArray alloc]initWithObjects:zoomInButton,zoomOutButton, nil];
    toolbar.items=button;
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:21.025747
                                                            longitude:105.851555
                                                                 zoom:15];
    mapView=[[GMSMapView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [mapView setCamera:camera];
    [self.view addSubview:mapView];
    [self.view addSubview:toolbar];
    
    // Tao cac Marker tren MapView
    GMSMarker *marker1 = [[GMSMarker alloc] init];
    marker1.position = CLLocationCoordinate2DMake(21.025747,105.851555);
    marker1.title = @"Thanh pho Ha noi, Viet Nam";
    marker1.map=mapView;
    
    GMSMarker *marker2 = [[GMSMarker alloc] init];
    marker2.position = CLLocationCoordinate2DMake(21.026227,105.84559);
    marker2.title = @"Ba Trieu, Ha noi, Viet Nam";
    marker2.map=mapView;
    
    //Ve polyline noi 2 Marker
    GMSMutablePath *path=[GMSMutablePath path];
    [path addCoordinate:marker1.position];
    [path addCoordinate:marker2.position];
    GMSPolyline *polyLine=[GMSPolyline polylineWithPath:path];
    polyLine.strokeColor=[UIColor blueColor];
    polyLine.strokeWidth=5;
    polyLine.map=mapView;
    
    //SearchBar va SearchDisplayController
    searchBar=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    searchDisplay=[[UISearchDisplayController alloc]initWithSearchBar:searchBar contentsController:self];
    [searchDisplay setDelegate:self];
    searchDisplay.searchResultsDataSource=self;
    searchDisplay.searchResultsDelegate=self;
    searchBar.delegate=self;
    [self.view addSubview:searchBar];
    
    

}
-(IBAction)zoomIn:(id)sender{
    GMSCameraUpdate *zoomCamera = [GMSCameraUpdate zoomIn];
    [mapView animateWithCameraUpdate:zoomCamera];
}
-(IBAction)zoomOut:(id)sender{
    GMSCameraUpdate *zoomCamera = [GMSCameraUpdate zoomOut];
    [mapView animateWithCameraUpdate:zoomCamera];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
