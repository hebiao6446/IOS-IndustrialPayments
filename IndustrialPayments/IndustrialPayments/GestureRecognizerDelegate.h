//
//  GestureRecognizerDelegate.h
//  IndustrialPayments
//
//  Created by May Peach & He Biao on 14-9-4.
//  Copyright (c) 2014年 Hebiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GestureRecognizerDelegate <NSObject>

-(void)gestureRecognizerAction:(UISwipeGestureRecognizer *)sender;


@end
