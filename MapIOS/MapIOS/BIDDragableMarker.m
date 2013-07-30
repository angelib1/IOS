//
//  BIDDragableMarker.m
//  MapIOS
//
//  Created by Nguyen Thanh Son on 7/9/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import "BIDDragableMarker.h"
#import <GoogleMaps/GoogleMaps.h>
#import "BIDDraggableMarkerDelegate.h"
#define MARKER_TOUCH_DISTANCE 60.0f
#define MARKER_DROP_JUMP_DISTANCE 25.0f
@implementation BIDDragableMarker
-(id)initWithMapView:(GMSMapView *)mapView delegate:(id<BIDDraggableMarkerDelegate>)delegate{
    self = [super init];
    if (self!=nil)
    {
        //khoi tao mapView va delegate
        self.delegate = delegate;
        self.mapView = mapView;
        
        // khoi tao marker
        self.markers = [[NSMutableSet alloc] init];
        
        // khoi tao marker UIImageView.
        self.markerImageView = [[UIImageView alloc] init];
        [self.mapView addSubview:self.markerImageView];
        
        // Remove GMSBlockingGestureRecognizer
        [self removeGMSBlockingGestureRecognizer];
        
        // custom long press GestureRecognizer de thiet lap Drag
        self.longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPressGesture:)];
        self.longPressGestureRecognizer.minimumPressDuration = 0.4f;
        [self.mapView addGestureRecognizer:self.longPressGestureRecognizer];
    }
    return self;

}

- (void)addDraggableMarker:(GMSMarker *)marker
{
    [self.markers addObject:marker];
}

- (void)removeDraggableMarker:(GMSMarker *)marker
{
    [self.markers removeObject:marker];
}

- (void)removeAllDraggableMarkers
{
    [self.markers removeAllObjects];
}

- (NSArray *) draggableMarkers
{
    return [self.markers allObjects];
}

