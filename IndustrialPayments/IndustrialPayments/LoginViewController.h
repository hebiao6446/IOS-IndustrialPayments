//
//  LoginViewController.h
//  IndustrialPayments
//
//  Created by May Peach & He Biao on 14-8-29.
//  Copyright (c) 2014年 Hebiao. All rights reserved.
//

#import "BaseViewController.h"

#import "PassUserNameDelegate.h"

#import "UserLoginSucDelegate.h"


@interface LoginViewController : BaseViewController<UITextFieldDelegate,PassUserNameDelegate>{
    
    
    UITextField *accountTextField, *passWordTextField;
    
}


@property (assign,nonatomic) id<UserLoginSucDelegate> delegate;



@end
