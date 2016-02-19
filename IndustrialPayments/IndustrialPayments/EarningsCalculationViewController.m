//
//  EarningsCalculationViewController.m
//  IndustrialPayments
//
//  Created by May Peach & He Biao on 14-9-3.
//  Copyright (c) 2014年 Hebiao. All rights reserved.
//

#import "EarningsCalculationViewController.h"
#import "HeadFile.h"

#import "CalculateView.h"


@interface EarningsCalculationViewController ()

@end

@implementation EarningsCalculationViewController

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
    self.title=@"收益计算";
    [self createTitleButton];
    
    
    
    timeType=1;
    
    
    
    
    mainScroll=[[UIScrollView alloc] init];
    mainScroll.frame=CGRectMake(0, 37.5,320, 416+(isIPhone5?88:0)-37.5);
    mainScroll.contentSize=CGSizeMake(320*2, 416+(isIPhone5?88:0)-37.5);
    mainScroll.backgroundColor=[UIColor clearColor];
    mainScroll.pagingEnabled=YES;
    mainScroll.delegate=self;
    mainScroll.showsHorizontalScrollIndicator=NO;
    mainScroll.directionalLockEnabled=YES;
    mainScroll.tag=1234;
    [self.view addSubview:mainScroll];
    [mainScroll release];

    
    
    
    UIImageView *back1Image=[[UIImageView alloc] init];
    back1Image.frame=CGRectMake(0, 0, 320, 290);
    [back1Image setImage:IMAGEWITHNAME(@"image24")];
    [mainScroll addSubview:back1Image];
    [back1Image release];
    
    
   
    
    
    UIButton *but1=[[UIButton alloc] init];
    but1.frame=CGRectMake(0, 310, 160, 50);
    but1.tag=1;
    [but1 setImage:IMAGEWITHNAME(@"button26") forState:UIControlStateNormal];
    [but1 addTarget:self action:@selector(reSet:) forControlEvents:UIControlEventTouchUpInside];
    [mainScroll addSubview:but1];
    [but1 release];
    
    
    
    UIButton *but2=[[UIButton alloc] init];
    but2.frame=CGRectMake(160, 310, 160, 50);
    but2.tag=1;
    [but2 setImage:IMAGEWITHNAME(@"button27") forState:UIControlStateNormal];
    [but2 addTarget:self action:@selector(calculateAction:) forControlEvents:UIControlEventTouchUpInside];
    [mainScroll addSubview:but2];
    [but2 release];
    
    
    
    textField1Moneny=[[UITextField alloc] init];
    textField1Moneny.frame=CGRectMake(85, 41, 185, 31);
    textField1Moneny.backgroundColor=[UIColor clearColor];
    textField1Moneny.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    textField1Moneny.placeholder=@"请输入票面金额";
    textField1Moneny.clearButtonMode=UITextFieldViewModeWhileEditing;
    textField1Moneny.returnKeyType=UIReturnKeyNext;
    textField1Moneny.keyboardType= UIKeyboardTypeDecimalPad;
    textField1Moneny.autocapitalizationType=UITextAutocapitalizationTypeNone; //首字母不大写
    //    emailTextField.keyboardType=UIKeyboardTypeNumberPad;
    textField1Moneny.autocorrectionType = UITextAutocorrectionTypeNo;// 不执行自动更正单词
    textField1Moneny.delegate=self;
    [mainScroll addSubview:textField1Moneny];
  
    
    
    
    
    
    
    textField1Rate=[[UITextField alloc] init];
    textField1Rate.frame=CGRectMake(85, 84, 185, 31);
    textField1Rate.backgroundColor=[UIColor clearColor];
    textField1Rate.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    textField1Rate.placeholder=@"请输入年化利率";
    textField1Rate.clearButtonMode=UITextFieldViewModeWhileEditing;
    textField1Rate.returnKeyType=UIReturnKeyNext;
    textField1Rate.keyboardType= UIKeyboardTypeDecimalPad;
    textField1Rate.autocapitalizationType=UITextAutocapitalizationTypeNone; //首字母不大写
    //    emailTextField.keyboardType=UIKeyboardTypeNumberPad;
    textField1Rate.autocorrectionType = UITextAutocorrectionTypeNo;// 不执行自动更正单词
    textField1Rate.delegate=self;
    [mainScroll addSubview:textField1Rate];
    

    
    
    textField1StartTime=[[UITextField alloc] init];
    textField1StartTime.frame=CGRectMake(85, 127, 185, 31);
    textField1StartTime.backgroundColor=[UIColor clearColor];
    textField1StartTime.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    textField1StartTime.placeholder=@"请选择贴现时间";
    textField1StartTime.clearButtonMode=UITextFieldViewModeWhileEditing;
    textField1StartTime.returnKeyType=UIReturnKeyNext;
    textField1StartTime.keyboardType= UIKeyboardTypeDecimalPad;
    textField1StartTime.autocapitalizationType=UITextAutocapitalizationTypeNone; //首字母不大写
    //    emailTextField.keyboardType=UIKeyboardTypeNumberPad;
    textField1StartTime.autocorrectionType = UITextAutocorrectionTypeNo;// 不执行自动更正单词
    textField1StartTime.delegate=self;
    [mainScroll addSubview:textField1StartTime];
    textField1StartTime.userInteractionEnabled=NO;
    
    UIButton *selectButton1=[[UIButton alloc] init];
    selectButton1.frame=CGRectMake(85, 127, 185, 31);
    selectButton1.tag=1;
    selectButton1.backgroundColor=[UIColor clearColor];
    [selectButton1 addTarget:self action:@selector(seleTime:) forControlEvents:UIControlEventTouchUpInside];
    [mainScroll addSubview:selectButton1];
    [selectButton1 release];
    
    
    
    
    textField1EndTime=[[UITextField alloc] init];
    textField1EndTime.frame=CGRectMake(85, 170, 185, 31);
    textField1EndTime.backgroundColor=[UIColor clearColor];
    textField1EndTime.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    textField1EndTime.placeholder=@"请选择到期时间";
    textField1EndTime.clearButtonMode=UITextFieldViewModeWhileEditing;
    textField1EndTime.returnKeyType=UIReturnKeyNext;
    textField1EndTime.keyboardType= UIKeyboardTypeDecimalPad;
    textField1EndTime.autocapitalizationType=UITextAutocapitalizationTypeNone; //首字母不大写
    //    emailTextField.keyboardType=UIKeyboardTypeNumberPad;
    textField1EndTime.autocorrectionType = UITextAutocorrectionTypeNo;// 不执行自动更正单词
    textField1EndTime.delegate=self;
    [mainScroll addSubview:textField1EndTime];
    textField1EndTime.userInteractionEnabled=NO;
    
    UIButton *selectButton2=[[UIButton alloc] init];
    selectButton2.frame=CGRectMake(85, 170, 185, 31);
    selectButton2.tag=2;
    selectButton2.backgroundColor=[UIColor clearColor];
    [selectButton2 addTarget:self action:@selector(seleTime:) forControlEvents:UIControlEventTouchUpInside];
    [mainScroll addSubview:selectButton2];
    [selectButton2 release];
    

    
    textField1Day=[[UITextField alloc] init];
    textField1Day.frame=CGRectMake(85, 212, 185, 31);
    textField1Day.backgroundColor=[UIColor clearColor];
    textField1Day.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    textField1Day.placeholder=@"请输入调整天数";
    textField1Day.clearButtonMode=UITextFieldViewModeWhileEditing;
    textField1Day.returnKeyType=UIReturnKeyNext;
    textField1Day.keyboardType= UIKeyboardTypeDecimalPad;
    textField1Day.autocapitalizationType=UITextAutocapitalizationTypeNone; //首字母不大写
    //    emailTextField.keyboardType=UIKeyboardTypeNumberPad;
    textField1Day.autocorrectionType = UITextAutocorrectionTypeNo;// 不执行自动更正单词
    textField1Day.delegate=self;
    [mainScroll addSubview:textField1Day];


    
    
    
    
    UIImageView *back2Image=[[UIImageView alloc] init];
    back2Image.frame=CGRectMake(320, 0, 320, 250);
    [back2Image setImage:IMAGEWITHNAME(@"image25")];
    [mainScroll addSubview:back2Image];
    [back2Image release];
    
    
    
    textField2Moneny=[[UITextField alloc] init];
    textField2Moneny.frame=CGRectMake(85+320, 50, 185, 31);
    textField2Moneny.backgroundColor=[UIColor clearColor];
    textField2Moneny.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    textField2Moneny.placeholder=@"请输入票面金额";
    textField2Moneny.clearButtonMode=UITextFieldViewModeWhileEditing;
    textField2Moneny.returnKeyType=UIReturnKeyNext;
    textField2Moneny.keyboardType= UIKeyboardTypeDecimalPad;
    textField2Moneny.autocapitalizationType=UITextAutocapitalizationTypeNone; //首字母不大写
    //    emailTextField.keyboardType=UIKeyboardTypeNumberPad;
    textField2Moneny.autocorrectionType = UITextAutocorrectionTypeNo;// 不执行自动更正单词
    textField2Moneny.delegate=self;
    [mainScroll addSubview:textField2Moneny];
    
    
    
    
    
    
    
    textField2Rate=[[UITextField alloc] init];
    textField2Rate.frame=CGRectMake(85+320, 93, 185, 31);
    textField2Rate.backgroundColor=[UIColor clearColor];
    textField2Rate.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    textField2Rate.placeholder=@"请输入年化利率";
    textField2Rate.clearButtonMode=UITextFieldViewModeWhileEditing;
    textField2Rate.returnKeyType=UIReturnKeyNext;
    textField2Rate.keyboardType= UIKeyboardTypeDecimalPad;
    textField2Rate.autocapitalizationType=UITextAutocapitalizationTypeNone; //首字母不大写
    //    emailTextField.keyboardType=UIKeyboardTypeNumberPad;
    textField2Rate.autocorrectionType = UITextAutocorrectionTypeNo;// 不执行自动更正单词
    textField2Rate.delegate=self;
    [mainScroll addSubview:textField2Rate];
    
    
    
    
    textField2StartTime=[[UITextField alloc] init];
    textField2StartTime.frame=CGRectMake(85+320, 135, 185, 31);
    textField2StartTime.backgroundColor=[UIColor clearColor];
    textField2StartTime.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    textField2StartTime.placeholder=@"请选择贴现时间";
    textField2StartTime.clearButtonMode=UITextFieldViewModeWhileEditing;
    textField2StartTime.returnKeyType=UIReturnKeyNext;
    textField2StartTime.keyboardType= UIKeyboardTypeDecimalPad;
    textField2StartTime.autocapitalizationType=UITextAutocapitalizationTypeNone; //首字母不大写
    //    emailTextField.keyboardType=UIKeyboardTypeNumberPad;
    textField2StartTime.autocorrectionType = UITextAutocorrectionTypeNo;// 不执行自动更正单词
    textField2StartTime.delegate=self;
    [mainScroll addSubview:textField2StartTime];
    textField2StartTime.userInteractionEnabled=NO;
    
    UIButton *selectButton3=[[UIButton alloc] init];
    selectButton3.frame=CGRectMake(85+320, 135, 185, 31);
    selectButton3.tag=3;
    selectButton3.backgroundColor=[UIColor clearColor];
    [selectButton3 addTarget:self action:@selector(seleTime:) forControlEvents:UIControlEventTouchUpInside];
    [mainScroll addSubview:selectButton3];
    [selectButton3 release];
    
    
    
    textField2EndTime=[[UITextField alloc] init];
    textField2EndTime.frame=CGRectMake(85+320, 178, 185, 31);
    textField2EndTime.backgroundColor=[UIColor clearColor];
    textField2EndTime.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    textField2EndTime.placeholder=@"请选择到期时间";
    textField2EndTime.clearButtonMode=UITextFieldViewModeWhileEditing;
    textField2EndTime.returnKeyType=UIReturnKeyNext;
    textField2EndTime.keyboardType= UIKeyboardTypeDecimalPad;
    textField2EndTime.autocapitalizationType=UITextAutocapitalizationTypeNone; //首字母不大写
    //    emailTextField.keyboardType=UIKeyboardTypeNumberPad;
    textField2EndTime.autocorrectionType = UITextAutocorrectionTypeNo;// 不执行自动更正单词
    textField2EndTime.delegate=self;
    [mainScroll addSubview:textField2EndTime];
    textField2EndTime.userInteractionEnabled=NO;
    
    UIButton *selectButton4=[[UIButton alloc] init];
    selectButton4.frame=CGRectMake(85+320, 178, 185, 31);
    selectButton4.tag=4;
    selectButton4.backgroundColor=[UIColor clearColor];
    [selectButton4 addTarget:self action:@selector(seleTime:) forControlEvents:UIControlEventTouchUpInside];
    [mainScroll addSubview:selectButton4];
    [selectButton4 release];
    

    
    
    UIButton *but3=[[UIButton alloc] init];
    but3.frame=CGRectMake(320, 310, 160, 50);
    but3.tag=2;
    [but3 setImage:IMAGEWITHNAME(@"button26") forState:UIControlStateNormal];
    [but3 addTarget:self action:@selector(reSet:) forControlEvents:UIControlEventTouchUpInside];
    [mainScroll addSubview:but3];
    [but3 release];
    
    
    
    UIButton *but4=[[UIButton alloc] init];
    but4.frame=CGRectMake(160+320, 310, 160, 50);
    but4.tag=2;
    [but4 setImage:IMAGEWITHNAME(@"button27") forState:UIControlStateNormal];
    [but4 addTarget:self action:@selector(calculateAction:) forControlEvents:UIControlEventTouchUpInside];
    [mainScroll addSubview:but4];
    [but4 release];


    
    
    
    datePickView=[[DatePickView alloc] init];
    datePickView.delegate=self;
    [self.view addSubview:datePickView];
    datePickView.hidden=YES;

    
    
    calculateView=[[CalculateView alloc] init];
    [self.view addSubview:calculateView];
    calculateView.hidden=YES;
    
    
}