- (void)handleLongPressGesture:(UILongPressGestureRecognizer*)recognizer{
    CGPoint touchPoint = [recognizer locationInView:self.mapView];
    if (recognizer.state==UIGestureRecognizerStateBegan)
    {
        if ([self.delegate respondsToSelector:@selector(mapView:didLongPressAtCoordinate:)])
        {
            [self.delegate mapView:self.mapView didLongPressAtCoordinate:[self.mapView.projection coordinateForPoint:touchPoint]];
        }
        
        // Xac dinh closest marker.
        self.marker = [self determineClosestMarkerForTouchPoint:touchPoint];
        
        // Load UIImageView cho marker.
        [self loadImageViewForMarker:self.marker];
        self.markerHitRect = self.markerImageView.frame;
    }
    
    // Cac trang thai cua drag marker
    if (self.marker!=nil)
    {
        CGPoint markerPoint = [self.mapView.projection pointForCoordinate:self.marker.position];
        if (recognizer.state==UIGestureRecognizerStateBegan)
        {
            // kiem tra co cham vao closset khong
            if (CGRectContainsPoint(self.markerHitRect, touchPoint))
            {
                [self.markerImageView.layer setOpacity:1.0f];
                if (self.mapView.selectedMarker != self.marker)
                {
                    self.mapView.selectedMarker = nil;
                }
                // Disable gestures
                [self enableGoogleMapViewSettings:NO];
                // Save marker tapped.
                self.didTapMarker = YES;
                // Save khoi tao marker position.
                self.initialMarkerPosition = self.marker.position;
                // Remove marker 
                self.marker.map = nil;
                
                // Animate the marker.
                CGRect newFrame = self.markerImageView.frame;
                newFrame.origin.y -= (markerPoint.y - touchPoint.y);
                [UIView animateWithDuration:0.2
                                 animations:^(void)
                 {
                     self.markerImageView.frame = newFrame;
                 }
                                 completion:^(BOOL finished)
                 {
                     if ([self.delegate respondsToSelector:@selector(mapView:didBeginDraggingMarker:)])
                     {
                         [self.delegate mapView:self.mapView didBeginDraggingMarker:self.marker];
                     }
                 }];
                
            }
            else
            {
                [self resetDraggableMarkerManager];
            }
        }
        else if (UIGestureRecognizerStateChanged == recognizer.state)
        {
            CLLocationCoordinate2D markerPosition;
            __block CGRect newFrame = self.markerImageView.frame;
            // kiem tra marker co long pressed truoc do khong
            if (self.didTapMarker)
            {
                //drag marker
                if (!CGRectContainsPoint(self.markerHitRect, touchPoint) &&
                    NO == self.didDragMarker)
                {
                    // marker dragged.
                    self.didDragMarker = YES;
                }
                CGSize imageSize = self.markerImageView.image.size;
                self.markerImageView.frame = CGRectMake(touchPoint.x - (self.marker.groundAnchor.x * imageSize.width),touchPoint.y - (self.marker.groundAnchor.y * imageSize.height),imageSize.width,imageSize.height);
                if (self.didDragMarker==YES)
                {
                    // delegate drag event.
                    if ([self.delegate respondsToSelector:@selector(mapView:didDragMarker:)])
                    {
                        [self.delegate mapView:self.mapView didDragMarker:self.marker];
                    }
                }
                CGPoint newMarkerOrigin = CGPointMake(newFrame.origin.x + (self.marker.groundAnchor.x * imageSize.width),newFrame.origin.y + (self.marker.groundAnchor.y * imageSize.height));
                markerPosition = [self.mapView.projection coordinateForPoint:newMarkerOrigin];

                self.marker.position=markerPosition;
            }
        }
        else if (recognizer.state==UIGestureRecognizerStateEnded )
        {
            __block CGRect newFrame = self.markerImageView.frame;
            
            // luu vi tri moi cua marker duoc drag
            CLLocationCoordinate2D markerPosition;
            if (!self.didDragMarker)
            {
                // Restore vi tri marker khong drag
                markerPosition = self.initialMarkerPosition;
            }
            else
            {
                // xac dinh vi tri moi cua marker
                CGSize imageSize = self.markerImageView.image.size;
                CGPoint newMarkerOrigin = CGPointMake(newFrame.origin.x + (self.marker.groundAnchor.x * imageSize.width),newFrame.origin.y + (self.marker.groundAnchor.y * imageSize.height));
                markerPosition = [self.mapView.projection coordinateForPoint:newMarkerOrigin];
            }
            
            // Animate the marker to jump up.
             newFrame.origin.y -= MARKER_DROP_JUMP_DISTANCE;
            [UIView animateWithDuration:0.10
                                  delay:0
                                options:UIViewAnimationOptionCurveEaseIn
                             animations:^(void)
             {
                 self.markerImageView.frame = newFrame;
             }
                             completion:^(BOOL finished)
             {
                 // Animate the marker to land again.
                 [UIView animateWithDuration:0.10
                                       delay:0
                                     options:UIViewAnimationOptionCurveEaseIn
                                  animations:^(void)
                  {
                      self.markerImageView.frame = newFrame;
                  }
                                  completion:^(BOOL finished)
                  {
                      if (NO == self.didDragMarker)
                      {
                          [UIView animateWithDuration:0.05
                                                delay:0
                                              options:UIViewAnimationOptionCurveLinear
                                           animations:^(void)
                           {
                               newFrame = self.markerHitRect;
                               self.markerImageView.frame = newFrame;
                           }
                                           completion:^(BOOL finished)
                           {
                               self.marker.position = markerPosition;
                               self.marker.map = self.mapView;                              [UIView animateWithDuration:0.10
                                                     delay:0
                                                   options:UIViewAnimationOptionCurveLinear                                                                                animations:^(void)
                                {
                                    [self.markerImageView.layer setOpacity:0.0f];
                                    
                                }
                                                completion:^(BOOL finished)
                                {
                                    if ([self.delegate respondsToSelector:@selector(mapView:didEndDraggingMarker:)])
                                    {
                                        [self.delegate mapView:self.mapView didEndDraggingMarker:self.marker];
                                    }
                                    // Reset draggable marker
                                    [self resetDraggableMarkerManager];
                                }];
                           }];
                      }
                      else
                      {
                         //update vi tri cua marker
                          self.marker.position = markerPosition;
                          self.marker.map = self.mapView;
                          [UIView animateWithDuration:0.10
                                                delay:0
                                              options:UIViewAnimationOptionCurveEaseIn
                                           animations:^(void){
                                               [self.markerImageView.layer setOpacity:0.0f];
                                               
                                           }
                                           completion:^(BOOL finished)
                           {
                               if ([self.delegate respondsToSelector:@selector(mapView:didEndDraggingMarker:)])
                               {
                                   [self.delegate mapView:self.mapView didEndDraggingMarker:self.marker];
                               }
                               [self resetDraggableMarkerManager];
                           }];
                          
                      }
                  }];
             }];
        }
        else
        {
            // Reset the draggable marker manager.
            [self resetDraggableMarkerManager];
        }
    }
    else
    {
        // Reset the draggable marker manager.
        [self resetDraggableMarkerManager];
    }
}
// Xac dinh closest marker.
- (GMSMarker *)determineClosestMarkerForTouchPoint:(CGPoint)touchPoint
{
    // khoi tao gia tri
    GMSMarker *resultMarker = nil;
    
    // Initialize the initial distance as the maximum of CGFloat.
    CGFloat smallestDistance = CGFLOAT_MAX;
    CGFloat distance = CGFLOAT_MAX;
    
    // Determine the closest draggable marker to the current touch point
    for (GMSMarker *marker in self.markers)
    {
        CGPoint markerPoint = [self.mapView.projection pointForCoordinate:marker.position];
        CGFloat xDistance = (touchPoint.x - markerPoint.x);
        CGFloat yDistance = (touchPoint.y - markerPoint.y);
        distance = sqrt((xDistance * xDistance) + (yDistance * yDistance));
        
        // Check if a closer marker was found.
        if (distance <= smallestDistance)
        {
            resultMarker = marker;
            smallestDistance = distance;
        }
    }
    return resultMarker;
}

