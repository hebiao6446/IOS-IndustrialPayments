//
//  IphoneView2.h
//  IndustrialPayments
//
//  Created by May Peach & He Biao on 14-9-4.
//  Copyright (c) 2014年 Hebiao. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GestureRecognizerDelegate.h"
#import "IphoneViewButtonClickDelegate.h"


@interface IphoneView2 : UIView


-(id)init;

@property (assign,nonatomic) id<GestureRecognizerDelegate>gesterDelegate;
@property (assign,nonatomic) id<IphoneViewButtonClickDelegate>buttonDelegate;
@end
