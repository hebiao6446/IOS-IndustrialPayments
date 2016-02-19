//
//  AppDelegate.h
//  IndustrialPayments
//
//  Created by May Peach & He Biao on 14-8-28.
//  Copyright (c) 2014年 Hebiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,UIScrollViewDelegate>{
    UIScrollView *loadScrollView;
    UIPageControl *pageControl;
}



@property (strong, nonatomic) UIWindow *window;

@end
