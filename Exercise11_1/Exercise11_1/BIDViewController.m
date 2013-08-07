//
//  BIDViewController.m
//  Exercise11_1
//
//  Created by Nguyen Thanh Son on 8/5/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import "BIDViewController.h"
#import "BIDAddCell.h"
#import <QuartzCore/QuartzCore.h>
#import "BIDFirstTableController.h"
#import "BIDSecondTableController.h"
@interface BIDViewController ()

@end
BIDFirstTableController *firstTableControll;
BIDSecondTableController *secondTableControll;
@implementation BIDViewController
@synthesize tabBar,navigationBar;
@synthesize txtSearch,viewScreen,btnAdd;
@synthesize computer,searchBar;
@synthesize tableViewList,tableViewChoice;
@synthesize itemChoice,itemDisplay;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Gesture cho Keybroad
    UITapGestureRecognizer *keybroad=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeybroad:)];
    [self.view addGestureRecognizer:(keybroad)];
	//Background cho man hinh chinh
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"image2.png"]];
    
    //man hinh thu 2 chua cac view đuoc set Alpha
    viewScreen=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].applicationFrame.size.width,[UIScreen mainScreen].applicationFrame.size.height)];
    viewScreen.backgroundColor=[UIColor colorWithWhite:1 alpha:0.2];
    
    //NavigationBar
    UIBarButtonItem *skipBtn = [[UIBarButtonItem alloc]initWithTitle:@"Skip" style:UIBarButtonItemStyleDone target:self action:@selector(skipClick:)];
    navigationBar=[[UINavigationBar alloc ]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].applicationFrame.size.width, 44)];
    navigationBar.delegate=self;
    [navigationBar setTintColor:[UIColor colorWithWhite:0 alpha:0.1]];
    UINavigationItem *firstItem=[[UINavigationItem alloc]init];
    firstItem.rightBarButtonItem=skipBtn;
    firstItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonItemStylePlain target:self action:@selector(backClick:)];
    firstItem.rightBarButtonItem.tintColor=[UIColor blueColor];
    firstItem.leftBarButtonItem.tintColor=[UIColor blueColor];
    [firstItem setTitle:@"Skip Image"];
    [navigationBar pushNavigationItem:firstItem animated:YES];
    
        
    //SearchBar
//    searchBar=[[UISearchBar alloc]initWithFrame:CGRectMake(10, navigationBar.frame.size.height+10, [UIScreen mainScreen].applicationFrame.size.width-20, 30)];
//    searchBar.layer.borderWidth=0;
//    searchBar.layer.borderColor=[[UIColor whiteColor]CGColor];
//    for (id img in searchBar.subviews) {
//        if ([img isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
//            [img removeFromSuperview];
//        }
//    }
//    for (UIView *searchBarSubview in [searchBar subviews]) {
//        if ([searchBarSubview conformsToProtocol:@protocol(UITextInputTraits)]) {
//            @try {
//                
//                [(UITextField *)searchBarSubview setBorderStyle:UITextBorderStyleRoundedRect];
//            }
//            @catch (NSException * e) {
//                // ignore exception
//            }
//        }
//    }
    
    
    
    //itemChoice
    computer = [[NSMutableArray alloc]initWithObjects:@"Golden image nature",@"Greean left",@"Flower white",@"Cloud computing",@"Translate file",@"Golden pound day",nil];
    itemChoice=[[NSMutableArray alloc]init];
    itemDisplay=[[NSMutableArray alloc]init];
    
    
    //TableControll
    firstTableControll=[[BIDFirstTableController alloc]init];
    secondTableControll=[[BIDSecondTableController alloc]init];
    secondTableControll.itemDelegate=self;
    firstTableControll.tagDelegate=self;
    
    //TableViewChoice
    tableViewChoice=[[UITableView alloc]init];
    tableViewChoice.delegate=firstTableControll;
    tableViewChoice.dataSource=firstTableControll;
    firstTableControll.item=itemChoice;
    tableViewChoice.backgroundColor=[UIColor clearColor];
    tableViewChoice.separatorColor=[UIColor clearColor];
    
    //TextField
    txtSearch=[[UITextField alloc]init];
    UIFont *b=[UIFont fontWithName:@"Helvetica" size:14];
    txtSearch.frame=CGRectMake(10, navigationBar.frame.size.height+tableViewChoice.frame.size.height+10, [UIScreen mainScreen].applicationFrame.size.width-20, 30);
    [txtSearch addTarget:self action:@selector(textChange:) forControlEvents:UIControlEventEditingChanged];
    txtSearch.backgroundColor=[UIColor whiteColor];
    txtSearch.font=b;
    txtSearch.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    txtSearch.placeholder=@"Search";
    txtSearch.delegate=self;

    //Button add
    btnAdd=[UIButton buttonWithType:UIButtonTypeContactAdd];
    btnAdd.frame=CGRectMake(txtSearch.frame.origin.x+txtSearch.frame.size.width-txtSearch.frame.size.height,txtSearch.frame.origin.y,30,30);
    [btnAdd addTarget:self action:@selector(ChoiceItem:) forControlEvents:UIControlEventTouchUpInside];
    btnAdd.hidden=YES;
    
    //tableViewList
    tableViewList=[[UITableView alloc]initWithFrame:CGRectMake(0, txtSearch.frame.origin.y+txtSearch.frame.size.height+20, [UIScreen mainScreen].applicationFrame.size.width, [UIScreen mainScreen].applicationFrame.size.height) style:UITableViewStylePlain];
    tableViewList.delegate=secondTableControll;
    tableViewList.dataSource=secondTableControll;
    //Content Inset
    tableViewList.contentInset=UIEdgeInsetsMake(0, 0, 200, 0);
    tableViewList.backgroundColor=[UIColor clearColor];
    tableViewList.separatorColor=[UIColor clearColor];
    
    //[itemDisplay addObjectsFromArray:[computer copy]];
    secondTableControll.item=itemDisplay;
    
    
    [viewScreen addSubview:navigationBar];
    [viewScreen addSubview:txtSearch];
    [viewScreen addSubview:btnAdd];
    [viewScreen addSubview:tableViewList];
    [viewScreen addSubview:tableViewChoice];
    [self.view addSubview:viewScreen];
    
    
}
//thay doi fram cua cac sub View trong MainScreen khi add cell trong first tableView
-(void)changeView{
    tableViewChoice.frame=CGRectMake(0, navigationBar.frame.size.height+10, [UIScreen mainScreen].applicationFrame.size.width, [itemChoice count]*32);
    firstTableControll.item=itemChoice;
    txtSearch.frame=CGRectMake(10, tableViewChoice.frame.origin.y+tableViewChoice.frame.size.height+10, [UIScreen mainScreen].applicationFrame.size.width-20, 30);
    tableViewList.frame=CGRectMake(0, txtSearch.frame.origin.y+txtSearch.frame.size.height+20, [UIScreen mainScreen].applicationFrame.size.width, [UIScreen mainScreen].applicationFrame.size.height);
    btnAdd.frame=CGRectMake(txtSearch.frame.origin.x+txtSearch.frame.size.width-txtSearch.frame.size.height,txtSearch.frame.origin.y,30,30);
}
//Delegate khi xoa 1 cell trong First TableView
-(void)tag:(int)Tag{
    [itemChoice removeObjectAtIndex:Tag];
    [self changeView];
    [tableViewChoice reloadData];
}

