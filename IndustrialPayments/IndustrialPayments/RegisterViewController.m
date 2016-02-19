//
//  RegisterViewController.m
//  IndustrialPayments
//
//  Created by May Peach & He Biao on 14-8-29.
//  Copyright (c) 2014年 Hebiao. All rights reserved.
//

#import "RegisterViewController.h"
#import "HeadFile.h"

#import "DCRoundSwitch.h"



#define LAST_REMIAN_TIME  @"last_remain_time_rc"

#define REMAIN_TIME  60

@interface RegisterViewController ()

@end

@implementation RegisterViewController

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
    self.title=@"手机注册";
    [self createBarLeftWithImage:@"bar3"];
    
    
    registerFlag=1;
    
    
    codeString=[[NSMutableString alloc] init];
    [codeString setString:@"!@#$%^&*("];
    
    codeID=[[NSMutableString alloc] init];
    [codeID setString:@"0000"];

    
//    [self createBackBar];
    
    [self createTitleButton];
    
    [self createBackImageView];
    
    
    [self createTextFields];
    
    
    
}

-(void)createTextFields{
    
    
    phoneNumberTextField=[[UITextField alloc] init];
    phoneNumberTextField.frame=CGRectMake(95, 38, 200, 44);
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
    
    
    passwordTextField=[[UITextField alloc] init];
    passwordTextField.frame=CGRectMake(95, 44+38, 150, 44);
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
    
    codeNumberTextField=[[UITextField alloc] init];
    codeNumberTextField.frame=CGRectMake(95, 99+38, 200, 44);
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
    
    
    
    
    
    codeLabel2=[[UILabel alloc] init];
    codeLabel2.frame=CGRectMake(30, 203-15, 170, 40);
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
    codeLabel.frame=CGRectMake(212, 203-15, 70, 40);
    codeLabel.backgroundColor=YELLOWCOLOR;
    codeLabel.font=[UIFont systemFontOfSize:13];
    codeLabel.textAlignment=NSTextAlignmentCenter;
    codeLabel.numberOfLines=2;
    codeLabel.text=@"点击获取验证码";
    codeLabel.textColor=[UIColor whiteColor];
    [self.view addSubview:codeLabel];
    [codeLabel release];
    
    
     codeButton=[[UIButton alloc]init];
    codeButton.frame=CGRectMake(212, 203-15, 70, 40);
    codeButton.backgroundColor=[UIColor clearColor];
    [codeButton addTarget:self action:@selector(codeSend) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:codeButton];
    [codeButton release];
    
    
    
    roundSwitch1=[[DCRoundSwitch alloc] initWithFrame:CGRectMake(250,  44+40+5, 60, 30)];
    roundSwitch1.onTintColor=RGBA(36, 138, 190, 1);
    roundSwitch1.onText=@"开";//
    roundSwitch1.offText=@"关";
    [roundSwitch1 setOn:NO];
    [roundSwitch1 addTarget:self action:@selector(change1:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:roundSwitch1];
    [roundSwitch1 release];


    
    
   
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
    
    
    
    
    
    
    
    
    
    
    emailTextField=[[UITextField alloc] init];
    emailTextField.frame=CGRectMake(95, 66, 200, 44);
    emailTextField.backgroundColor=[UIColor clearColor];
    emailTextField.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    emailTextField.placeholder=@"请输入注册邮箱";
    emailTextField.clearButtonMode=UITextFieldViewModeWhileEditing;
    emailTextField.returnKeyType=UIReturnKeyNext;
    emailTextField.keyboardType= UIKeyboardTypeEmailAddress;
    emailTextField.autocapitalizationType=UITextAutocapitalizationTypeNone; //首字母不大写
//    emailTextField.keyboardType=UIKeyboardTypeNumberPad;
    emailTextField.autocorrectionType = UITextAutocorrectionTypeNo;// 不执行自动更正单词
    emailTextField.delegate=self;
    [self.view addSubview:emailTextField];
    emailTextField.hidden=YES;
    
    
    
    
    emailPassTextField=[[UITextField alloc] init];
     emailPassTextField.frame=CGRectMake(95, 44+66, 150, 44);
    emailPassTextField.backgroundColor=[UIColor clearColor];
    emailPassTextField.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
   emailPassTextField.placeholder=@"请输入你的密码";
    emailPassTextField.clearButtonMode=UITextFieldViewModeWhileEditing;
    emailPassTextField.returnKeyType=UIReturnKeyNext;
    emailPassTextField.keyboardType= UIKeyboardTypeEmailAddress;
    emailPassTextField.autocapitalizationType=UITextAutocapitalizationTypeNone; //首字母不大写
//    emailPassTextField.keyboardType=UIKeyboardTypeNumberPad;
    emailPassTextField.autocorrectionType = UITextAutocorrectionTypeNo;// 不执行自动更正单词
    emailPassTextField.delegate=self;
    emailPassTextField.secureTextEntry=YES;
    [self.view addSubview:emailPassTextField];
    emailPassTextField.hidden=YES;
    
    
    
    
    roundSwitch2=[[DCRoundSwitch alloc] initWithFrame:CGRectMake(250, 44+66+5, 60, 30)];
    roundSwitch2.onTintColor=RGBA(36, 138, 190, 1);
    roundSwitch2.onText=@"开";//
    roundSwitch2.offText=@"关";
    [roundSwitch2 setOn:NO];
    [roundSwitch2 addTarget:self action:@selector(change2:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:roundSwitch2];
    roundSwitch2.hidden=YES;
    [roundSwitch2 release];
    

    
    
}

-(void)change1:(DCRoundSwitch *)sender{
    
//    NSLog(@"%d  ====  ",sender.isOn);
    
    if (sender.isOn) {
        passwordTextField.userInteractionEnabled=NO;
        passwordTextField.secureTextEntry=NO;
        passwordTextField.userInteractionEnabled=YES;
        
    }else{
        passwordTextField.userInteractionEnabled=NO;
        passwordTextField.secureTextEntry=YES;
        passwordTextField.userInteractionEnabled=YES;
    }
    
}
-(void)change2:(DCRoundSwitch *)sender{
    
    if (sender.isOn) {
        emailPassTextField.userInteractionEnabled=NO;
        emailPassTextField.secureTextEntry=NO;
        emailPassTextField.userInteractionEnabled=YES;
        
    }else{
        emailPassTextField.userInteractionEnabled=NO;
        emailPassTextField.secureTextEntry=YES;
        emailPassTextField.userInteractionEnabled=YES;
    }

    
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
    
    
    
    
   
    
    
    [self registerAction];
    
}

-(void)registerAction{
    
    self.httpRequest=[ASIFormDataRequest requestWithURL:[NSURL URLWithString:RIGSTER_USER_4]];
    [self.httpRequest setDelegate:self];
    [self.httpRequest setRequestMethod:@"POST"];
    [self.httpRequest setDefaultResponseEncoding:NSUTF8StringEncoding];
    [self.httpRequest setPostValue:codeID forKey:@"customer.verifyId"];
    [self.httpRequest setPostValue:codeString forKey:@"customer.verifyCode"];
    [self.httpRequest setPostValue:[StaticFunction trimSpaceInTextField:phoneNumberTextField.text] forKey:@"customer.loginId"];
    [self.httpRequest setPostValue:@"" forKey:@"customer.realName"];
    [self.httpRequest setPostValue:passwordTextField.text forKey:@"customer.password"];
    [self.httpRequest setPostValue:@"0" forKey:@"customer.userType"];
    [self.httpRequest setDidStartSelector:@selector(startGetDataR:)];
    [self.httpRequest setDidFinishSelector:@selector(finishGetDataR:)];
    [self.httpRequest setDidFailSelector:@selector(failGetDataR:)];
    [self.httpRequest startAsynchronous];
}
-(void)startGetDataR:(ASIFormDataRequest *)sender{
    [StaticFunction addAlertView:self.view msg:@"注册中..."];
    
}
-(void)finishGetDataR:(ASIFormDataRequest *)sender{
    [StaticFunction removeAlertView:self.view];
    
    NSDictionary *data=[HttpRequestDic JsonData:sender];
    
    
    [self reSetTimer];
    
    
    
    if ([HttpRequestDic isOkStatus:data]) {
        
        
        
        
        
        
        [self.delegate passUserNameAction:[StaticFunction trimSpaceInTextField:phoneNumberTextField.text]];
        
        
        [self.navigationController popViewControllerAnimated:YES];
        
        
        
        
        
        
        
    }else{
        
        
        
        [StaticFunction alertView:self.view msg:data[@"msg"]];
        
    }
    
    
}
-(void)failGetDataR:(ASIFormDataRequest *)sender{
    [StaticFunction removeAlertView:self.view];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    
    
    
    return YES;
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



-(void)createTitleButton{
    
    button1=[[UIButton alloc] init];
    button1.frame=CGRectMake(0, 0, 160, 38);
    [button1 setImage:IMAGEWITHNAME(@"button13") forState:UIControlStateNormal];
    [button1 setImage:IMAGEWITHNAME(@"button13") forState:UIControlStateHighlighted];
    button1.tag=1;
    [button1 addTarget:self action:@selector(butAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    [button1 release];
    
    
    button2=[[UIButton alloc] init];
    button2.frame=CGRectMake(160, 0, 160, 38);
    [button2 setImage:IMAGEWITHNAME(@"button14") forState:UIControlStateNormal];
    [button2 setImage:IMAGEWITHNAME(@"button14") forState:UIControlStateHighlighted];
    button2.tag=2;
    [button2 addTarget:self action:@selector(butAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    [button2 release];

    
    
    
    
    commitButton=[[UIButton alloc] init];
    commitButton.frame=CGRectMake(0, 240+30, 320, 40);
    [commitButton setImage:IMAGEWITHNAME(@"button15") forState:UIControlStateNormal];
    [commitButton addTarget:self action:@selector(commitAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:commitButton];
    [commitButton release];
    
    
    
}

-(void)butAction:(UIButton *)sender{
    
    
    registerFlag=sender.tag;
    
    
    
    if (sender.tag==1) {
        [button1 setImage:IMAGEWITHNAME(@"button13") forState:UIControlStateNormal];
        [button1 setImage:IMAGEWITHNAME(@"button13") forState:UIControlStateHighlighted];
        
        [button2 setImage:IMAGEWITHNAME(@"button14") forState:UIControlStateNormal];
        [button2 setImage:IMAGEWITHNAME(@"button14") forState:UIControlStateHighlighted];
        
        backImageView.frame=CGRectMake(0, 38, 320, 200);
        [backImageView setImage:IMAGEWITHNAME(@"image12")];
        commitButton.frame=CGRectMake(0, 240+30, 320, 40);
        
        
        phoneNumberTextField.hidden=NO;
        passwordTextField.hidden=NO;
        codeNumberTextField.hidden=NO;
        codeLabel.hidden=NO;
        codeLabel2.hidden=NO;
        codeButton.hidden=NO;
        roundSwitch1.hidden=NO;
        
        
        
        
         emailTextField.hidden=YES;
        emailPassTextField.hidden=YES;
        
        
    }else if (sender.tag==2){
        [button1 setImage:IMAGEWITHNAME(@"button16") forState:UIControlStateNormal];
        [button1 setImage:IMAGEWITHNAME(@"button16") forState:UIControlStateHighlighted];
        
        [button2 setImage:IMAGEWITHNAME(@"button17") forState:UIControlStateNormal];
        [button2 setImage:IMAGEWITHNAME(@"button17") forState:UIControlStateHighlighted];

        backImageView.frame=CGRectMake(0, 38, 320, 150);
        [backImageView setImage:IMAGEWITHNAME(@"image18")];
        
        commitButton.frame=CGRectMake(0, 190+30, 320, 40);
        
        
        
        
        phoneNumberTextField.hidden=YES;
        passwordTextField.hidden=YES;
        codeNumberTextField.hidden=YES;
        codeLabel.hidden=YES;
        codeLabel2.hidden=YES;
        codeButton.hidden=YES;
         roundSwitch1.hidden=YES;
        
        
        
         emailTextField.hidden=NO;
        emailPassTextField.hidden=NO;
    }
}

-(void)createBackImageView{
    
    
    backImageView=[[UIImageView alloc] init];
    backImageView.frame=CGRectMake(0, 38, 320, 200);
    [backImageView setImage:IMAGEWITHNAME(@"image12")];
    [self.view addSubview:backImageView];
    [backImageView release];
    
    
}




-(void)commitAction{
    
    if (registerFlag==1) {
        [self commit];
    }else if (registerFlag==2){
        
        [self emailRegister];
    }
}


-(void)emailRegister{
    
    [self.view endEditing:YES];
    
    
    
    if ([[StaticFunction trimSpaceInTextField:emailTextField.text] length]==0) {
        
        [StaticFunction alertView:self.view msg:emailTextField.placeholder];
        return;
    }
    
    
    if (![StaticFunction isValidateEmail:emailTextField.text]) {
        
        [StaticFunction alertView:self.view msg:@"请输入合法的邮箱"];
        return;
    }
    
    if ([emailPassTextField.text length]==0) {
        
        [StaticFunction alertView:self.view msg:emailPassTextField.placeholder];
        return;
    }
    
    
    [self doEmailHttp];
    
    
}

-(void)doEmailHttp{
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    
    
}
-(void)createBackBar{
    
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:[[UIImage imageNamed:@"bar3"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 44, 0, 0)]
                                                      forState:UIControlStateNormal
                                                    barMetrics:UIBarMetricsDefault];
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:
     @{ UITextAttributeFont:[UIFont systemFontOfSize:17],
        UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetZero],UITextAttributeTextColor: [UIColor clearColor]} forState:UIControlStateNormal];
    
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:
     @{ UITextAttributeFont:[UIFont systemFontOfSize:17],
        UITextAttributeTextShadowOffset:[NSValue valueWithUIOffset:UIOffsetZero],UITextAttributeTextColor:[UIColor clearColor]} forState:UIControlStateHighlighted];
}


-(void)dealloc{
    
    [phoneNumberTextField release];phoneNumberTextField=nil;
    [codeNumberTextField release];codeNumberTextField=nil;
    [passwordTextField release];passwordTextField =nil;
    
    [emailTextField release];emailTextField=nil;
    [emailPassTextField release];emailPassTextField=nil;
    
    
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
