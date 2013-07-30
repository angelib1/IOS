//
//  BIDViewController.m
//  MapIOS
//
//  Created by Nguyen Thanh Son on 7/9/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import "BIDViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import <sqlite3.h>
#import "SBJson.h"
#import "SBJsonParser.h"
@interface BIDViewController ()

@end
CLLocationCoordinate2D location;
@implementation BIDViewController
@synthesize searchBar,searchDisplay;
@synthesize toolbar,mapView,draggableMarker,mapTypeButton,streetViewButton;
@synthesize marker1,marker2,polyLine,path,streetView;
@synthesize locationArray, connection,dataRespond;
@synthesize locationDic,dataAddress,addressSame;
//@synthesize dataBaseName,dataBasePath,mapData;
- (void)viewDidLoad
{
    [super viewDidLoad];
    mapView.delegate=self;
    
	// Do any additional setup after loading the view, typically from a nib.
    
    //toolbar
    UIBarButtonItem *zoomInButton=[[UIBarButtonItem alloc]initWithTitle:@"+" style:UIBarButtonItemStyleBordered target:self action:@selector(zoomIn:)];
    UIBarButtonItem *zoomOutButton=[[UIBarButtonItem alloc]initWithTitle:@"-" style:UIBarButtonItemStyleBordered target:self action:@selector(zoomOut:)];
    UIBarButtonItem *rotateButton=[[UIBarButtonItem alloc]initWithTitle:@"Rotate" style:UIBarButtonItemStyleBordered target:self action:@selector(rotate:)];
    mapTypeButton=[[UIBarButtonItem alloc]initWithTitle:@"Satellite" style:UIBarButtonItemStyleBordered target:self action:@selector(mapType:)];
    streetViewButton=[[UIBarButtonItem alloc]initWithTitle:@"Street View" style:UIBarButtonItemStyleBordered target:self action:@selector(StreetView:)];
    streetViewButton.enabled=NO;
    NSArray *button=[[NSArray alloc]initWithObjects:zoomInButton,zoomOutButton,rotateButton,mapTypeButton,streetViewButton, nil];
    toolbar.items=button;
    
    //set vi tri cho mapView
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:21.025747 longitude:105.851555 zoom:15];
    //mapView=[[GMSMapView alloc]initWithFrame:CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height-toolbar.frame.size.height-84)];
   mapView=[[GMSMapView alloc]initWithFrame:CGRectMake(0, 44, [UIScreen mainScreen].applicationFrame.size.width, [UIScreen mainScreen].applicationFrame.size.height-44-toolbar.frame.size.height)];
    streetView=[[GMSPanoramaView alloc]initWithFrame:CGRectMake(0, 44, [UIScreen mainScreen].applicationFrame.size.width, [UIScreen mainScreen].applicationFrame.size.height-44-toolbar.frame.size.height)];
    mapView.buildingsEnabled=YES;
    //GPS
//    [mapView addObserver:self
//               forKeyPath:@"myLocation"
//                  options:NSKeyValueObservingOptionNew
//                  context:NULL];
    mapView.accessibilityElementsHidden=NO;
    mapView.mapType=kGMSTypeNormal;
    mapView.settings.compassButton=YES;
    mapView.settings.myLocationButton=YES;
    mapView.myLocationEnabled=YES;
    mapView.settings.zoomGestures=NO;
    
    [mapView setCamera:camera];
    [self.view addSubview:mapView];
    [self.view addSubview:toolbar];
    
    //set Dragg va Drop
    draggableMarker=[[BIDDragableMarker alloc] initWithMapView:mapView delegate:self];
    
    // Tao cac Marker tren MapView
    marker1 = [[GMSMarker alloc] init];
    marker1.position = CLLocationCoordinate2DMake(21.025747,105.851555);
    marker1.snippet = @"Thanh pho Ha noi, Viet Nam";
    [draggableMarker addDraggableMarker:marker1];
    marker1.map=mapView;
    
    marker2 = [[GMSMarker alloc] init];
    marker2.position = CLLocationCoordinate2DMake(21.026227,105.84559);
    marker2.snippet = @"Ba Trieu, Ha noi, Viet Nam";
    [draggableMarker addDraggableMarker:marker2];
    marker2.map=mapView;
    
    //Ve polyline noi 2 Marker
    path=[GMSMutablePath path];
    [path addCoordinate:marker1.position];
    [path addCoordinate:marker2.position];
    polyLine=[GMSPolyline polylineWithPath:path];
    polyLine.strokeColor=[UIColor blueColor];
    polyLine.strokeWidth=5;
   
    polyLine.map=mapView;
    [mapView bringSubviewToFront:polyLine.map ];
    
    //SearchBar va SearchDisplayController
    searchBar=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    searchDisplay=[[UISearchDisplayController alloc]initWithSearchBar:searchBar contentsController:self];
    [searchDisplay setDelegate:self];
    searchDisplay.searchResultsDataSource=self;
    searchDisplay.searchResultsDelegate=self;
    searchBar.delegate=self;
    [self.view addSubview:searchBar];
    
    //mang chua cac vi tri tim kiem
    locationArray=[[NSMutableArray alloc]init];
    addressSame=[[NSMutableArray alloc]init];
    
    //database
