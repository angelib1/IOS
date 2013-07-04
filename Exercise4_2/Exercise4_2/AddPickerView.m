//
//  AddPickerView.m
//  Exercise4_2
//
//  Created by Nguyen Thanh Son on 5/7/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import "AddPickerView.h"
#import "ViewController.h"
#import "AddCell.h"
#define dayComponent 0
#define monthComponent 1
#define yearComponent 2
AddCell *cell;
@implementation AddPickerView
@synthesize datePicker;
@synthesize  dayType;
@synthesize monthType;
@synthesize yearType;
@synthesize toolbar;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        dayType=@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31"];
    monthType=@[@"January",@"February",@"March",@"April",@"May",@"June",@"July",@"August",@"September",@"October",@"November",@"December"];
        
    yearType=@[@"1990",@"1991",@"1992",@"1993",@"1994",@"1995",@"1996",@"1997",@"1998",@"1999",@"2000",@"2001",@"2000",@"2001",@"2000",@"2001",@"2002",@"2003",@"2004",@"2005",@"2006",@"2007",@"2008",@"2009",@"2010",@"2011",@"2012",@"2013"];
        datePicker=[[UIPickerView alloc]init];
        [datePicker setShowsSelectionIndicator:YES];
        
        toolbar=[[UIToolbar alloc]init];
               
        UIBarButtonItem *btnOK=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(btnClick:)];
        toolbar.items=[NSArray arrayWithObject:btnOK];
        datePicker.delegate=self;
        datePicker.dataSource=self;
        [self addSubview:datePicker];
        [self addSubview:toolbar];
        // Initialization code
    }
    return self;
}

-(void) setCell:(AddCell *)c{
    cell = c;
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if(component==dayComponent)
    {
        return [dayType count];
    }
    else if(component==monthComponent)
        return [monthType count];
    else return [yearType count];
    
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if(component==dayComponent)
        
        return dayType[row];
    else if(component==monthComponent)
        return monthType[row];
    else return yearType[row];
}

//Xu li nut Done
-(IBAction)btnClick:(id)sender{
    datePicker.hidden=true;
    toolbar.hidden=true;
    NSInteger dayRow=[datePicker selectedRowInComponent:dayComponent];
    NSInteger monthRow=[datePicker selectedRowInComponent:monthComponent];
    NSInteger yearRow=[datePicker selectedRowInComponent:yearComponent];
    NSString *day=dayType[dayRow];
    NSString *month=monthType[monthRow];
    NSString *year=yearType[yearRow];
    cell.lblValue.text=[NSString stringWithFormat:@"%@,%@,%@",day,month,year];
    

    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