// Reset draggable marker
- (void)resetDraggableMarkerManager
{
   
    self.didTapMarker = NO;
    self.didDragMarker = NO;
    [self enableGoogleMapViewSettings:YES];
    //marker khong duoc select
    self.marker = nil;
    
    // Remove GMSBlockingGestureRecognizer.
    [self removeGMSBlockingGestureRecognizer];
}

// Remove GMSBlockingGestureRecognizer cua GMSMapView.
- (void)removeGMSBlockingGestureRecognizer
{
    for (id gestureRecognizer in self.mapView.gestureRecognizers)
    {
        if (![gestureRecognizer isKindOfClass:[UILongPressGestureRecognizer class]])
        {
            [self.mapView removeGestureRecognizer:gestureRecognizer];
        }
    }
}
// Enables va disables tat ca cac cai dat cua GMSMapview
- (void)enableGoogleMapViewSettings:(BOOL)enable {
    
    if (enable)
    {
        self.mapView.settings.scrollGestures = YES;
        self.mapView.settings.zoomGestures = YES;
        self.mapView.settings.tiltGestures = YES;
        self.mapView.settings.rotateGestures = YES;
    }
    else
    {
        self.mapView.settings.scrollGestures = NO;
        self.mapView.settings.zoomGestures = NO;
        self.mapView.settings.tiltGestures = NO;
        self.mapView.settings.rotateGestures = NO;
    }
}
// Khoi tao UIImageView cho Marker de tao animation
- (void)loadImageViewForMarker:(GMSMarker *)marker
{
    if (nil != marker)
    {
        // Get the current marker image or use the default marker image supplied in the Google Maps bundle.
        UIImage *currentMarkerImage;
        if (nil != self.marker.icon)
        {
            currentMarkerImage = self.marker.icon;
        }
        else
        {
            currentMarkerImage = [UIImage imageNamed:@"GoogleMaps.bundle/default_marker"];
        }
        
        // Receive the point in the view for the marker.
        CGPoint markerPoint = [self.mapView.projection pointForCoordinate:marker.position];
        
        [self.markerImageView setImage:currentMarkerImage];
        [self.markerImageView setFrame: CGRectMake(markerPoint.x - (self.marker.groundAnchor.x * currentMarkerImage.size.width),
                                                   markerPoint.y - (self.marker.groundAnchor.y * currentMarkerImage.size.height),
                                                   currentMarkerImage.size.width,
                                                   currentMarkerImage.size.height)];
        
    }
}

@end