//    mapData=[[NSMutableArray alloc]init];
//    dataBaseName = @"mapDatBase.sql";
//	NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//	NSString *documentsDir = [documentPaths objectAtIndex:0];
//	dataBasePath = [documentsDir stringByAppendingPathComponent:dataBaseName];
    
    //Xu ly lay xau trong file
    NSString *pathText=[[NSBundle mainBundle]pathForResource:@"dataMap" ofType:@"txt"];
    NSString *text=[NSString stringWithContentsOfFile:pathText encoding:NSUTF8StringEncoding error:nil];
    dataAddress=[text componentsSeparatedByString:@";"];
//    for (NSString *arrayItem in dataAddress){
//        NSLog(@"%@",arrayItem);
//    }
}
//zoom in
-(IBAction)zoomIn:(id)sender{
    GMSCameraUpdate *zoomCamera = [GMSCameraUpdate zoomIn];
    [mapView animateWithCameraUpdate:zoomCamera];
    if(mapView.camera.zoom==kGMSMaxZoomLevel){
        streetViewButton.enabled=YES;
    }
    else streetViewButton.enabled=NO;
}
//Zoom out
-(IBAction)zoomOut:(id)sender{
    GMSCameraUpdate *zoomCamera = [GMSCameraUpdate zoomOut];
    [mapView animateWithCameraUpdate:zoomCamera];
    [self.view bringSubviewToFront:mapView];
    streetViewButton.enabled=NO;
}
//Rotate
-(IBAction)rotate:(id)sender{
    GMSCameraPosition *camera = mapView.camera;
    float zoom = fmax(camera.zoom - 0.1, 17.5);
    
    GMSCameraPosition *newCamera =
    [[GMSCameraPosition alloc] initWithTarget:camera.target
                                         zoom:zoom
                                      bearing:camera.bearing + 10
                                 viewingAngle:camera.viewingAngle + 10];
    [mapView animateToCameraPosition:newCamera];
}
-(IBAction)mapType:(id)sender{
    if([mapTypeButton.title isEqualToString:@"Satellite"]){
        mapTypeButton.title=@"Traffic";
        mapView.mapType=kGMSTypeSatellite;
    }
    else {
        mapTypeButton.title=@"Satellite";
         mapView.mapType=kGMSTypeNormal;
    }

}
-(IBAction)StreetView:(id)sender{
    CGPoint point = mapView.center;
    CLLocationCoordinate2D coor = [mapView.projection coordinateForPoint:point];
    [streetView moveNearCoordinate:coor];
    [self.view addSubview:streetView];
}
//cham vao marker
- (void)mapView:(GMSMapView *)mapView didBeginDraggingMarker:(GMSMarker *)marker
{
    polyLine.map=nil;
    [path removeAllCoordinates];
}
//di chuyen marker
- (void)mapView:(GMSMapView *)mapView didDragMarker:(GMSMarker *)marker
{
    [path removeAllCoordinates];
    polyLine.map=nil;
    if(marker==marker1)
    {
        marker1.position=marker.position;
    }
    else marker2.position=marker.position;
    [path addCoordinate:marker1.position];
    [path addCoordinate:marker2.position];
    polyLine=[GMSPolyline polylineWithPath:path];
    polyLine.strokeColor=[UIColor blueColor];
    polyLine.strokeWidth=5;
    polyLine.map=self.mapView;
    NSLog(@">>> mapView:didDragMarker: %@",[marker1 description]);
}
//hoan thanh di chuyen marker
- (void)mapView:(GMSMapView *)mapView didEndDraggingMarker:(GMSMarker *)marker
{
   [path removeAllCoordinates];
    polyLine.map=nil;
    if(marker==marker1)
    {
        marker1.position=marker.position;
    }
    else marker2.position=marker.position;
    [path addCoordinate:marker1.position];
    [path addCoordinate:marker2.position];
    polyLine=[GMSPolyline polylineWithPath:path];
    polyLine.strokeColor=[UIColor blueColor];
    polyLine.strokeWidth=5;
    polyLine.map=self.mapView;
    NSLog(@">>> mapView:didEndDragMarker: %@",[marker1 description]);
}
//hien thi SearchResultsTableView khi click vao UISearchBar
-(void)searchDisplayController:(UISearchDisplayController *)controller willHideSearchResultsTableView:(UITableView *)tableView{
    [searchDisplay.searchResultsTableView reloadData];
}
-(void)searchDisplayController:(UISearchDisplayController *)controller didHideSearchResultsTableView:(UITableView *)tableView{
    [self.view addSubview:searchDisplay.searchResultsTableView];
}
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    [searchDisplay setActive:YES animated:NO];
}
-(void)searchDisplayControllerWillBeginSearch:(UISearchDisplayController *)controller{
    [searchDisplay.searchResultsTableView reloadData];
}
-(void)searchDisplayControllerDidBeginSearch:(UISearchDisplayController *)controller{
    [self.view addSubview:searchDisplay.searchResultsTableView];
}
//SearchResultsTableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"%d",[locationArray count]+[addressSame count]);
    NSLog(@"%d",[locationArray count]);
    return ([locationArray count]+[addressSame count]);
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *IDENTIFIER = @"SearchResultsCell";
    NSDictionary *item;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:IDENTIFIER];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:IDENTIFIER];
    }
    if([locationArray count]>indexPath.row)
    {
        item=[locationArray objectAtIndex:indexPath.row];
    cell.textLabel.text =[item objectForKey:@"formatted_address"];
    }
    else {
        int i=indexPath.row-[locationArray count];
        if(i<[addressSame count])
        cell.textLabel.text=[addressSame objectAtIndex:i];
       // NSLog(@"%d",i);
    }
    return cell;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *item;
    item=[locationArray objectAtIndex:indexPath.row];
    NSDictionary *geometryDic;
    geometryDic=[item objectForKey:@"geometry"];
    locationDic=[geometryDic objectForKey:@"location"];
    [self performSelector:@selector(searchBarSearchButtonClicked:) withObject:nil];
}
//xu li khi Edit Text UISearchBar
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    //[searchDisplay.searchResultsTableView reloadData];
    [self searchCoordinatesForAddress:[self.searchBar text]];
    [addressSame removeAllObjects];
    NSString *strSearch=[self.searchBar text];
    //chuyen thanh tieng viet khong dau
