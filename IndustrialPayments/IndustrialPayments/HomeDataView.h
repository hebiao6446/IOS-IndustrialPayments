//
//  HomeDataView.h
//  IndustrialPayments
//
//  Created by May Peach & He Biao on 14-8-28.
//  Copyright (c) 2014年 Hebiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeDataView : UIView{
    
    UILabel *label1, *label2,*label3,*label4;
    
}


-(id)init;

-(void)setData:(NSDictionary *)data;



@end
