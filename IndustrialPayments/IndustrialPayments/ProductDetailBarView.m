//
//  ProductDetailBarView.m
//  IndustrialPayments
//
//  Created by May Peach & He Biao on 14-8-28.
//  Copyright (c) 2014年 Hebiao. All rights reserved.
//

#import "ProductDetailBarView.h"
#import "ConstantPart.h"


@implementation ProductDetailBarView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        
        
        
        
    }
    return self;
}


-(id)init{
    
    self = [super initWithFrame:CGRectMake(320-135, 1, 135, 170)];
    if (self) {
        // Initialization code
        
        
        self.backgroundColor=[UIColor clearColor];
        
        UIImageView *backImg=[[UIImageView alloc] init];
        backImg.frame=CGRectMake(0, 0, 135, 170);
        [backImg setImage:IMAGEWITHNAME(@"prouductviewc1")];
        [self addSubview:backImg];
        [backImg release];
        
        for (int i=0; i<4; i++) {
            
            NSString *name=[NSString stringWithFormat:@"productbutton%d",i+2];
            
            
            UIButton *button=[[UIButton alloc] init];
            button.frame=CGRectMake(0, 15+40*i-(i==3?3:0), 135, 35);
            button.tag=i+1;
            [button addTarget:self action:@selector(butAction:) forControlEvents:UIControlEventTouchUpInside];
            [button setImage:IMAGEWITHNAME(name) forState:UIControlStateNormal];
            [self addSubview:button];
            [button release];
            
            
            
        }
        
        
        
    }
    return self;
    
}

-(void)butAction:(UIButton *)sender{
    
    [self.delegate ProductDetailBarViewDidButtonClick:sender.tag];
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
