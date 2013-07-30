//
//  BIDDragableMarker.h
//  MapIOS
//
//  Created by Nguyen Thanh Son on 7/9/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BIDDraggableMarkerDelegate.h"
#import <GoogleMaps/GoogleMaps.h>
@interface BIDDragableMarker : NSObject
@property (weak, nonatomic, readwrite) GMSMapView *mapView;
@property (weak, nonatomic, readwrite) id<BIDDraggableMarkerDelegate> delegate;

@property (strong, nonatomic, readwrite) GMSMarker *marker;
@property (strong, nonatomic, readwrite) UIImageView *markerImageView;
@property (strong, nonatomic, readwrite) UILongPressGestureRecognizer *longPressGestureRecognizer;
@property (strong, nonatomic, readwrite) NSMutableSet *markers;

@property (assign, nonatomic, readwrite) BOOL didDragMarker;
@property (assign, nonatomic, readwrite) BOOL didTapMarker;
@property (assign, nonatomic, readwrite) CGRect markerHitRect;
@property (assign, nonatomic, readwrite) CLLocationCoordinate2D initialMarkerPosition;

- (id)initWithMapView:(GMSMapView *)mapView delegate:(id<BIDDraggableMarkerDelegate>)delegate;
- (void)addDraggableMarker:(GMSMarker *)marker;
- (void)removeDraggableMarker:(GMSMarker *)marker;
- (void)removeAllDraggableMarkers;
- (NSArray *)draggableMarkers;
@end
