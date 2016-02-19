//
//  GetPasswordViewController.m
//  IndustrialPayments
//
//  Created by May Peach & He Biao on 14-9-3.
//  Copyright (c) 2014年 Hebiao. All rights reserved.
//

#import "GetPasswordViewController.h"

#import "HeadFile.h"


#define LAST_REMIAN_TIME  @"last_remain_time_c"

#define REMAIN_TIME  60

@interface GetPasswordViewController ()

@end

@implementation GetPasswordViewController

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
    self.title=@"找回密码";
    
    
    codeString=[[NSMutableString alloc] init];
    [codeString setString:@"!@#$%^&*("];
    
    codeID=[[NSMutableString alloc] init];
    [codeID setString:@"0000"];
    
    
    
    
    UIImageView *imageBack=[[UIImageView alloc] init];
    imageBack.frame=CGRectMake(0, 0, 320, 255);
    [imageBack setImage:IMAGEWITHNAME(@"image9")];
    [self.view addSubview:imageBack];
    [imageBack release];
    
    
    
    phoneNumberTextField=[[UITextField alloc] init];
    phoneNumberTextField.frame=CGRectMake(95, 0, 200, 44);
    phoneNumberTextField.backgroundColor=[UIColor clearColor];
    phoneNumberTextField.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    phoneNumberTextField.placeholder=@"请输入注册手机号码";
    phoneNumberTextField.clearButtonMode=UITextFieldViewModeWhileEditing;
    phoneNumberTextField.returnKeyType=UIReturnKeyNext;
    //    nameTextField.keyboardType= UIKeyboardTypePhonePad;
    phoneNumberTextField.autocapitalizationType=UITextAutocapitalizationTypeNone; //首字母不大写
    phoneNumberTextField.keyboardType=UIKeyboardTypeNumberPad;
    phoneNumberTextField.autocorrectionType = UITextAutocorrectionTypeNo;// 不执行自动更正单词
    phoneNumberTextField.delegate=self;
    [self.view addSubview:phoneNumberTextField];
    
    codeNumberTextField=[[UITextField alloc] init];
    codeNumberTextField.frame=CGRectMake(95, 44, 200, 44);
    codeNumberTextField.backgroundColor=[UIColor clearColor];
    codeNumberTextField.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    codeNumberTextField.placeholder=@"请输入验证码";
    codeNumberTextField.clearButtonMode=UITextFieldViewModeWhileEditing;
    codeNumberTextField.returnKeyType=UIReturnKeyNext;
    //    nameTextField.keyboardType= UIKeyboardTypePhonePad;
    codeNumberTextField.autocapitalizationType=UITextAutocapitalizationTypeNone; //首字母不大写
    codeNumberTextField.keyboardType=UIKeyboardTypeNumberPad;
    codeNumberTextField.autocorrectionType = UITextAutocorrectionTypeNo;// 不执行自动更正单词
    codeNumberTextField.delegate=self;
    [self.view addSubview:codeNumberTextField];
    
    
    
    
    passwordTextField=[[UITextField alloc] init];
    passwordTextField.frame=CGRectMake(95, 99, 200, 44);
    passwordTextField.backgroundColor=[UIColor clearColor];
    passwordTextField.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    passwordTextField.placeholder=@"请输入你的密码";
    passwordTextField.clearButtonMode=UITextFieldViewModeWhileEditing;
    passwordTextField.returnKeyType=UIReturnKeyDone;
    //    nameTextField.keyboardType= UIKeyboardTypePhonePad;
    passwordTextField.autocapitalizationType=UITextAutocapitalizationTypeNone; //首字母不大写
    //    userNameTextField.keyboardType=UIKeyboardTypeNumberPad;
    passwordTextField.autocorrectionType = UITextAutocorrectionTypeNo;// 不执行自动更正单词
    passwordTextField.delegate=self;
    passwordTextField.secureTextEntry=YES;
    [self.view addSubview:passwordTextField];
    
    
    comfirmTextField=[[UITextField alloc] init];
    comfirmTextField.frame=CGRectMake(95, 143,  200, 44);
    comfirmTextField.backgroundColor=[UIColor clearColor];
    comfirmTextField.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    comfirmTextField.placeholder=@"请确认你的密码";
    comfirmTextField.clearButtonMode=UITextFieldViewModeWhileEditing;
    comfirmTextField.returnKeyType=UIReturnKeyDone;
    comfirmTextField.secureTextEntry=YES;
    //    nameTextField.keyboardType= UIKeyboardTypePhonePad;
    comfirmTextField.autocapitalizationType=UITextAutocapitalizationTypeNone; //首字母不大写
    //    userNameTextField.keyboardType=UIKeyboardTypeNumberPad;
    comfirmTextField.autocorrectionType = UITextAutocorrectionTypeNo;// 不执行自动更正单词
    comfirmTextField.delegate=self;
    [self.view addSubview:comfirmTextField];
    
    
    
    codeLabel2=[[UILabel alloc] init];
    codeLabel2.frame=CGRectMake(30, 203, 170, 40);
    codeLabel2.backgroundColor=[UIColor clearColor];
    codeLabel2.font=[UIFont systemFontOfSize:13];
    codeLabel2.textAlignment=NSTextAlignmentCenter;
    codeLabel2.text=@"点击右侧按钮获取验证码-->";
