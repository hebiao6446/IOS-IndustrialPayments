//
//  BaseViewController.m
//  BusinessLineWorld
//
//  Created by May Peach & He Biao on 14-5-30.
//  Copyright (c) 2014年 Hebiao. All rights reserved.
//

#import "BaseViewController.h"

#import "ASIFormDataRequest.h"
#import "ConstantPart.h"


#define TITLE_COLOR  [UIColor whiteColor]




@interface BaseViewController ()

@end

@implementation BaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)dealloc{
    
    [_httpRequest clearDelegatesAndCancel];
    [_httpRequest release]; _httpRequest=nil;
    [super dealloc];
}

-(void)endEditingAction{
    
    [self.view endEditing:YES];
    
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor=VIEW_BACKGROUD_COLOR;
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(endEditingAction) name:NOTICE_ENDEDITING object:nil];
    
    
//
    
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:TITLE_COLOR, UITextAttributeTextColor,
        [UIColor clearColor],UITextAttributeTextShadowColor,[UIFont boldSystemFontOfSize:20],UITextAttributeFont,nil]];
    
    
    
 
  
    
    if (ISIOS7LATER) {
        
        
         [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"title2.png"] forBarMetrics:UIBarMetricsDefault];
        
    }else{
        
        
         [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"title1.png"] forBarMetrics:UIBarMetricsDefault];
        
        
    }
    
    
    
    
    
}
-(void)createBarLeftWithImage:(NSString *)imageName{
    
    if (imageName==nil) {
        
        return;
    }
    
    if ([imageName length]==0) {
        return;
    }
    
    UIButton *btnb = [UIButton buttonWithType : UIButtonTypeCustom];
    
    
    btnb.frame = CGRectMake (0, 0,  44, 44);
//    [btnb setBackgroundImage :[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btnb setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    if ([UIImage imageNamed:[NSString stringWithFormat:@"%@h",imageName]]) {
         [btnb setImage:[UIImage imageNamed:imageName] forState:UIControlStateHighlighted];
    }
//    btnb.showsTouchWhenHighlighted=YES;
    [btnb addTarget:self action:@selector(showLeft:) forControlEvents:UIControlEventTouchUpInside];
    
    if (ISIOS7LATER) {
        
        btnb.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    }
   
    UIBarButtonItem *ubar=[[UIBarButtonItem alloc] initWithCustomView :btnb];
 
    self.navigationItem.leftBarButtonItem = ubar;
    
}

-(void)showLeft:(UIButton *)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)createBarRightWithImage:(NSString *)imageName{
    
    
    [self createBarRightWithImage:imageName with:44];
    
    
}


-(void)createBarRightWithImage:(NSString *)imageName with:(float)w{
    
    if (imageName==nil) {
        
        return;
    }
    
    if ([imageName length]==0) {
        return;
    }
    
    
    
    UIButton *btnb = [UIButton buttonWithType : UIButtonTypeCustom];
    btnb.frame = CGRectMake (0, 0, w, 44);
    [btnb setImage :[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    if ([UIImage imageNamed:[NSString stringWithFormat:@"%@h",imageName]]) {
        [btnb setImage:[UIImage imageNamed:imageName] forState:UIControlStateHighlighted];
    }
//    btnb.showsTouchWhenHighlighted=YES;
    [btnb addTarget:self action:@selector(showRight:) forControlEvents:UIControlEventTouchUpInside];
    if (ISIOS7LATER) {
        
        btnb.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -20);
    }
    UIBarButtonItem *ubar=[[UIBarButtonItem alloc] initWithCustomView :btnb];
    
    
    
    
    self.navigationItem.rightBarButtonItem = ubar;
    
    
}

-(void)createBarRightWithTitle:(NSString *)title{
    
    
    if ([title length]==0) {
        return;
        
    }
    
    UIButton *btnb = [UIButton buttonWithType : UIButtonTypeCustom];
    btnb.frame = CGRectMake (4, 0, 44, 44);
    [btnb setTitle:title forState:UIControlStateNormal];
    [btnb setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnb setTitleColor:VIEW_BACKGROUD_COLOR forState:UIControlStateHighlighted];
    [btnb addTarget:self action:@selector(showRight:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *ubar=[[UIBarButtonItem alloc] initWithCustomView :btnb];
    
    
    
    
    self.navigationItem.rightBarButtonItem = ubar;
    
}
-(void)showRight:(UIButton *)sender{
    
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
-(UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    return image;
}
 
 */


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
