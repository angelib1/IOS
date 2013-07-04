//
//  ELCImagePickerDemoViewController.m
//  ELCImagePickerDemo
//
//  Created by ELC on 9/9/10.
//  Copyright 2010 ELC Technologies. All rights reserved.
//

#import "ELCImagePickerDemoAppDelegate.h"
#import "ELCImagePickerDemoViewController.h"
#import "ELCImagePickerController.h"
#import "ELCAlbumPickerController.h"
#import "ELCAssetTablePicker.h"
#import <MapKit/MapKit.h>
#import "ELCAsset.h"
#import <Foundation/Foundation.h>
@interface ELCImagePickerDemoViewController ()

@property (nonatomic, strong) ALAssetsLibrary *specialLibrary;
@property (nonatomic, strong) NSMutableArray *latArray;
@property (nonatomic, strong) NSMutableArray *longArray;

@end
int k,numberPin;
int actionNumber;
double lat,longi;
NSString *GPSInfo;
NSString *searchString;
CLLocationCoordinate2D location;
MKPointAnnotation *annotation;
MKLocalSearchResponse *result;
NSString *namePlace;
NSString *test;
MKPinAnnotationView *pin;



@implementation ELCImagePickerDemoViewController
@synthesize img,viewImage,imageView,btnOK,lblGPS;
@synthesize mapView=_mapView;
@synthesize latArray,longArray;
@synthesize naviBar, naviBarItem,searchBar,localSearch,searchDisplayController,history,locationMark,mark;

- (IBAction)launchController
{
    actionNumber=0;
    annotation=[[MKPointAnnotation alloc]init];
    [_mapView setDelegate:self];
    [self.searchDisplayController setDelegate:self];
    latArray = [[NSMutableArray alloc] init];
    longArray = [[NSMutableArray alloc] init];
    img=[[UIImage alloc]init];
    ELCAlbumPickerController *albumController = [[ELCAlbumPickerController alloc] initWithNibName: nil bundle: nil];
	ELCImagePickerController *elcPicker = [[ELCImagePickerController alloc] initWithRootViewController:albumController];
    [albumController setParent:elcPicker];
	[elcPicker setDelegate:self];
    ELCImagePickerDemoAppDelegate *app = (ELCImagePickerDemoAppDelegate *)[[UIApplication sharedApplication] delegate];
    if ([app.viewController respondsToSelector:@selector(presentViewController:animated:completion:)]){
        [app.viewController presentViewController:elcPicker animated:YES completion:nil];
    } else {
        [app.viewController presentModalViewController:elcPicker animated:YES];
    }
}



- (void)displayPickerForGroup:(ALAssetsGroup *)group
{
	ELCAssetTablePicker *tablePicker = [[ELCAssetTablePicker alloc] initWithNibName: nil bundle: nil];
    tablePicker.singleSelection = YES;
    tablePicker.immediateReturn = YES;
    
	ELCImagePickerController *elcPicker = [[ELCImagePickerController alloc] initWithRootViewController:tablePicker];
    elcPicker.delegate = self;
	tablePicker.parent = elcPicker;
    
    // Move me
    tablePicker.assetGroup = group;
    [tablePicker.assetGroup setAssetsFilter:[ALAssetsFilter allAssets]];
    
    if ([self respondsToSelector:@selector(presentViewController:animated:completion:)]){
        [self presentViewController:elcPicker animated:YES completion:nil];
    } else {
        [self presentModalViewController:elcPicker animated:YES];
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return YES;
    } else {
        return toInterfaceOrientation != UIInterfaceOrientationPortraitUpsideDown;
    }
}

#pragma mark ELCImagePickerControllerDelegate Methods