//    codeLabel2.numberOfLines=2;
//    codeLabel2.text=@"点击获取验证码";
    codeLabel2.textColor=[UIColor lightGrayColor];
    [self.view addSubview:codeLabel2];
    [codeLabel2 release];
    
    
    
    
    
    codeLabel=[[UILabel alloc] init];
    codeLabel.frame=CGRectMake(212, 203, 70, 40);
    codeLabel.backgroundColor=YELLOWCOLOR;
    codeLabel.font=[UIFont systemFontOfSize:13];
    codeLabel.textAlignment=NSTextAlignmentCenter;
    codeLabel.numberOfLines=2;
    codeLabel.text=@"点击获取验证码";
    codeLabel.textColor=[UIColor whiteColor];
    [self.view addSubview:codeLabel];
    [codeLabel release];
    
    
    UIButton *codeButton=[[UIButton alloc]init];
    codeButton.frame=CGRectMake(212, 203, 70, 40);
    codeButton.backgroundColor=[UIColor clearColor];
    [codeButton addTarget:self action:@selector(codeSend) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:codeButton];
    [codeButton release];

    
    
    
    UIButton *button=[[UIButton alloc] init];
    button.frame=CGRectMake(0, 275, 320, 40);
    [button setImage:IMAGEWITHNAME(@"button10") forState:UIControlStateNormal];
     [button addTarget:self action:@selector(commit) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [button release];
    
    
    UIImageView *footerImage=[[UIImageView alloc] init];
    footerImage.frame=CGRectMake(0, 330, 320, 50);
    [footerImage setImage:IMAGEWITHNAME(@"image11")];
    [self.view addSubview:footerImage];
    [footerImage release];
    
    
    
    BOOL isLastTimeRemainTimeNil=[[NSUserDefaults standardUserDefaults] objectForKey:LAST_REMIAN_TIME]==nil;
    
    if (!isLastTimeRemainTimeNil) {
        
        remaintime=[[[NSUserDefaults standardUserDefaults] objectForKey:LAST_REMIAN_TIME] intValue];
    }else{
        
        remaintime=REMAIN_TIME;
    }
    
    
    
    
    timer= [NSTimer scheduledTimerWithTimeInterval:1 target: self selector: @selector(handleTimer:)  userInfo:nil  repeats: YES];
    //    [timer setFireDate:[NSDate distantFuture]];// 暂停定时器
    
    
    
    
    if (remaintime!=REMAIN_TIME) {
        [timer setFireDate:[NSDate date]];
    }else{
        [timer setFireDate:[NSDate distantFuture]];
    }
    
    
    
}

