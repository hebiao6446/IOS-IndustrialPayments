//
//  UIPlaceHolderTextView.h
//  CarbonFootprint
//
//  Created by May Peach & He Biao on 13-9-3.
//  Copyright (c) 2013年 MayPeach. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIPlaceHolderTextView : UITextView

@property (nonatomic, retain) NSString *placeholder;
@property (nonatomic, retain) UIColor *placeholderColor;

-(void)textChanged:(NSNotification*)notification;


@end
