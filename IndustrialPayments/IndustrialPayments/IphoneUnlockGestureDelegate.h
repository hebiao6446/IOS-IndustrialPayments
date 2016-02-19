//
//  IphoneUnlockGestureDelegate.h
//  IndustrialPayments
//
//  Created by May Peach & He Biao on 14-8-28.
//  Copyright (c) 2014年 Hebiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IphoneUnlockGestureDelegate <NSObject>



-(void)iphoneUnlockGestureSetGesture:(NSString *)gestureString;

-(void)iphoneUnlockGestureDidForgetGesture:(NSInteger )indexTag;

@end
