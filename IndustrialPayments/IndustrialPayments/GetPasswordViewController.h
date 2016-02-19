//
//  GetPasswordViewController.h
//  IndustrialPayments
//
//  Created by May Peach & He Biao on 14-9-3.
//  Copyright (c) 2014年 Hebiao. All rights reserved.
//

#import "BackBaseViewController.h"

#import "PassUserNameDelegate.h"


@interface GetPasswordViewController : BackBaseViewController<UITextFieldDelegate,UIAlertViewDelegate>{
    
    UITextField *phoneNumberTextField, *codeNumberTextField, *passwordTextField, *comfirmTextField;
    
    
    
    NSTimer *timer;
    
    int remaintime;
    UILabel *codeLabel,*codeLabel2;
    
    
    NSMutableString *codeString,*codeID;
}

@property (assign,nonatomic) id<PassUserNameDelegate>delegate;



@end
