//
//  ProductDetailBarView.h
//  IndustrialPayments
//
//  Created by May Peach & He Biao on 14-8-28.
//  Copyright (c) 2014年 Hebiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ProductDetailBarViewDelegate <NSObject>

-(void)ProductDetailBarViewDidButtonClick:(NSInteger)tag;


@end

@interface ProductDetailBarView : UIView


-(id)init;

@property (assign,nonatomic) id<ProductDetailBarViewDelegate>delegate;

@end