//delegate khi click vao cell trong second tableView
-(void)itemChoice:(NSString *)itemchoice{
    if([itemChoice count]<3){
        [firstTableControll.arrayButton removeAllObjects];
        [itemChoice addObject:itemchoice];
        [self changeView];
        [tableViewChoice reloadData];
    }
    else{
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Ban da add toi da la 3 thu vien" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [self.view endEditing:YES];
    }
}

//Click button add cell vao first tableView
-(IBAction)ChoiceItem:(id)sender{
    if([itemChoice count]<3){
    NSString *strItem=txtSearch.text;
        [firstTableControll.arrayButton removeAllObjects];
    [itemChoice addObject:strItem];
    [self changeView];
    [tableViewChoice reloadData];
    [computer addObject:txtSearch.text];
    txtSearch.text=@"";
    //[itemDisplay addObjectsFromArray:[computer copy]];
    [tableViewList reloadData];
    }
    else{
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Ban da add toi da la 3 thu vien" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [self.view endEditing:YES];
    }
    
}

//Xu ly su kien khi thay doi text trong TextField
-(IBAction)textChange:(id)sender{
    //[computer addObject:txtSearch.text];
    if(![txtSearch.text isEqualToString:@""])
        {
            btnAdd.enabled=YES;
            [itemDisplay removeAllObjects];
            NSData *data=[txtSearch.text dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
            NSString *address=[[NSString alloc]initWithData:data encoding:NSASCIIStringEncoding];
            for (NSString *arrayItem in computer){
                if([[arrayItem lowercaseString] rangeOfString:[address lowercaseString]].location!=NSNotFound){
                    [itemDisplay addObject:arrayItem];
                }
                }

            secondTableControll.item=itemDisplay;
            [tableViewList reloadData];
        }
    else btnAdd.enabled=NO;
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    btnAdd.hidden=NO;
    btnAdd.enabled=NO;
    
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    btnAdd.hidden=YES;
}

-(IBAction)hideKeybroad:(id)sender{
    [self.view endEditing:YES];
}
-(IBAction)skipClick:(id)sender{
    
}
-(IBAction)backClick:(id)sender{
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//Cac ham khi rotate man hinh
-(NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskAll;
}
-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationPortrait;
}
-(BOOL)shouldAutorotate{
    return YES;
}
@end
