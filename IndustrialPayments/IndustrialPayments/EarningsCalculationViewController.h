//
//  EarningsCalculationViewController.h
//  IndustrialPayments
//
//  Created by May Peach & He Biao on 14-9-3.
//  Copyright (c) 2014年 Hebiao. All rights reserved.
//

#import "BackBaseViewController.h"
#import "DatePickView.h"

@class CalculateView;





@interface EarningsCalculationViewController : BackBaseViewController<UIScrollViewDelegate,UITextFieldDelegate,DatePickViewSelectDelegate>{
    
    
    
    DatePickView *datePickView;
    
    CalculateView *calculateView;
    
    
    
    int  timeType;
    
    
    
    
    
    UIButton *button1,*button2;
    
     UIScrollView *mainScroll;
    
    
    UITextField *textField1Moneny,*textField1Rate,*textField1StartTime,*textField1EndTime,*textField1Day, *textField2Moneny, *textField2Rate,*textField2StartTime,*textField2EndTime;
    
    
    
}

@end
