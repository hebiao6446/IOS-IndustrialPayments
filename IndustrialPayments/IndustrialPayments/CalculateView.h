//
//  CalculateView.h
//  IndustrialPayments
//
//  Created by May Peach & He Biao on 14-9-3.
//  Copyright (c) 2014年 Hebiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculateView : UIView{
    
    
    UILabel *dayLabel,*moneyLabel;
    
    
}

-(void)setDayLabelText:(NSString *)day;
-(void)setMoneyLabelText:(NSString *)money;

-(id)init;
@end
