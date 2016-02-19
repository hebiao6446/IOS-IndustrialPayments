//
//  AppDelegate.m
//  IndustrialPayments
//
//  Created by May Peach & He Biao on 14-8-28.
//  Copyright (c) 2014年 Hebiao. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

#import "ConstantPart.h"





@implementation AppDelegate


void UncaughtExceptionHandler(NSException *exception)
{
    NSArray *arr = [exception callStackSymbols];
    NSString *reason = [exception reason];
    NSString *name = [exception name];
    NSString *exceptionStr = [NSString stringWithFormat:@"IOS Exception -- Version:%@\nName:%@\nReasion:%@\nCallStack:\n%@",
                              [[NSBundle mainBundle] infoDictionary][@"CFBundleVersion"],
                              name,
                              reason,
                              [arr componentsJoinedByString:@"\n"]];
    NSLog(@"%@+++++++++++++EEROR", exceptionStr);
    
    
    
    
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    ViewController *viewController = [[ViewController alloc] init];
    UINavigationController *na=[[UINavigationController alloc] initWithRootViewController:viewController];
    self.window.rootViewController = na;
    [self.window makeKeyAndVisible];
    
    
    
    
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"_APP"]==nil) {
        [[NSUserDefaults standardUserDefaults] setObject:@"_APP" forKey:@"_APP"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        
        loadScrollView=[[UIScrollView alloc] init] ;
        loadScrollView.frame=CGRectMake(0, 0, 320, 480+(isIPhone5?88:0));
        loadScrollView.contentSize=CGSizeMake(320*3, 480+(isIPhone5?88:0));
        loadScrollView.backgroundColor=[UIColor whiteColor];
        loadScrollView.pagingEnabled=YES;
        loadScrollView.showsVerticalScrollIndicator=NO;
        loadScrollView.delegate=self;
        loadScrollView.showsHorizontalScrollIndicator=NO;
        
        
        
        UIImageView *imageView2=[[UIImageView alloc] init];
        imageView2.frame=CGRectMake(0, 0, 320, 480+(isIPhone5?88:0));
        [imageView2 setImage:IMAGEWITHNAME(isIPhone5?@"iphone51":@"iphone41")];
        [loadScrollView addSubview:imageView2];
        [imageView2 release];
        
        
        UIImageView *imageView3=[[UIImageView alloc] init];
        imageView3.frame=CGRectMake(320*1, 0, 320, 480+(isIPhone5?88:0));
        [imageView3 setImage:IMAGEWITHNAME(isIPhone5?@"iphone52":@"iphone42")];
        [loadScrollView addSubview:imageView3];
        [imageView3 release];
        
        
        
        UIImageView *imageView4=[[UIImageView alloc] init];
        imageView4.frame=CGRectMake(320*2, 0, 320, 480+(isIPhone5?88:0));
        [imageView4 setImage:IMAGEWITHNAME(isIPhone5?@"iphone53":@"iphone43")];
        [loadScrollView addSubview:imageView4];
        [imageView4 release];
        
        
        
        [self.window addSubview:loadScrollView];
        
        
        
        
        pageControl=[[UIPageControl alloc]initWithFrame:CGRectMake(0, 450+(isIPhone5?88:0), 320, 30)] ;
        [pageControl setCurrentPage:0];
        pageControl.pageIndicatorTintColor=RGBA(195, 179, 163, 1);
        pageControl.currentPageIndicatorTintColor=RGBA(132, 104, 77, 1);
        pageControl.numberOfPages = 3;//指定页面个数
        [pageControl setBackgroundColor:[UIColor clearColor]];
        [pageControl addTarget:self action:@selector(changePage:)forControlEvents:UIControlEventValueChanged];
        [self.window addSubview:pageControl];
        
        
    }
    
    
    
    
    NSSetUncaughtExceptionHandler(&UncaughtExceptionHandler);

    
 
    
    
    return YES;
}



- (IBAction)changePage:(id)sender {
    int page = pageControl.currentPage;//获取当前pagecontroll的值
    [loadScrollView setContentOffset:CGPointMake(320 * page, 0)];//根据pagecontroll的值来改变scrollview的滚动位置，以此切换到指定的页面
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    int page = scrollView.contentOffset.x / 320;//通过滚动的偏移量来判断目前页面所对应的小白点
    pageControl.currentPage = page;//pagecontroll响应值的变化
    
    if (scrollView.contentOffset.x>=1005-320) {
        loadScrollView.hidden=YES;
        pageControl.hidden=YES;
        
        if (loadScrollView!=nil) {
            [loadScrollView release];
            loadScrollView=nil;
        }
        
        if (pageControl!=nil) {
            [pageControl release];
            pageControl=nil;
        }
        
        
    }
    
    
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
