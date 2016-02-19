//
//  DatePickView.m
//  JuPin
//
//  Created by May Peach & He Biao on 14-8-14.
//  Copyright (c) 2014年 Hebiao. All rights reserved.
//

#import "DatePickView.h"


 #define IPHONE5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

@implementation DatePickView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)init{
    
    self = [super initWithFrame:CGRectMake(0,  416+(IPHONE5?88:0)-194, 320, 194)];
    if (self) {
        // Initialization code
        
        self.backgroundColor=[UIColor whiteColor];
        
        UIButton *btnbl = [UIButton buttonWithType : UIButtonTypeCustom];
        btnbl.frame = CGRectMake (10, 0, 44, 44);
        //    [btnbl setBackgroundImage :[UIImage imageNamed:@"barbutton134.png"] forState:UIControlStateNormal];
        [btnbl setTitle:@"取消" forState:UIControlStateNormal];
        //    [btnbl setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btnbl setTitleColor:[UIColor colorWithRed:4.0/255 green:150.0/255 blue:222.0/255 alpha:1.0] forState:UIControlStateNormal];
        btnbl.showsTouchWhenHighlighted=YES;
        [btnbl addTarget:self action:@selector(btnbl) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btnbl];
        
        
        
        
        UIButton *btnbr = [UIButton buttonWithType : UIButtonTypeCustom];
        btnbr.frame = CGRectMake (320-10-44,0 , 44, 44);
        //    [btnbl setBackgroundImage :[UIImage imageNamed:@"barbutton134.png"] forState:UIControlStateNormal];
        [btnbr setTitle:@"确定" forState:UIControlStateNormal];
        [btnbr setTitleColor:[UIColor colorWithRed:4.0/255 green:150.0/255 blue:222.0/255 alpha:1.0] forState:UIControlStateNormal];
        //    [btnbr setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btnbr.showsTouchWhenHighlighted=YES;
        [btnbr addTarget:self action:@selector(btnbr) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btnbr];
        
        
        dateString=[[NSMutableString alloc] init];
        
        
        
        UIDatePicker *datePicker1 = [[UIDatePicker alloc]init];
        datePicker1.frame = CGRectMake(0, 44, 320, 150);
        //    [datePicker1 setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
        [datePicker1 setTimeZone:[NSTimeZone timeZoneWithName:@"zh_CN"]];
        NSDateFormatter* formater = [[NSDateFormatter alloc] init];
        [formater setDateFormat:@"yyyy-MM-dd"];
        
        [dateString setString:[formater stringFromDate:[NSDate date]]];
        //    NSDate* dateMin = [formater dateFromString:strMin];
        //    NSDate *dataMax=[formater dateFromString:strMax];
//        datePicker1.minimumDate=[NSDate date];
//        datePicker1.maximumDate =[NSDate dateWithTimeIntervalSinceNow:365*24*3600];
        [formater release];
        //    datePicker.alpha=0.5;
        datePicker1.locale=[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"] ;
        datePicker1.datePickerMode = UIDatePickerModeDate;
        [datePicker1 addTarget:self action:@selector(selectedNowDate:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:datePicker1];
        [datePicker1 release];

        
        
    }
    return self;
    
}

-(void)btnbl{
    
    self.hidden=YES;
}

-(void)btnbr{
    [self.delegate datePickViewDidDateSelect:dateString];
    self.hidden=YES;
    
    
    
    
}

-(void)selectedNowDate:(UIDatePicker *)sender{
    
    
    NSDate *date = sender.date;
    NSDateFormatter *formatter = [[[NSDateFormatter alloc]init] autorelease];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    [dateString setString:[formatter stringFromDate:date]];
    
}

-(void)dealloc{
    
    
    [dateString release];dateString =nil;
    
    
    [super dealloc];
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