//    NSData *data1=[temp.description dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
//    NSString *address1=[[NSString alloc]initWithData:data1 encoding:NSASCIIStringEncoding];
    NSData *data=[strSearch dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *address=[[NSString alloc]initWithData:data encoding:NSASCIIStringEncoding];
    for (NSString *arrayItem in dataAddress){
        //NSLog(@"%@",[arrayItem lowercaseString]);

    if([[arrayItem lowercaseString] rangeOfString:[address lowercaseString]].location!=NSNotFound){
        [addressSame addObject:arrayItem];
            }
    }
    //NSLog(@"%d",[addressSame count]);
    [searchDisplay.searchResultsTableView reloadData];
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self.searchDisplayController setActive:NO animated:YES];
    [self.searchBar resignFirstResponder];
    location.latitude=[[locationDic objectForKey:@"lat"]doubleValue];
    location.longitude=[[locationDic objectForKey:@"lng"]doubleValue];
    [mapView setCamera:[GMSCameraPosition cameraWithLatitude:location.latitude longitude:location.longitude zoom:15]];
}
- (void) searchCoordinatesForAddress:(NSString *)inAddress
{
    
    //Tao String Query toi Google Maps.
    NSMutableString *urlString = [NSMutableString stringWithFormat:@"http://maps.googleapis.com/maps/api/geocode/json?address=%@&sensor=false",inAddress];
    //thay the cac dau cach bang dau "+"
    [urlString setString:[urlString stringByReplacingOccurrencesOfString:@" " withString:@"+"]];
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
  
}
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    dataRespond=[[NSMutableData alloc]init];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [dataRespond appendData:data];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    [locationArray removeAllObjects];
    NSString *jsonString = [[NSString alloc] initWithData:dataRespond encoding:NSUTF8StringEncoding];
    SBJsonParser* parser = [[SBJsonParser alloc] init];
    NSDictionary *results = [parser objectWithString:jsonString];
    NSArray *placemark  = [results objectForKey:@"results"];
    [locationArray addObjectsFromArray:placemark];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
