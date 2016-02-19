//
//  ViewController.h
//  IndustrialPayments
//
//  Created by May Peach & He Biao on 14-8-28.
//  Copyright (c) 2014年 Hebiao. All rights reserved.
//

//#import <UIKit/UIKit.h>
#import "BaseViewController.h"

 

#import "UserLoginSucDelegate.h"


#import "GestureRecognizerDelegate.h"
#import "IphoneUnlockGestureDelegate.h"
#import "IphoneViewButtonClickDelegate.h"

#import "IphoneUnlockGesture.h"


@class IphoneView1;
@class IphoneView2;
@class IphoneView3;


@interface ViewController : BaseViewController<UserLoginSucDelegate,GestureRecognizerDelegate,IphoneUnlockGestureDelegate,IphoneViewButtonClickDelegate>{
    
    
    
    UIButton *photoButton;
    
    
    
    UILabel *userIdLabel;
    
    
    

    IphoneView1 *iphoneView1;
    IphoneView2 *iphoneView2;
    IphoneView3 *iphoneView3;
    
 
    IphoneUnlockGesture *iphoneUnlockGesture;
    
    
    
    
    int  currenPage;
    
    
    
    
}

@end
