//
//  ViewController.m
//  Exercise6
//
//  Created by Nguyen Thanh Son on 4/24/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end
UILabel *lblDate,*lblTime;
@implementation ViewController
//@synthesize lblTime;
//@synthesize lblDate;
//@synthesize date;
//NSString *date;
//NSString *timer;
- (void)viewDidLoad
{
    [super viewDidLoad];
    int value=0;
    int tem=0;
	// Do any additional setup after loading the view, typically from a nib.
   // [self.lblDate setText:<#(NSString *)#>]
    
    //lblTime.text=@"0:00";
    lblDate.text=@"1/1/2013";
    int dd[]={31,28,31,30,31,30,31,31,30,31,30,31};
   
    NSDate *now=[NSDate date];
   // NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //[dateFormatter setDateFormat:@"dd/MM/yyyy HH:mm"];
    NSCalendar *calender=[[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    NSUInteger date=NSDayCalendarUnit|NSMonthCalendarUnit|NSYearCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit;
    NSDateComponents *component=[calender components:date fromDate:now];
    NSInteger day=[component day];
    NSInteger month=[component month];
    NSInteger year=[component year];
    NSInteger hour=[component hour];
    
    NSInteger minute=[component minute];
    for(int i=0;i<month;i++)
    {
        value+=dd[i];
    }
    if(minute==30){
        tem=1;
    }
    [self.sliderDate setValue:value+day];
    [self.sliderTime setValue:hour*2+tem];
     float w=self.sliderDate.frame.size.width/364;
    if((self.sliderDate.frame.origin.x+self.sliderDate.frame.size.width)-(lblDate.frame.origin.x)>86)
   // if((self.sliderDate.frame.size.width-self.sliderDate.value*w)>86)
    {
       lblDate=[[UILabel alloc]initWithFrame:CGRectMake(self.sliderDate.frame.origin.x+self.sliderDate.value*w+15, self.sliderDate.frame.origin.y-20, 86, 20)];
    }
    else
    {
        lblDate=[[UILabel alloc]initWithFrame:CGRectMake(self.sliderDate.frame.origin.x+self.sliderDate.value*w-15, self.sliderDate.frame.origin.y-20, 86, 20)];
    }
    float w1=self.sliderTime.frame.size.width/48;
    if((self.sliderTime.frame.size.width-self.sliderTime.value*w)>86)
    {
       lblTime=[[UILabel alloc]initWithFrame:CGRectMake(self.sliderTime.frame.origin.x+self.sliderTime.value*w1+15, self.sliderTime.frame.origin.y-20, 86, 20)];
    }
    else
    {
        lblTime=[[UILabel alloc]initWithFrame:CGRectMake(self.sliderTime.frame.origin.x+self.sliderTime.value*w1-15, self.sliderTime.frame.origin.y-20, 86, 20)];
    }
    lblDate.text=[NSString stringWithFormat:@"%d/%d/%d",day,month,year];
    lblTime.text=[NSString stringWithFormat:@"%d:%d",hour,minute];
    lblDate.backgroundColor=[UIColor clearColor];
    lblTime.backgroundColor=[UIColor clearColor];
    [self.view addSubview:lblDate];
    [self.view addSubview:lblTime];
    NSLog(@"%d",day);
}
-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    float w=self.sliderDate.frame.size.width/364;
    if((self.sliderDate.frame.size.width-self.sliderDate.value*w)>86)
    {
        //self.lblDate.frame=CGRectMake(200+progressDate*w, 100, 86, 20);
        lblDate.frame=CGRectMake(self.sliderDate.frame.origin.x+self.sliderDate.value*w+15, lblDate.frame.origin.y, 86, 20);
    }
    else lblDate.frame=CGRectMake(self.sliderDate.frame.origin.x+self.sliderDate.value*w-86, self.sliderDate.frame.origin.y-20, 86, 20);
    float w1=self.sliderTime.frame.size.width/48;
    if((self.sliderTime.frame.size.width-self.sliderTime.value*w)>44)
        lblTime.frame=CGRectMake(self.sliderTime.frame.origin.x+self.sliderTime.value*w1+15, self.sliderTime.frame.origin.y-20, 44, 20);
    //NSLog(@"%f",w/48);
    else lblTime.frame=CGRectMake(self.sliderTime.frame.origin.x+self.sliderTime.value*w1-44, self.sliderTime.frame.origin.y-20, 44, 20);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskAll;
}
-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationPortrait|UIInterfaceOrientationLandscapeLeft;
}
-(BOOL)shouldAutorotate{
    return YES;
}
- (IBAction)sliderDateChange:(UISlider *)sender {
    int progressDate=lroundf(sender.value);
    int date[]={31,28,31,30,31,30,31,31,30,31,30,31};
    int sum=0;
    int i;
    for( i=0;i<12;i++)
    {
        sum=sum+date[i];
        if(progressDate>sum)
        {
        }
        else
        {
            sum=sum-date[i];
            break;
        }
    }
    lblDate.text=[NSString stringWithFormat:@"%02d/%02d/2013",progressDate-sum,i+1];
    
    float w=self.sliderDate.frame.size.width/364;
    if((self.sliderDate.frame.size.width-progressDate*w)>86)
    {
        //self.lblDate.frame=CGRectMake(200+progressDate*w, 100, 86, 20);
        lblDate.frame=CGRectMake(self.sliderDate.frame.origin.x+progressDate*w+15, lblDate.frame.origin.y, 86, 20);
    }
    else lblDate.frame=CGRectMake(self.sliderDate.frame.origin.x+progressDate*w-86, self.sliderDate.frame.origin.y-20, 86, 20);
    
   // lblDate.text=[NSString stringWithFormat:@"%d",progressDate];
    NSLog(@"%f",self.sliderDate.frame.origin.x+progressDate*w);

}

- (IBAction)sliderTimeChange:(UISlider *)sender {
    int progressTime=lroundf(sender.value);
    if(progressTime%2==0)
    {
        lblTime.text=[NSString stringWithFormat:@"%02d:00",progressTime/2];
    }
    if(progressTime%2==1)
    {
        lblTime.text=[NSString stringWithFormat:@"%02d:30",progressTime/2];
    }
    float w=self.sliderTime.frame.size.width/47;
    if((self.sliderTime.frame.size.width-progressTime*w)>44)
        lblTime.frame=CGRectMake(self.sliderTime.frame.origin.x+progressTime*w+15, self.sliderTime.frame.origin.y-20, 44, 20);
    //NSLog(@"%f",w/48);
    else lblTime.frame=CGRectMake(self.sliderTime.frame.origin.x+progressTime*w-44, self.sliderTime.frame.origin.y-20, 44, 20);
NSLog(@"%f",self.sliderTime.frame.origin.x);
}
@end
