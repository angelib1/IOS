//
//  BIDOffsetObjectToKeyboard.m
//  Exersice11
//
//  Created by Nguyen Thanh Son on 8/15/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import "BIDOffsetObjectToKeyboard.h"

@interface BIDOffsetObjectToKeyboard ()

@end
@implementation BIDOffsetObjectToKeyboard
@synthesize txtText;
@synthesize tableView;
@synthesize compareOffset;
@synthesize keyboardIsVisible,keyboardSize;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
       

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)registerForKeyboardNotifications
{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:) name:UIKeyboardWillHideNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidChangeFrame:) name:UIKeyboardDidChangeFrameNotification object:nil];
    
}
- (void)keyboardWillChangeFrame:(NSNotification *)aNotification {
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    keyboardSize = kbSize;
    [self changeContentInset:kbSize];
    
}

- (void)keyboardDidChangeFrame:(NSNotification *)aNotification {
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    keyboardSize = kbSize;
    [self changeFrame:kbSize];
}

- (void)keyboardWasShown:(NSNotification *)aNotification {
    keyboardIsVisible = YES;
}

- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    keyboardIsVisible = NO;
}

- (void) resetContentInset{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.6];
    [UIView setAnimationDelegate:self];
    tableView.contentInset = UIEdgeInsetsZero;
    tableView.scrollIndicatorInsets = UIEdgeInsetsZero;
    tableView.contentOffset = CGPointZero;
    [UIView commitAnimations];
}

- (void) changeContentInset:(CGSize)kbSize{
    UIEdgeInsets contentInsets;
    UIInterfaceOrientation interfaceOrientation = [UIApplication sharedApplication].statusBarOrientation;
    
    if(UIInterfaceOrientationIsPortrait(interfaceOrientation)){
        contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height - 20, 0.0);
    } else if(UIInterfaceOrientationIsLandscape(interfaceOrientation)){
        contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.width - 20, 0.0);
    }
    [tableView setContentInset:contentInsets];
}


- (void) changeFrame:(CGSize)kbSize{
    //get cell of currently active textField.
    tableView.contentInset=UIEdgeInsetsMake(0, 0, keyboardSize.height+compareOffset, 0);
    //Get screen size. This screen include tableView and statusBar
//    CGRect aRect = [[UIScreen mainScreen] bounds];
//    CGRect statusBarFrame = [[UIApplication sharedApplication] statusBarFrame];
//    
//    CGRect screen; //This is tableView size.
//    CGSize keyboard;
//    UIInterfaceOrientation interfaceOrientation = [UIApplication sharedApplication].statusBarOrientation;
//    //Căn chỉnh theo chiều.
//    if(UIInterfaceOrientationIsPortrait(interfaceOrientation)){
//        aRect.size.height -= statusBarFrame.size.height;
//        screen.size = CGSizeMake(aRect.size.width, aRect.size.height);
//        keyboard = kbSize;
//    } else if(UIInterfaceOrientationIsLandscape(interfaceOrientation)){
//        //If orientation is landspace, height and width swap.
//        aRect.size.width -= statusBarFrame.size.width;
//        screen.size = CGSizeMake(aRect.size.height, aRect.size.width);
//        keyboard.height = kbSize.width;
//        keyboard.width = kbSize.height;
//    }
//    
//    
//    screen.size.height -= keyboard.height;
    //tableView.contentInset=UIEdgeInsetsMake(0, 0, screen.size.height+20, 0);
    //Kiểm tra xem textField có ở cao hơn màn hình không, nếu có thì dịch xuống.
//    if(tableView.contentOffset.y > txtText.frame.origin.y){
//        CGPoint scrollPoint = CGPointMake(0.0, txtText.frame.origin.y - 10);
//        //[tableView setContentOffset:scrollPoint animated:YES];
//    }
//    
//    //Kiểm tra textfield có bị bàn phím che mất không, nếu có thì dịch lên.
//    else if (screen.size.height + tableView.contentOffset.y < txtText.frame.origin.y + compareOffset) {
//        CGPoint scrollPoint = CGPointMake(0.0,compareOffset - screen.size.height + 10);
//        //[tableView setContentOffset:scrollPoint animated:YES];
//    }
}
//Xu ly khi click vao TextField
-(void)textFieldDidBeginEditing{
    //Check if keyboard is visible change the contenOffset and contentInset of tableView.
    if(keyboardIsVisible){
        [self changeFrame:keyboardSize];
    }
}
//Xu ly khi ket thuc edit TextField
-(void)textFieldDidEndEditing{
    //if keyboard invisible, reset tableview
    if(!keyboardIsVisible){
        [self resetContentInset];
    }
}
//Xu ly khi thay doi TextField
-(void)textChange{
    if(keyboardIsVisible){
        [self changeFrame:keyboardSize];
    }
}
//Xu ly khi Return
-(void)shouldReturn{
    [self resetContentInset];
}
@end