-(void)commit{
    
    
    if ([[StaticFunction trimSpaceInTextField:phoneNumberTextField.text] length]==0) {
        [StaticFunction alertView:self.view msg:phoneNumberTextField.placeholder];
        
        return;
    }
    
    if ([[StaticFunction trimSpaceInTextField:codeNumberTextField.text] length]==0) {
        [StaticFunction alertView:self.view msg:codeNumberTextField.placeholder];
        
        return;
    }
    
    
    if (![[StaticFunction trimSpaceInTextField:codeNumberTextField.text] isEqualToString:codeString]) {
        
        [StaticFunction alertView:self.view msg:@"验证码不正确"];
        
        return;
    }
    
    
    
    
    
    if ([passwordTextField.text length]==0) {
        [StaticFunction alertView:self.view msg:passwordTextField.placeholder];
        
        return;
    }
    
    
    if ([passwordTextField.text length]<6||[passwordTextField.text length]>20) {
        [StaticFunction alertView:self.view msg:@"密码长度为7-19位"];
        
        return;
    }
    
    
    if ([comfirmTextField.text length]==0) {
        [StaticFunction alertView:self.view msg:comfirmTextField.placeholder];
        
        return;
    }
    
    
    if (![comfirmTextField.text isEqualToString:passwordTextField.text]) {
        [StaticFunction alertView:self.view msg:@"两次密码不一致"];
        
        return;
    }
    
    
    
    [self reSetPassAction];
    
    
    
}

-(void)reSetPassAction{
    
    self.httpRequest=[ASIFormDataRequest requestWithURL:[NSURL URLWithString:RESET_PASS_5]];
    [self.httpRequest setDelegate:self];
    [self.httpRequest setRequestMethod:@"POST"];
    [self.httpRequest setDefaultResponseEncoding:NSUTF8StringEncoding];
    [self.httpRequest setPostValue:codeID forKey:@"customer.verifyId"];
    [self.httpRequest setPostValue:codeString forKey:@"customer.verifyCode"];
    [self.httpRequest setPostValue:[StaticFunction trimSpaceInTextField:phoneNumberTextField.text] forKey:@"customer.loginId"];
    
    [self.httpRequest setPostValue:passwordTextField.text forKey:@"customer.password"];
    
    [self.httpRequest setDidStartSelector:@selector(startGetDataR:)];
    [self.httpRequest setDidFinishSelector:@selector(finishGetDataR:)];
    [self.httpRequest setDidFailSelector:@selector(failGetDataR:)];
    [self.httpRequest startAsynchronous];
}
-(void)startGetDataR:(ASIFormDataRequest *)sender{
    [StaticFunction addAlertView:self.view msg:@"密码重置中..."];
    
}
-(void)finishGetDataR:(ASIFormDataRequest *)sender{
    [StaticFunction removeAlertView:self.view];
    
    NSDictionary *data=[HttpRequestDic JsonData:sender];
    
    
    [self reSetTimer];
    
    
    
    if ([HttpRequestDic isOkStatus:data]) {
        
        
        
        
        
        
        
        
        
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"重置密码成功" message:@"请重新登录" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alert show];
        [alert release];
        
        
        
        
    }else{
        
        
        
        [StaticFunction alertView:self.view msg:data[@"msg"]];
        
    }
    
    
}
-(void)failGetDataR:(ASIFormDataRequest *)sender{
    [StaticFunction removeAlertView:self.view];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    
    [self.delegate passUserNameAction:[StaticFunction trimSpaceInTextField:phoneNumberTextField.text]];
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(void)handleTimer:(NSTimer *)sender{
    
    remaintime--;
    
    if (remaintime==0) {
        remaintime=REMAIN_TIME;
        [timer setFireDate:[NSDate distantFuture]];
        
        
        
        codeLabel.backgroundColor=YELLOWCOLOR;
        codeLabel.text=@"点击获取验证码";
        codeLabel2.text=@"点击右侧按钮获取验证码-->";
        
        
        
    }else{
        
        
        codeLabel.backgroundColor=[UIColor grayColor];
        
        
        codeLabel.text=[NSString stringWithFormat:@"%d秒后重新获取",remaintime];
        codeLabel2.text=codeLabel.text;
        
        
    }
}



-(void)showLeft:(UIButton *)sender{
    
    [timer setFireDate:[NSDate distantFuture]];
    
    if (remaintime!=REMAIN_TIME) {
        [[NSUserDefaults standardUserDefaults] setValue:@(remaintime) forKey:LAST_REMIAN_TIME];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
    }else{
        
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:LAST_REMIAN_TIME];
        
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        
    }
    
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    
    
    
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
    
    
}
-(void)codeSend{
    
    
    [self.view endEditing:YES];
    
    
    if (remaintime!=REMAIN_TIME) {
        return;
    }
    
    
    
    
    
    
    if ([[StaticFunction trimSpaceInTextField:phoneNumberTextField.text] length]==0) {
        [StaticFunction alertView:self.view msg:phoneNumberTextField.placeholder];
        
        return;
    }
    
    if (![StaticFunction isMobileNumber:[StaticFunction trimSpaceInTextField:phoneNumberTextField.text]]) {
        [StaticFunction alertView:self.view msg:@"请输入合法的手机号码"];
        
        return;
    }
    
    [timer setFireDate:[NSDate date]];
    
    [self.view endEditing:YES];
    
    
    
    [self getCodeNumber];
    
    
    
}
-(void)getCodeNumber{
    
    
    
    self.httpRequest=[ASIFormDataRequest requestWithURL:[NSURL URLWithString:GETVERIFYCODE_3]];
    [self.httpRequest setDelegate:self];
    [self.httpRequest setRequestMethod:@"POST"];
    [self.httpRequest setDefaultResponseEncoding:NSUTF8StringEncoding];
    [self.httpRequest setPostValue:[StaticFunction trimSpaceInTextField:phoneNumberTextField.text] forKey:@"customer.loginId"];
    
    [self.httpRequest setDidStartSelector:@selector(startGetData:)];
    [self.httpRequest setDidFinishSelector:@selector(finishGetData:)];
    [self.httpRequest setDidFailSelector:@selector(failGetData:)];
    [self.httpRequest startAsynchronous];
    
    
}