- (void)elcImagePickerController:(ELCImagePickerController *)picker didFinishPickingMediaWithInfo:(NSArray *)info
{
    if ([self respondsToSelector:@selector(dismissViewControllerAnimated:completion:)]){
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self dismissModalViewControllerAnimated:YES];
    }
    //array chua cac history
    if(history==nil)
    {
        history=[[NSMutableArray alloc]init];
    }
    locationMark=[[NSMutableArray alloc]init];
    
    //navigationBar trong man hinh choose Image's location
    naviBar=[[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,44)];
    naviBarItem=[[UINavigationItem alloc]init];
    naviBarItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(btnDone:)];
    [naviBar pushNavigationItem:naviBarItem animated:YES];
   
    //Search Box trong MapView
    searchBar=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 260, 44)];
    searchDisplayController=[[UISearchDisplayController alloc]initWithSearchBar:searchBar contentsController:self];
    [searchDisplayController setDelegate:self];
    searchDisplayController.searchResultsDataSource=self;
    searchDisplayController.searchResultsDelegate=self;
    searchBar.delegate=self;
    [naviBar addSubview:searchBar];
    

    //cac UIView trong man hinh hien anh va location
    viewImage=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    lblGPS=[[UITextView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    [lblGPS setText:GPSInfo];
    [lblGPS setBackgroundColor:[UIColor clearColor]];
    btnOK=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnOK.frame=CGRectMake(220, 0, 100, 50);
    [btnOK setTitle:@"OK" forState:UIControlStateNormal];
    [btnOK addTarget:self action:@selector(btnOK:) forControlEvents:UIControlEventTouchUpInside];
    imageView=[[UIImageView alloc]initWithImage:img];
    [imageView setContentMode:UIViewContentModeScaleAspectFill];
    imageView.frame=CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height-50);
    
    //xu li khi Click vao OK trong AlertView
    if(actionNumber==0){
    
    imageView=[[UIImageView alloc]initWithImage:img];
        imageView.frame=CGRectMake(0, 0, 30, 30);
    [_mapView removeAnnotation:annotation];
    location.latitude=(double)21.030353;
    location.longitude=(double)105.841427;
    
    annotation.coordinate=location;
    [self.view addSubview:naviBar];
    [_mapView setHidden:NO];
        [_mapView setFrame:CGRectMake(0, naviBar.frame.size.height, self.view.frame.size.width, self.view.frame.size.height-naviBar.frame.size.height)];
        [self.navigationController pushViewController:self animated:YES];
    MKCoordinateRegion region=MKCoordinateRegionMakeWithDistance(location, 500, 500);
    [_mapView setRegion:region animated:NO];
        [_mapView addAnnotation:annotation];
    }
    
    //Xu ly khi image co location
    else if(actionNumber==2){
        self.btnLimit.hidden=true;
        self.btnNormal.hidden=true;
        [_mapView setHidden:true];
        [naviBar setHidden:true];
        [viewImage addSubview:imageView];
        [viewImage addSubview:lblGPS];
        [viewImage addSubview:btnOK];
        [self.view addSubview:viewImage];
    }
    //Khong xu ly khi an NO trong AlertView
}
//hien thi SearchResultsTableView khi click vao UISearchBar
-(void)searchDisplayController:(UISearchDisplayController *)controller willHideSearchResultsTableView:(UITableView *)tableView{
    [locationMark removeAllObjects];
    [locationMark addObjectsFromArray:[history copy]];
    [searchDisplayController.searchResultsTableView reloadData];
}
-(void)searchDisplayController:(UISearchDisplayController *)controller didHideSearchResultsTableView:(UITableView *)tableView{
    [self.view addSubview:searchDisplayController.searchResultsTableView];
}
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    [searchDisplayController setActive:YES animated:NO];
}
-(void)searchDisplayControllerWillBeginSearch:(UISearchDisplayController *)controller{
    [searchDisplayController.searchResultsTableView reloadData];
    [locationMark removeAllObjects];
    [locationMark addObjectsFromArray:[history copy]];
    
}
-(void)searchDisplayControllerDidBeginSearch:(UISearchDisplayController *)controller{
    [self.view addSubview:searchDisplayController.searchResultsTableView];
    [searchDisplayController.searchResultsTableView reloadData];
}
//Xu ly khi Edit Text trong UISearchBar
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:[self.searchBar text] completionHandler:^(NSArray *placemarks, NSError *error) {
         [locationMark removeAllObjects];
        if([history count]!=0)
        {
            for(CLPlacemark *temp in history){
                NSString *strSearch=[self.searchBar text];
                //chuyen thanh tieng viet khong dau
                NSData *data1=[temp.description dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
                NSString *address1=[[NSString alloc]initWithData:data1 encoding:NSASCIIStringEncoding];
                NSData *data2=[strSearch dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
                NSString *address2=[[NSString alloc]initWithData:data2 encoding:NSASCIIStringEncoding];
                if([[address1 lowercaseString] rangeOfString:[address2 lowercaseString]].location!=NSNotFound){
                    [locationMark addObject:temp];
                }
            }
        }

        [locationMark addObjectsFromArray:placemarks];
        mark=[placemarks objectAtIndex:0];
        [searchDisplayController.searchResultsTableView reloadData];
    }];
}

