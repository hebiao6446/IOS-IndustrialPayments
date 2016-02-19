//
//  ViewController.m
//  IndustrialPayments
//
//  Created by May Peach & He Biao on 14-8-28.
//  Copyright (c) 2014年 Hebiao. All rights reserved.
//

#import "ViewController.h"

#import "HeadFile.h"

#import "LoginViewController.h"

#import "ManagerCenterViewController.h"


#import "ProductDetailViewController.h"





#import "IphoneView1.h"
#import "IphoneView2.h"
#import "IphoneView3.h"


#define VIEW_DURATION 0.7










@interface ViewController ()

@end

@implementation ViewController



-(void)postNoticeEverySecond:(NSTimer *)sender{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTICE_CHANGE_REMAIN_TIME object:nil];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    self.title=@"工业支付";
    
    
    
    [NSTimer scheduledTimerWithTimeInterval:1 target: self selector: @selector(postNoticeEverySecond:)  userInfo:nil  repeats: YES];
    
    
    currenPage=1;
    
    
    
    UIView *v=[[UIView alloc] init];
    v.frame=CGRectMake(0, 0, 320, 416+(isIPhone5?88:0));
    v.backgroundColor=[UIColor clearColor];
    
    [self.view addSubview:v];
    [v release];
    
    
    
    
    
    iphoneView1=[[IphoneView1 alloc] init];
    iphoneView1.gesterDelegate=self;
    iphoneView1.buttonDelegate=self;
    [v addSubview:iphoneView1];
//    iphone5View1.hidden=YES;
    
    
    
    iphoneView2=[[IphoneView2 alloc] init];
    iphoneView2.gesterDelegate=self;
     iphoneView2.buttonDelegate=self;
    [v addSubview:iphoneView2];
    iphoneView2.hidden=YES;

    iphoneView3=[[IphoneView3 alloc] init];
    iphoneView3.gesterDelegate=self;
     iphoneView3.buttonDelegate=self;
    [v addSubview:iphoneView3];
     iphoneView3.hidden=YES;
    

    
    
    
    
    photoButton=[[UIButton alloc] init];
    photoButton.frame=CGRectMake(226, 12, 70, 70);
    photoButton.layer.cornerRadius=35;
    photoButton.layer.borderWidth=1;
    photoButton.clipsToBounds = YES;
    [photoButton addTarget:self action:@selector(userCenter) forControlEvents:UIControlEventTouchUpInside];
    photoButton.layer.borderColor=[[UIColor clearColor] CGColor];
    [photoButton setImage:IMAGEWITHNAME(@"button4") forState:UIControlStateNormal];
    [self.view addSubview:photoButton];
    [photoButton release];
    
    
    userIdLabel=[[UILabel alloc] init];
    userIdLabel.frame=CGRectMake(226-50, 90, 70+100, 20);
    userIdLabel.backgroundColor=[UIColor clearColor];
    userIdLabel.textColor=[UIColor whiteColor];
    userIdLabel.font=[UIFont systemFontOfSize:13];
    userIdLabel.textAlignment=NSTextAlignmentCenter;
    userIdLabel.text=[NSString stringWithFormat:@"%@",[UserPart getUserId]];
    [self.view addSubview:userIdLabel];
    [userIdLabel release];
    
    
    
    
    
   
    
    UIButton *buttonLeft=[[UIButton alloc] init];
    buttonLeft.frame=CGRectMake(0, 355-(isIPhone5?0:20), 40, 60);
    [buttonLeft addTarget:self action:@selector(letfAction) forControlEvents:UIControlEventTouchUpInside];
    [buttonLeft setImage:IMAGEWITHNAME(@"buttonleft28") forState:UIControlStateNormal];
    [self.view addSubview:buttonLeft];
    [buttonLeft release];
    
    
    UIButton *buttonRight=[[UIButton alloc] init];
    buttonRight.frame=CGRectMake(280, 355-(isIPhone5?0:20), 40, 60);
     [buttonRight addTarget:self action:@selector(rightAction) forControlEvents:UIControlEventTouchUpInside];
    [buttonRight setImage:IMAGEWITHNAME(@"buttonright29") forState:UIControlStateNormal];
    [self.view addSubview:buttonRight];
    [buttonRight release];
    

    
    
//    [StaticFunction timeString:@"9Wd天s时7分YXC秒?"];
    
    
    
    
    
    
//    UILabel *aaaa=[[UILabel alloc] init];
//    aaaa.frame=CGRectMake(0, 200, 100, 30);
//    aaaa.attributedText=[StaticFunction rateString:@"2.3%"];
//    aaaa.backgroundColor=[UIColor clearColor];
//    [self.view addSubview:aaaa];
    
    
    iphoneUnlockGesture=[[IphoneUnlockGesture alloc] init];
    
    if ([UserPart getUserLoginStatus]) {
        iphoneUnlockGesture.delegate=self;
        [[self mainWindow] addSubview:iphoneUnlockGesture];
        
        
        
        
        
        
    }else{
        
        LoginViewController *lvc=[[LoginViewController alloc] init];
        lvc.delegate=self;
        UINavigationController *na=[[UINavigationController alloc] initWithRootViewController:lvc];
        [self presentViewController:na animated:NO completion:^{
            
        }];
        [na release];
        [lvc release];
    }
    
}