-(void)startGetData:(ASIFormDataRequest *)sender{
    
    [StaticFunction addAlertView:self.view msg:@"正在获取验证码..."];
    
}
-(void)finishGetData:(ASIFormDataRequest *)sender{
    [StaticFunction removeAlertView:self.view];
    
    
    
    
    
    NSDictionary *data=[HttpRequestDic JsonData:sender];
    
    
    
    
    
    
    if ([HttpRequestDic isOkStatus:data]) {
        
        
        
        [codeString setString:[NSString stringWithFormat:@"%@",data[@"verifyCode"]]];
        
        [codeID setString:[NSString stringWithFormat:@"%@",data[@"verifyId"]]];
        
        
        
        
        
        
        
    }else{
        
        [self reSetTimer];
        
        [StaticFunction alertView:self.view msg:data[@"msg"]];
        
    }
    
    
}


-(void)failGetData:(ASIFormDataRequest *)sender{
    
    
    
    [StaticFunction removeAlertView:self.view];
    
    
    [self reSetTimer];
    
}
-(void)reSetTimer{
    remaintime=REMAIN_TIME;
    [timer setFireDate:[NSDate distantFuture]];
    
    codeLabel.backgroundColor=YELLOWCOLOR;
    codeLabel.text=@"点击获取验证码";
    codeLabel2.text=@"点击右侧按钮获取验证码-->";
    
    
    
}


-(void)dealloc{
    
    
    
    [phoneNumberTextField release];phoneNumberTextField=nil;
    [codeNumberTextField release];codeNumberTextField=nil;
    
    [passwordTextField release];passwordTextField=nil;
    [comfirmTextField release];comfirmTextField=nil;
    
    [codeString release];codeString=nil;
    [codeID release]; codeID=nil;
    
    
    
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
