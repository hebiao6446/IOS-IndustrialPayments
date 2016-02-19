//
//  RegisterViewController.h
//  IndustrialPayments
//
//  Created by May Peach & He Biao on 14-8-29.
//  Copyright (c) 2014年 Hebiao. All rights reserved.
//

#import "BaseViewController.h"

#import "PassUserNameDelegate.h"


@class   DCRoundSwitch  ;



@interface RegisterViewController : BaseViewController<UITextFieldDelegate>{
    
    
    UIButton *button1, *button2, *commitButton;
    
    
    
    UIImageView *backImageView;
    
    UITextField *phoneNumberTextField, *codeNumberTextField, *passwordTextField, *emailTextField,*emailPassTextField;
    
    
    
    int  registerFlag;
    
    
    
    
    NSTimer *timer;
    
    int remaintime;
    UILabel *codeLabel,*codeLabel2;
    
    UIButton *codeButton;
    
    
    
    NSMutableString *codeString,*codeID;

    DCRoundSwitch  *roundSwitch1,*roundSwitch2;
    
    
}



@property (assign,nonatomic) id<PassUserNameDelegate>delegate;


@end
