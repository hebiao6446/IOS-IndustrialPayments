//
//  LoginViewController.m
//  IndustrialPayments
//
//  Created by May Peach & He Biao on 14-8-29.
//  Copyright (c) 2014年 Hebiao. All rights reserved.
//

#import "LoginViewController.h"

#import "RegisterViewController.h"

#import "GetPasswordViewController.h"


#import "HeadFile.h"



@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"登录";
    [self createBarRightWithTitle:@"注册"];
    
    
    UIImageView *logoView=[[UIImageView alloc] init];
    logoView.frame=CGRectMake(0, 10, 320, 150);
    [logoView setImage:IMAGEWITHNAME(@"image5")];
    [self.view addSubview:logoView];
    [logoView release];
    
    
    
    UIImageView *inputView=[[UIImageView alloc] init];
    inputView.frame=CGRectMake(0, 180, 320, 100);
    [inputView setImage:IMAGEWITHNAME(@"image6")];
    [self.view addSubview:inputView];
    [inputView release];
    
    
    
    accountTextField=[[UITextField alloc] init];
    accountTextField.frame=CGRectMake(63, 180+5, 225, 40);
    accountTextField.backgroundColor=[UIColor clearColor];
    accountTextField.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    accountTextField.placeholder=@"请输入用户名";
    accountTextField.clearButtonMode=UITextFieldViewModeWhileEditing;
    accountTextField.returnKeyType=UIReturnKeyNext;
    //    nameTextField.keyboardType= UIKeyboardTypePhonePad;
    accountTextField.autocapitalizationType=UITextAutocapitalizationTypeNone; //首字母不大写
    accountTextField.autocorrectionType = UITextAutocorrectionTypeNo;// 不执行自动更正单词
    accountTextField.delegate=self;
    [self.view addSubview:accountTextField];
    accountTextField.text=@"zhang.yun@lcz.com.cn";
    //    accountTextField.text=@"15921994335";
    
    
    passWordTextField=[[UITextField alloc] init];
    passWordTextField.frame=CGRectMake(63, 220+17, 225, 40);
    passWordTextField.backgroundColor=[UIColor clearColor];
    passWordTextField.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    passWordTextField.placeholder=@"请输入密码";
    passWordTextField.clearButtonMode=UITextFieldViewModeWhileEditing;
    passWordTextField.returnKeyType=UIReturnKeyDone;
    //    nameTextField.keyboardType= UIKeyboardTypePhonePad;
    passWordTextField.autocapitalizationType=UITextAutocapitalizationTypeNone; //首字母不大写
    passWordTextField.autocorrectionType = UITextAutocorrectionTypeNo;// 不执行自动更正单词
    passWordTextField.delegate=self;
    passWordTextField.secureTextEntry=YES;
    [self.view addSubview:passWordTextField];
    passWordTextField.text=@"wharton6";
    //    passWordTextField.text=@"qazwsx123";
    
    
    
    
    UIButton *loginButton=[[UIButton alloc] init];
    loginButton.frame=CGRectMake(0, 290, 320, 40);
    [loginButton setImage:IMAGEWITHNAME(@"button7") forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(doLoginAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    [loginButton release];
    
    UIButton *forgetButton=[[UIButton alloc] init];
    forgetButton.frame=CGRectMake(210, 340, 110, 30);
    [forgetButton setImage:IMAGEWITHNAME(@"button8") forState:UIControlStateNormal];
    [forgetButton addTarget:self action:@selector(getPassWord) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgetButton];
    [forgetButton release];
    

    
    
}


-(void)passUserNameAction:(NSString *)userName{
    
    accountTextField.text=userName;
    
    
}
-(void)getPassWord{
    
    [self.view endEditing:YES];
    
    
    
    GetPasswordViewController *gpvc=[[GetPasswordViewController alloc] init];
    gpvc.delegate=self;
    [self.navigationController pushViewController:gpvc animated:YES];
    [gpvc release];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    
    
    if (textField==accountTextField) {
        [passWordTextField becomeFirstResponder];
    }else if (textField==passWordTextField){
        
        [passWordTextField resignFirstResponder];
        
        
        [self doLoginAction];
        
        
        
    }
    
    return YES;
}
-(void)doLoginAction{
    
    
    [self.view endEditing:YES];
    
    
    
    
    
    if ([[StaticFunction trimSpaceInTextField:accountTextField.text] length]==0) {
        
        [StaticFunction alertView:self.view msg:accountTextField.placeholder];
        
        return;
    }
    
    
    if ([passWordTextField.text length]==0) {
        
        [StaticFunction alertView:self.view msg:passWordTextField.placeholder];
        
        return;
    }
    
    
    
    self.httpRequest=[ASIFormDataRequest requestWithURL:[NSURL URLWithString:USERLOGIN_2]];
    [self.httpRequest setDelegate:self];
    [self.httpRequest setRequestMethod:@"POST"];
    [self.httpRequest setDefaultResponseEncoding:NSUTF8StringEncoding];
    [self.httpRequest setPostValue:[StaticFunction trimSpaceInTextField:accountTextField.text] forKey:@"customer.loginId"];
    [self.httpRequest setPostValue:passWordTextField.text forKey:@"customer.password"];
    [self.httpRequest setDidStartSelector:@selector(startGetData:)];
    [self.httpRequest setDidFinishSelector:@selector(finishGetData:)];
    [self.httpRequest setDidFailSelector:@selector(failGetData:)];
    [self.httpRequest startAsynchronous];
    
    
}
-(void)startGetData:(ASIFormDataRequest *)sender{
    [StaticFunction addAlertView:self.view msg:@"登录中..."];
}
-(void)finishGetData:(ASIFormDataRequest *)sender{
    [StaticFunction removeAlertView:self.view];
    
    NSDictionary *data=[HttpRequestDic JsonData:sender];
    
    
    
    if ([HttpRequestDic isOkStatus:data]) {
        
        
       
        
        [UserPart saveUserLoginStatus:YES];
        [UserPart saveUser:data];
        
        
        
        [self.delegate userLoginSucAction];
        
        
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
        
        
        
    }else{
        
        [StaticFunction alertView:self.view msg:data[@"msg"]];
    }
    
}
-(void)failGetData:(ASIFormDataRequest *)sender{
    [StaticFunction removeAlertView:self.view];
    
    
    
}

-(void)showRight:(UIButton *)sender{
    
    RegisterViewController *rvc=[[RegisterViewController alloc] init];
    rvc.delegate=self;
    [self.navigationController pushViewController:rvc animated:YES];
    [rvc release];
    
    
    
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if (isIPhone5) {
        return;
    }
    
    
    
    
    //    [UIView beginAnimations:@"ResizeForKeyBoard" context:nil];
    //    [UIView setAnimationDuration:0.3];
    CGRect rect = CGRectMake(0,-40-(isIPhone5?0:40),320,416+(isIPhone5?88:0));
    self.view.frame = rect;
    //    [UIView commitAnimations];
    
    
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    if (isIPhone5) {
        return;
    }
    
    
    //    [UIView beginAnimations:@"ResizeForKeyBoard" context:nil];
    //    [UIView setAnimationDuration:0.01];
    CGRect rect = CGRectMake(0,ISIOS7LATER?64:0,320,416+(isIPhone5?88:0));
    self.view.frame = rect;
    //    [UIView commitAnimations];
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
    
}



-(void)dealloc{
    
    
    [accountTextField release]; accountTextField=nil;
    [passWordTextField release]; passWordTextField=nil;
    
    
    [super dealloc];
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