-(void)userLoginSucAction{
    
    userIdLabel.text=[NSString stringWithFormat:@"%@",[UserPart getUserId]];
    
    
    
}
-(void)userCenter{
    
    
    /*
    ManagerCenterViewController *mcvc=[[ManagerCenterViewController alloc] init];
    [self.navigationController pushViewController:mcvc animated:YES];
    [mcvc release];
    */
    
    
    
    
    
    
    
    
}




- (UIWindow *)mainWindow
{
    UIApplication *app = [UIApplication sharedApplication];
    if ([app.delegate respondsToSelector:@selector(window)])
    {
        return [app.delegate window];
    }
    else
    {
        return [app keyWindow];
    }
}

-(void)iphoneUnlockGestureDidForgetGesture:(NSInteger)indexTag{
    
}
-(void)iphoneUnlockGestureSetGesture:(NSString *)gestureString{
//    NSLog(@"%@",gestureString);
    
    if ([@"147852369" isEqualToString:gestureString]) {
        iphoneUnlockGesture.hidden=YES;
        
    }
    
}


-(void)iphoneViewButtonClickViewTag:(int)viewTag butTag:(int)butTag{
    
  
    if (viewTag==1) {
        
        ProductDetailViewController *pdvc=[[ProductDetailViewController alloc] init];
        [self.navigationController pushViewController:pdvc animated:YES];
        [pdvc release];
        
        
        
    }else if (viewTag==2){
        
        
        
    }else if (viewTag==3){
        
    }

    
}
-(void)letfAction{
    
    
    if (currenPage==1) {
        
        iphoneView1.hidden=YES;
        iphoneView2.hidden=NO;
        iphoneView3.hidden=YES;
        
        [UIView transitionFromView:iphoneView1 toView:iphoneView2 duration:VIEW_DURATION options:UIViewAnimationOptionTransitionFlipFromLeft completion:^(BOOL finished) {
            
            currenPage=2;
        }];
        
    }else if (currenPage==2){
        
        iphoneView1.hidden=YES;
        iphoneView2.hidden=YES;
        iphoneView3.hidden=NO;
        
        [UIView transitionFromView:iphoneView2 toView:iphoneView3 duration:VIEW_DURATION options:UIViewAnimationOptionTransitionFlipFromLeft completion:^(BOOL finished) {
            
            currenPage=3;
        }];
        
    }else if (currenPage==3){
        
        iphoneView1.hidden=NO;
        iphoneView2.hidden=YES;
        iphoneView3.hidden=YES;
        
        [UIView transitionFromView:iphoneView3 toView:iphoneView1 duration:VIEW_DURATION options:UIViewAnimationOptionTransitionFlipFromLeft completion:^(BOOL finished) {
            
            currenPage=1;
            
        }];
        
    }
    
   
    
    
}

-(void)rightAction{
    
    
    
    if (currenPage==1) {
        
        iphoneView1.hidden=YES;
        iphoneView2.hidden=YES;
        iphoneView3.hidden=NO;
        
        [UIView transitionFromView:iphoneView1 toView:iphoneView3 duration:VIEW_DURATION options:UIViewAnimationOptionTransitionFlipFromRight completion:^(BOOL finished) {
            
            currenPage=3;
        }];
        
    }else if (currenPage==2){
        
        iphoneView1.hidden=NO;
        iphoneView2.hidden=YES;
        iphoneView3.hidden=YES;
        
        [UIView transitionFromView:iphoneView2 toView:iphoneView1 duration:VIEW_DURATION options:UIViewAnimationOptionTransitionFlipFromRight completion:^(BOOL finished) {
            
            currenPage=1;
        }];
        
    }else if (currenPage==3){
        
        iphoneView1.hidden=YES;
        iphoneView2.hidden=NO;
        iphoneView3.hidden=YES;
        
        [UIView transitionFromView:iphoneView3 toView:iphoneView2 duration:VIEW_DURATION options:UIViewAnimationOptionTransitionFlipFromRight completion:^(BOOL finished) {
            
            currenPage=2;
            
        }];
        
    }
    
    

    
    
}
-(void)gestureRecognizerAction:(UISwipeGestureRecognizer *)sender{
    
    if (sender.direction==UISwipeGestureRecognizerDirectionLeft) {
         [self rightAction];
    }else if(sender.direction==UISwipeGestureRecognizerDirectionRight){
       
        
        
        [self letfAction];
    }
}
/*
-(void)cccccc{
    
    OBShapedButton *oo=[OBShapedButton buttonWithType:UIButtonTypeCustom];
    oo.frame=CGRectMake(115, 20, 90, 155);
    oo.adjustsImageWhenDisabled=YES;
    oo.adjustsImageWhenHighlighted=YES;
    oo.tag=1;
    [oo addTarget:self action:@selector(ooAction:) forControlEvents:UIControlEventTouchUpInside];
    [oo setImage:[UIImage imageNamed:@"a1"] forState:UIControlStateNormal];
    [self.view addSubview:oo];

}
*/



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
