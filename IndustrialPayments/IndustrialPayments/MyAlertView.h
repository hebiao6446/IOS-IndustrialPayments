//
//  MyAlertView.h
//  FortunaShook
//
//  Created by 正行 夏 on 12-9-20.
//  Copyright (c) 2012年 上海民之智能科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface MyAlertView : UIView

+ (id)alertViewInView:(UIView *)aSuperview getMessage:(NSString *)message kind:(BOOL)_kind x:(float)_x y:(float)_y;
- (void)removeView; 

@end