-(void)seleTime:(UIButton *)sender{
    
    [self.view endEditing:YES];
    
    timeType=sender.tag;
    
    datePickView.hidden=NO;
    
    calculateView.hidden=YES;
    
    
    
    
}
-(void)datePickViewDidDateSelect:(NSString *)dateString{
    
    if (timeType==1) {
        
        textField1StartTime.text=dateString;
        
        
    }else if (timeType==2){
        
        textField1EndTime.text=dateString;
        
    }else if (timeType==3){
        textField2StartTime.text=dateString;

        
    }else if (timeType==4){
        
        textField2EndTime.text=dateString;
        
    }
    
}


-(void)reSet:(UIButton *)sender{
    
    if (sender.tag==1) {
        textField1Moneny.text=@"";
        textField1Rate.text=@"";
        textField1StartTime.text=@"";
        textField1EndTime.text=@"";
        textField1Day.text=@"";
        
        
    }else if (sender.tag==2){
        
        textField2Moneny.text=@"";
        textField2Rate.text=@"";
        textField2StartTime.text=@"";
        textField2EndTime.text=@"";
       

        
    }
    
}
-(void)calculateAction:(UIButton *)sender{
    if (sender.tag==1) {
        [self calculate1];
        
        
    }else if (sender.tag==2){
        
       [self calculate2];
        
        
        
    }
}

