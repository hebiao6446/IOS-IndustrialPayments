//
//  CalculateView.m
//  IndustrialPayments
//
//  Created by May Peach & He Biao on 14-9-3.
//  Copyright (c) 2014年 Hebiao. All rights reserved.
//

#import "CalculateView.h"


 #define IPHONE5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

@implementation CalculateView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(id)init{
    
    self = [super initWithFrame:CGRectMake(0,  416+(IPHONE5?88:0)-210, 320, 210)];
    if (self) {
        
        self.backgroundColor=[UIColor clearColor];
        UIImageView *imageView=[[UIImageView alloc] init];
        imageView.frame=CGRectMake(0, 0, 320, 210);
        [imageView setImage:[UIImage imageNamed:@"calculateimage"]];
        [self addSubview:imageView];
        [imageView release];
        
        
        UIButton *button=[[UIButton alloc] init];
        button.frame=CGRectMake(270, 0, 60, 60);
        button.backgroundColor=[UIColor clearColor];
        [button addTarget:self action:@selector(butAction) forControlEvents:UIControlEventTouchUpInside];
        button.showsTouchWhenHighlighted=YES;
        [self addSubview:button];
        [button release];
        
        
        dayLabel=[[UILabel alloc] init];
        dayLabel.frame=CGRectMake(124, 108, 140, 15);
        dayLabel.backgroundColor=[UIColor clearColor];
        dayLabel.textColor=[UIColor redColor];
        [self addSubview:dayLabel];
        [dayLabel release];
        
        
        
        moneyLabel=[[UILabel alloc] init];
        moneyLabel.frame=CGRectMake(124, 143, 140, 15);
        moneyLabel.backgroundColor=[UIColor clearColor];
        moneyLabel.textColor=[UIColor redColor];
        [self addSubview:moneyLabel];
        [moneyLabel release];
        
        
    
    }
    
    return self;
}


-(void)setMoneyLabelText:(NSString *)money{
    moneyLabel.text=money;
}
-(void)setDayLabelText:(NSString *)day{
    dayLabel.text=day;
    
    
}

-(void)butAction{
    
    self.hidden=YES;
    
    
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
