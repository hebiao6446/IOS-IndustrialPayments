//
//  IphoneUnlockGesture.h
//  IndustrialPayments
//
//  Created by May Peach & He Biao on 14-8-28.
//  Copyright (c) 2014年 Hebiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IphoneUnlockGestureDelegate.h"


@interface IphoneUnlockGesture : UIView{
    
    NSMutableArray *mutalearray;
    NSMutableArray *mutag;
    CGPoint curentpoint;
    
    UITextField *resulttext;
    
    
    
    UILabel *nameLabel;
    UIImageView *imagePhoto;
    
    
    
    
    
    
    
    
    
}


@property (assign,nonatomic) id<IphoneUnlockGestureDelegate> delegate;


-(id)init;


@end
