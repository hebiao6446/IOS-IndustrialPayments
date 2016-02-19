//
//  DatePickView.h
//  JuPin
//
//  Created by May Peach & He Biao on 14-8-14.
//  Copyright (c) 2014年 Hebiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DatePickViewSelectDelegate <NSObject>

-(void)datePickViewDidDateSelect:(NSString *)dateString;

@end

@interface DatePickView : UIView{
    
    NSMutableString *dateString;
}



-(id)init;


@property (assign,nonatomic) id<DatePickViewSelectDelegate>delegate;


@end
