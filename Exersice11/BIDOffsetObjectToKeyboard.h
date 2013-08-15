//
//  BIDOffsetObjectToKeyboard.h
//  Exersice11
//
//  Created by Nguyen Thanh Son on 8/15/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDOffsetObjectToKeyboard : UIViewController<UITextFieldDelegate>
@property (nonatomic, strong) UITextField *txtText;
@property (nonatomic, strong) UITableView *tableView;
@property (readwrite, assign) NSInteger headSectionHeight;
@property (readwrite, assign) NSInteger sectionHeight;
@property (readwrite, assign) NSInteger cellHeight;
@property (readwrite, assign) NSInteger compareOffset;
@property (readwrite, assign) BOOL keyboardIsVisible;
@property (readwrite, assign) CGSize keyboardSize;
//Xu li ban phim
- (void)registerForKeyboardNotifications;
-(void)removeForKeyboardNotification;

- (void)keyboardWasShown:(NSNotification *)aNotification;

- (void)keyboardWillChangeFrame:(NSNotification *)aNotification;

- (void)keyboardDidChangeFrame:(NSNotification *)aNotification;

- (void)keyboardWillBeHidden:(NSNotification*)aNotification;

- (void) resetContentInset;

- (void) changeFrame:(CGSize)kbSize;

- (void) changeContentInset:(CGSize)kbSize;
-(void)textFieldDidBeginEditing;
-(void)textFieldDidEndEditing;
-(void)textChange;
@end