//Xu ly khi tim kiem hoan tat
-(void)searchDisplayControllerDidEndSearch:(UISearchDisplayController *)controller{
    searchBar.frame=CGRectMake(0, 0, 260, 44);
}
//Click button Search
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self.searchDisplayController setActive:NO animated:YES];
    location=mark.location.coordinate;
    NSString *nationPlace=mark.country;
    NSString *cityPlace=mark.administrativeArea;
    NSString *districPlace=mark.subAdministrativeArea;
    NSString *wardPlace=mark.subLocality;
    NSString *streetPlace=mark.thoroughfare;
    namePlace=[NSString stringWithFormat:@"%@, %@, %@, %@, %@",streetPlace,wardPlace,districPlace,cityPlace,nationPlace];
    [_mapView setCenterCoordinate:location animated:NO];
    annotation.title=namePlace;
    [_mapView removeAnnotation:annotation];
    pin.canShowCallout=YES;
    annotation.coordinate=location;
    [_mapView addAnnotation:annotation];
    if([history count]!=0)
    {
        for(CLPlacemark *temp in history)
            if([mark.description isEqualToString:temp.description])
            {
                [history removeObject:temp];
                break;
            }
    }
    if(mark!=nil)
    {
        [history addObject:mark];
    }
    
}
//SearchResultsTableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ([locationMark count]);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *IDENTIFIER = @"SearchResultsCell";
    CLPlacemark *item;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:IDENTIFIER];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:IDENTIFIER];
    }
    UIImage *imageCell=[UIImage imageNamed:@"icon.png"];
    if([[self.searchBar text] isEqualToString:@""])
    {
        cell.imageView.image=imageCell;
    }
    else cell.imageView.image=nil;
   if([locationMark count]!=0)
   {
    item=[locationMark objectAtIndex:indexPath.row];
    cell.textLabel.text = item.description;
   }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    mark=[locationMark objectAtIndex:indexPath.row];
    [self performSelector:@selector(searchBarSearchButtonClicked:) withObject:nil];
}

//Thuc hien add location cho image
-(IBAction)btnDone:(id)sender{
    GPSInfo=[NSString stringWithFormat:@"Information's Image:\nLatitude=%f\nLongitude=%f",location.latitude,location.longitude];
    [lblGPS setText:GPSInfo];
    self.btnLimit.hidden=true;
    self.btnNormal.hidden=true;
    [_mapView setHidden:true];
    [naviBar setHidden:true];
    [viewImage addSubview:imageView];
    [viewImage addSubview:lblGPS];
    [viewImage addSubview:btnOK];
    imageView.frame=CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height-50);
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.8];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    imageView.frame=CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height-50);
    [UIView commitAnimations];
    [self.view addSubview:viewImage];
    [_mapView removeAnnotation:annotation];
}

//Xu ly khi xem anh xong
-(void)btnOK:(id)sender{
    [UIView beginAnimations:@"animate" context:nil];
    [UIView setAnimationDuration:0.6];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    btnOK.frame=CGRectMake(220, self.view.frame.size.height, 100, 50);
    lblGPS.frame=CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 50);
    imageView.frame=CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height);
    [UIView commitAnimations];
    
    [self.btnLimit setHidden:false];
    [self.btnNormal setHidden:false];
}
-(void)numberAction:(NSInteger)number :(UIImage *)image :(double)latitude :(double)longitude{
    actionNumber=number;
    img=image;
    GPSInfo=[NSString stringWithFormat:@"Information's Image:\nLatitude=%f\nLongitude=%f",latitude,longitude];
}

- (void)elcImagePickerControllerDidCancel:(ELCImagePickerController *)picker
{
    if ([self respondsToSelector:@selector(dismissViewControllerAnimated:completion:)]){
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self dismissModalViewControllerAnimated:YES];
    }
}

//set Draggable=YES
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    if(pin==nil){
        pin=[[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"annotation"];
    }
    else{
        pin.annotation=annotation;
    }
    
    pin.canShowCallout=YES;
    return pin;

}
//tao animation khi add annotation
-(void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views{
    for (MKAnnotationView *mkpin in views) {
        mkpin.canShowCallout = YES;
        CGRect endFrame = mkpin.frame;
        mkpin.frame = CGRectOffset(mkpin.frame, 0, -230);
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:1];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        mkpin.frame = endFrame;
        [UIView commitAnimations];
        NSLog(@"%f",mkpin.frame.size.height);
    }
    
}
- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
    for (id<MKAnnotation> currentAnnotation in _mapView.annotations) {
        if ([currentAnnotation isEqual:annotation]) {
            [_mapView selectAnnotation:currentAnnotation animated:YES];
        }
    }
    if([animationID isEqualToString:@"animate"]){
        [viewImage setHidden:true];
    }
}

-(void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)annotationView{
    pin.canShowCallout=NO;
    pin.leftCalloutAccessoryView=nil;
    pin.draggable=YES;
}
//xu ly khi pin thay doi vi tri
-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)annotationView didChangeDragState:(MKAnnotationViewDragState)newState fromOldState:(MKAnnotationViewDragState)oldState{
    
    if(newState==MKAnnotationViewDragStateEnding){
        location=annotationView.annotation.coordinate;
        annotationView.canShowCallout=YES;
        annotationView.leftCalloutAccessoryView=imageView;
        [annotation setTitle:[NSString stringWithFormat:@"%f,%f",location.latitude,location.longitude]];
}
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload
{
    [self setBtnLimit:nil];
    [self setBtnNormal:nil];
    [self setMapView:nil];
}

@end