-(void)calculate1{
    
}
-(void)calculate2{
    
    
    datePickView.hidden=YES;
    [self.view endEditing:YES];
    
    
    
    if ([[StaticFunction trimSpaceInTextField:textField2Moneny.text] length]==0) {
        
        [StaticFunction alertView:self.view msg:textField2Moneny.placeholder];
        
        return;
    }
    
    
    if ([[StaticFunction trimSpaceInTextField:textField2Rate.text] length]==0) {
        
        [StaticFunction alertView:self.view msg:textField2Rate.placeholder];
        
        return;
    }
    
    
    if ([[StaticFunction trimSpaceInTextField:textField2StartTime.text] length]==0) {
        
        [StaticFunction alertView:self.view msg:textField2StartTime.placeholder];
        
        return;
    }
    
    
    if ([[StaticFunction trimSpaceInTextField:textField2EndTime.text] length]==0) {
        
        [StaticFunction alertView:self.view msg:textField2EndTime.placeholder];
        
        return;
    }
    
    
    NSComparisonResult c= [[self dateFromString:textField2EndTime.text] compare:[self dateFromString:textField2StartTime.text]];
    
    
    
    
    if (c!=NSOrderedDescending) {
        
        
        [StaticFunction alertView:self.view msg:@"到期时间晚于投资时间"];
        return;
    }
    
    
    
//    [self doCalculateAction];
    
    [self doCalculateAction2];
    
    
    
}
- (NSDate *)dateFromString:(NSString *)dateString{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat: @"yyyy-MM-dd"];
    
    
    
    
    
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    
    
    
    
    
    [dateFormatter release];
    
    return destDate;
    
}
-(void)doCalculateAction2{
    
    
    self.httpRequest=[ASIFormDataRequest requestWithURL:[NSURL URLWithString:INCOMECALCULATOR_8]];
    [self.httpRequest setDelegate:self];
    [self.httpRequest setRequestMethod:@"POST"];
    [self.httpRequest setDefaultResponseEncoding:NSUTF8StringEncoding];
    [self.httpRequest setPostValue:[StaticFunction trimSpaceInTextField:textField2Moneny.text] forKey:@"calc.amount"];
    [self.httpRequest setPostValue:[StaticFunction trimSpaceInTextField:textField2Rate.text] forKey:@"calc.rate"];
    [self.httpRequest setPostValue:textField2StartTime.text forKey:@"calc.beginDate"];
    [self.httpRequest setPostValue:textField2EndTime.text forKey:@"calc.endDate"];
    
    [self.httpRequest setDidStartSelector:@selector(startGetData2:)];
    [self.httpRequest setDidFinishSelector:@selector(finishGetData2:)];
    [self.httpRequest setDidFailSelector:@selector(failGetData2:)];
    [self.httpRequest startAsynchronous];
    
    
}

