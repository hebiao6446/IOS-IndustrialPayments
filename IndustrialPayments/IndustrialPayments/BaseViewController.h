//
//  BaseViewController.h
//  BusinessLineWorld
//
//  Created by May Peach & He Biao on 14-5-30.
//  Copyright (c) 2014年 Hebiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ASIFormDataRequest;

@interface BaseViewController : UIViewController



-(void)createBarLeftWithImage:(NSString *)imageName;
-(void)createBarRightWithImage:(NSString *)imageName;
-(void)createBarRightWithTitle:(NSString *)title;
-(void)createBarRightWithImage:(NSString *)imageName with:(float)w;
-(void)showLeft:(UIButton *)sender;
-(void)showRight:(UIButton *)sender;


 






@property (retain, nonatomic) ASIFormDataRequest *httpRequest;


@end
