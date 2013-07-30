//
//  BIDDraggableMarkerDelegate.h
//  MapIOS
//
//  Created by Nguyen Thanh Son on 7/9/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GoogleMaps/GoogleMaps.h>

@protocol BIDDraggableMarkerDelegate <NSObject>
@optional
- (void)mapView:(GMSMapView *)mapView didBeginDraggingMarker:(GMSMarker *)marker;
- (void)mapView:(GMSMapView *)mapView didEndDraggingMarker:(GMSMarker *)marker;
- (void)mapView:(GMSMapView *)mapView didDragMarker:(GMSMarker *)marker;
- (void)mapView:(GMSMapView *)mapView didLongPressAtCoordinate:(CLLocationCoordinate2D)coordinate;

@end