-(void)startGetData2:(ASIFormDataRequest *)sender{
    
    [StaticFunction addAlertView:self.view msg:@"计算中,请稍后..."];
    
    
    
}
-(void)finishGetData2:(ASIFormDataRequest *)sender{
    [StaticFunction removeAlertView:self.view];
    
    
    
    
    
    
    
    NSDictionary *data=[HttpRequestDic JsonData:sender];
    
    
    
    
    if ([HttpRequestDic isOkStatus:data]) {
        
        
        
        
        
        //        [[NSUserDefaults standardUserDefaults] setValue:dic forKey:LEADER_CONTACT_DATA];
        //        [[NSUserDefaults standardUserDefaults] synchronize];
        
        [calculateView setMoneyLabelText:[NSString stringWithFormat:@"%@元",data[@"profit"]]];
        [calculateView setDayLabelText:[NSString stringWithFormat:@"%@天",data[@"profitDay"]]];
        
        calculateView.hidden=NO;
        
        
       

        
        
        
        
        
    }else{
        
        
        //        NSDictionary *dic=[[NSUserDefaults standardUserDefaults] objectForKey:LEADER_CONTACT_DATA];
        //        [mutableDic setDictionary:dic];
        //        [table reloadData];
        
        
        [StaticFunction alertView:self.view msg:data[@"msg"]];
        
    }
    
    
    
}
-(void)failGetData2:(ASIFormDataRequest *)sender{
    
    [StaticFunction removeAlertView:self.view];
    
    //    NSDictionary *dic=[[NSUserDefaults standardUserDefaults] objectForKey:LEADER_CONTACT_DATA];
    //    [mutableDic setDictionary:dic];
    //    [table reloadData];
    
    
    
}





