//
//  BIDViewController.h
//  Exersice9
//
//  Created by Nguyen Thanh Son on 5/22/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface BIDViewController : UIViewController
<MKMapViewDelegate>
@property (strong, nonatomic) IBOutlet UIToolbar *toolBar;
@property (strong,nonatomic) MKPolyline *lineRoute;
@property (strong,nonatomic) MKPolylineView *lineRouteView;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong,nonatomic) UIImageView *imageDetail;
@property (strong, nonatomic) MKAnnotationView *pin;
-(IBAction)zoomIn:(id)sender;
-(IBAction)ZoomOut:(id)sender;
-(IBAction)typeMap:(id)sender;
-(IBAction)showDetail:(id)sender;
@end
