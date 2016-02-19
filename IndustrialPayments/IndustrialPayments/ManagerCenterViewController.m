//
//  ManagerCenterViewController.m
//  IndustrialPayments
//
//  Created by May Peach & He Biao on 14-9-3.
//  Copyright (c) 2014年 Hebiao. All rights reserved.
//

#import "ManagerCenterViewController.h"
#import "HeadFile.h"

#import "OBShapedButton.h"



@interface ManagerCenterViewController ()

@end

@implementation ManagerCenterViewController

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
    self.title=@"管理中心";
    
    
    photoButton=[[UIButton alloc] init];
    photoButton.frame=CGRectMake(226+20, 12, 70, 70);
    photoButton.layer.cornerRadius=35;
    photoButton.layer.borderWidth=1;
    photoButton.clipsToBounds = YES;
    [photoButton addTarget:self action:@selector(takePhoto) forControlEvents:UIControlEventTouchUpInside];
    photoButton.layer.borderColor=[[UIColor clearColor] CGColor];
    [photoButton setImage:IMAGEWITHNAME(@"button4") forState:UIControlStateNormal];
    [self.view addSubview:photoButton];
    [photoButton release];
    
    
    userIdLabel=[[UILabel alloc] init];
    userIdLabel.frame=CGRectMake(226-50+20, 90, 70+100, 20);
    userIdLabel.backgroundColor=[UIColor clearColor];
    userIdLabel.textColor=[UIColor whiteColor];
    userIdLabel.font=[UIFont systemFontOfSize:13];
    userIdLabel.textAlignment=NSTextAlignmentCenter;
    userIdLabel.text=[NSString stringWithFormat:@"%@",[UserPart getUserId]];
    [self.view addSubview:userIdLabel];
    [userIdLabel release];

    
    
    
    
    
    for (int i=1; i<=9; i++) {
        
        NSString *str=[NSString stringWithFormat:@"button%dc19",i];
        
        OBShapedButton *oo=[OBShapedButton buttonWithType:UIButtonTypeCustom];
        
        if (isIPhone5) {
            oo.frame=CGRectMake(0, 0, 90, 155);
            oo.center=[self getButton5Point:i];
            
        }else{
            oo.frame=CGRectMake(0, 0, 75, 129);
            oo.center=[self getButton4Point:i];
        }
        
        oo.adjustsImageWhenDisabled=YES;
        oo.adjustsImageWhenHighlighted=YES;
        oo.tag=i;
        [oo addTarget:self action:@selector(ooAction:) forControlEvents:UIControlEventTouchUpInside];
        [oo setImage:IMAGEWITHNAME(str) forState:UIControlStateNormal];
        [self.view addSubview:oo];
        
    }
    
    
}

-(void)takePhoto{
    
    
    
}

-(CGPoint)getButton5Point:(int)i{
    
    
   
    
    if (i==1) {
        
         return  CGPointMake(160, 85);
        
    }else if (i==2){
        
          return  CGPointMake(110, 168);
        
    }else if (i==3){
        
        return  CGPointMake(210, 168);
        
    }else if (i==4){
        
         return  CGPointMake(60, 252);
        
    }else if (i==5){
        
        return  CGPointMake(160, 252);
        
    }else if (i==6){
         return  CGPointMake(260, 252);
    }else if (i==7){
         return  CGPointMake(110, 337);
    }else if (i==8){
        return  CGPointMake(210, 337);
    }else if (i==9){
        return  CGPointMake(160, 420);
        
    }
    
    return CGPointZero;
    
    
}

-(CGPoint)getButton4Point:(int)i{
    
    int xyV=11;
    
    
    
    if (i==1) {
        
        return  CGPointMake(160, 85-5-5-5);
        
    }else if (i==2){
        
        return  CGPointMake(110+xyV-3, 168-xyV-8-5-1-5);
        
    }else if (i==3){
        
        return  CGPointMake(210-xyV+3, 168-xyV-8-5-1-5);
        
    }else if (i==4){
        
        return  CGPointMake(60+2*xyV-5, 252-2*xyV-10-5-2-5);
        
    }else if (i==5){
        
        return  CGPointMake(160, 252-2*xyV-10-5-2-5);
        
    }else if (i==6){
        return  CGPointMake(260-2*xyV+5, 252-2*xyV-10-5-2-5);
    }else if (i==7){
        return  CGPointMake(110+xyV-3, 337-3*xyV-12-5-3-5);
    }else if (i==8){
        return  CGPointMake(210-xyV+3, 337-3*xyV-12-5-3-5);
    }else if (i==9){
        return  CGPointMake(160, 420-4*xyV-15-5-4-5);
        
    }
    
    return CGPointZero;
    
    
}




-(void)ooAction:(OBShapedButton *)sender{
    
    
    if (sender.tag==9) {
        
        UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                      initWithTitle:@"是否拨打客服电话?"
                                      delegate:self
                                      cancelButtonTitle:@"取消"
                                      destructiveButtonTitle:SERVICE_TEL_NUMBER
                                      otherButtonTitles: nil];
        actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
        actionSheet.tag=111;
        [actionSheet showInView:self.navigationController.view];
        [actionSheet release];

        
        
    }else if (sender.tag==5||sender.tag==7){
        
        
        
    }else{
        
        
        NSArray *arr=[NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"navigation1" ofType:@"plist"]];
        UIViewController *viewController=[[NSClassFromString((NSString *)[arr objectAtIndex:sender.tag]) alloc] init];
        [self.navigationController pushViewController:viewController animated:YES];
        [viewController release];
        
    }
    
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (actionSheet.tag==111&&buttonIndex==0) {
        BOOL  flag=[[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",@"110"]]];
        
        if (!flag) {
            
            [StaticFunction alertView:self.view msg:@"请换手机拨打"];
            
        }else {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",SERVICE_TEL_NUMBER]]];
        }
        
    }
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