-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
    
    datePickView.hidden=YES;
    calculateView.hidden=YES;
    
    
    
    
    int x=  (int)scrollView.contentOffset.x;
    
    if (x==0) {
        [self changeButton:1];
    }else if (x==320){
        [self changeButton:2];
    }
    
    

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    
//    NSLog(@"---------");
    
    
}

-(void)createTitleButton{
    button1=[[UIButton alloc] init];
    button1.frame=CGRectMake(0, 0, 160, 37.5);
    [button1 setImage:IMAGEWITHNAME(@"button20") forState:UIControlStateNormal];
    [button1 setImage:IMAGEWITHNAME(@"button20") forState:UIControlStateHighlighted];
    button1.tag=1;
    [button1 addTarget:self action:@selector(butAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    [button1 release];
    
    button2=[[UIButton alloc] init];
    button2.frame=CGRectMake(160, 0, 160, 37.5);
    [button2 setImage:IMAGEWITHNAME(@"button21") forState:UIControlStateNormal];
    [button2 setImage:IMAGEWITHNAME(@"button21") forState:UIControlStateHighlighted];
    button2.tag=2;
    [button2 addTarget:self action:@selector(butAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    [button2 release];
    

    
}

-(void)butAction:(UIButton *)sender{
    
    
    [self changeButton:sender.tag];
    
     [mainScroll setContentOffset:CGPointMake((sender.tag-1)*320, 0) animated:NO];
   
}

-(void)changeButton:(NSInteger )index{
    
    
    [button1 setImage:IMAGEWITHNAME(index==1?@"button20":@"button22") forState:UIControlStateNormal];
    [button1 setImage:IMAGEWITHNAME(index==1?@"button20":@"button22") forState:UIControlStateHighlighted];
    
    [button2 setImage:IMAGEWITHNAME(index==2?@"button23":@"button21") forState:UIControlStateNormal];
    [button2 setImage:IMAGEWITHNAME(index==2?@"button23":@"button21") forState:UIControlStateHighlighted];
    
    
    
}

-(void)dealloc{
    
    
    [datePickView release];datePickView=nil;
    
    
    [calculateView release];calculateView=nil;
    
    
    
    
    
    
    
    
    
    
    
    
    [textField1Moneny release];textField1Moneny=nil;
    [textField1Rate release];textField1Rate=nil;
    [textField1StartTime release];textField1StartTime=nil;
    [textField1EndTime release];textField1EndTime=nil;
    [textField1Day release];textField1Day=nil;
    [textField2Moneny release];textField2Moneny=nil;
    [textField2Rate release];textField2Rate=nil;
    [textField2StartTime release];textField2StartTime=nil;
    [textField2EndTime release];textField2EndTime=nil;
    
    
    

    
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
