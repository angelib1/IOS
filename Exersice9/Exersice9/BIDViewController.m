//
//  BIDViewController.m
//  Exersice9
//
//  Created by Nguyen Thanh Son on 5/22/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import "BIDViewController.h"
#import <MapKit/MapKit.h>
#import <QuartzCore/QuartzCore.h>
@interface BIDViewController ()

@end
 static NSString *pinId=@"annotation";
@implementation BIDViewController
@synthesize mapView;
@synthesize toolBar;
@synthesize lineRoute;
@synthesize lineRouteView;
@synthesize imageDetail;

CLLocationCoordinate2D location[2];
MKPointAnnotation *annotation;
MKPointAnnotation *annotation1;
- (void)viewDidLoad
{
    [super viewDidLoad];
    mapView.delegate=self;
    //mapView.showsUserLocation=YES;
    //tao toolbar
    //button zoom
    UIBarButtonItem *zoomInButton=[[UIBarButtonItem alloc]initWithTitle:@"Zoom In" style:UIBarButtonItemStyleBordered target:self action:@selector(zoomIn:)];
     UIBarButtonItem *zoomOutButton=[[UIBarButtonItem alloc]initWithTitle:@"Zoom Out" style:UIBarButtonItemStyleBordered target:self action:@selector(ZoomOut:)];
    //Button TypeMap
    UIBarButtonItem *typebutton=[[UIBarButtonItem alloc]initWithTitle:@"MapType" style:UIBarButtonItemStyleBordered target:self action:@selector(typeMap:)];
    NSArray *button=[[NSArray alloc]initWithObjects:zoomInButton,zoomOutButton,typebutton, nil];
    toolBar.items=button;
    imageDetail=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_you@2x.png"]];
    //vi tri 1
    location[0].latitude=(double)21.030353;
    location[0].longitude=(double)105.841427;
    annotation=[[MKPointAnnotation alloc]init];
    annotation.coordinate=location[0];
    
    //annotation.title=@" ";
   
    
   
    //vi tri 2
    location[1].latitude=(double)21.033397;
    location[1].longitude=(double)105.838852;
    annotation1=[[MKPointAnnotation alloc]init];
    annotation1.coordinate=location[1];
   // annotation1.title=@" ";
   
   
    
    lineRoute=[MKPolyline polylineWithCoordinates:location count:2];
    MKCoordinateRegion region=MKCoordinateRegionMakeWithDistance(location[0], 500, 500);
    [mapView setRegion:region animated:YES];
    [mapView addAnnotation:annotation];
    [mapView addAnnotation:annotation1];
    [mapView addOverlay:lineRoute];
    
	// Do any additional setup after loading the view, typically from a nib.
}
//cap nhat vi tri khi pin thay doi
-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)annotationView didChangeDragState:(MKAnnotationViewDragState)newState fromOldState:(MKAnnotationViewDragState)oldState{
    if(annotationView.annotation==annotation){
        if(newState==MKAnnotationViewDragStateEnding){
            location[0]=annotationView.annotation.coordinate;
        }
    }
    if(annotationView.annotation==annotation1){
        if(newState==MKAnnotationViewDragStateEnding){
            location[1]=annotationView.annotation.coordinate;
        }
    }
    NSArray *arr=[self.mapView overlays];
    [self.mapView removeOverlays:arr];
    
    lineRoute=[MKPolyline polylineWithCoordinates:location count:2];
    [self.mapView addOverlay:lineRoute];
}


//overlay
-(MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id<MKOverlay>)overlay{
    MKOverlayView *overlayView=nil;
    lineRouteView=[[MKPolylineView alloc]initWithPolyline:lineRoute];
    [lineRouteView setFillColor:[UIColor redColor]];
    [lineRouteView setStrokeColor:[UIColor blueColor]];
    [lineRouteView setLineWidth:2];
    overlayView=lineRouteView;
    return overlayView;
    
}
//set draggable=YES;

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    MKAnnotationView *pin;

    if(pin==nil){
        pin=[[MKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:pinId];
    }
    else{
        pin.annotation=annotation;
    }
    
    pin.image=[UIImage imageNamed:@"CameraFloating@2x.png"];
    pin.canShowCallout=NO;
    pin.leftCalloutAccessoryView=imageDetail;
    pin.draggable=YES;
    NSLog(@"%f,%f",pin.bounds.size.width,pin.bounds.size.height);
    return pin;
}
-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)annotationView{
    //[annotationView setCenterOffset:CGPointMake(annotationView.bounds.size.width/2, 0)];
    imageDetail.frame=CGRectMake(annotationView.frame.size.width/2, 0, 0, 0);
    [UIView beginAnimations:@"anim" context:nil];
    [UIView setAnimationDuration:0.5f];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    imageDetail.frame=CGRectMake(0, -50,50,50);
    [UIView commitAnimations];
    [annotationView addSubview:imageDetail];
   
    
    
}
-(void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)annotationView{
    imageDetail.frame=CGRectMake(0, -50,50,50);
    [annotationView addSubview:imageDetail];
    [UIView beginAnimations:@"ani" context:nil];
    [UIView setAnimationDuration:0.5f];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    imageDetail.frame=CGRectMake(annotationView.frame.size.width/2, 0, 0, 0);
    [UIView commitAnimations];

}
-(IBAction)showDetail:(id)sender{
   
}
-(IBAction)zoomIn:(id)sender{
    MKCoordinateRegion region;
    //Set Zoom level using Span
    MKCoordinateSpan span;
    region.center=mapView.region.center;
    
    span.latitudeDelta=mapView.region.span.latitudeDelta /2.0002;
    span.longitudeDelta=mapView.region.span.longitudeDelta /2.0002;
    region.span=span;
    [mapView setRegion:region animated:TRUE];

}
-(IBAction)ZoomOut:(id)sender{
    MKCoordinateRegion region;
    //Set Zoom level using Span
    MKCoordinateSpan span;
    region.center=mapView.region.center;
    span.latitudeDelta=mapView.region.span.latitudeDelta *2;
    span.longitudeDelta=mapView.region.span.longitudeDelta *2;
    region.span=span;
    [mapView setRegion:region animated:TRUE];
}
-(IBAction)typeMap:(id)sender{
    if (mapView.mapType == MKMapTypeStandard)
        mapView.mapType = MKMapTypeSatellite;
    else
        mapView.mapType = MKMapTypeStandard;

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
