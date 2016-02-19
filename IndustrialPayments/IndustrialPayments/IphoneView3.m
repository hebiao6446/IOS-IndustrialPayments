//
//  IphoneView3.m
//  IndustrialPayments
//
//  Created by May Peach & He Biao on 14-9-4.
//  Copyright (c) 2014年 Hebiao. All rights reserved.
//

#import "IphoneView3.h"

#import "HeadFile.h"
#import "OBShapedButton.h"

@implementation IphoneView3

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(id)init{
    
    self = [super initWithFrame:CGRectMake(0, 0, 320, 416+(isIPhone5?88:0))];
    if (self) {
        // Initialization code
        
        
        self.backgroundColor=[UIColor clearColor];
        
        
        
        UIImageView *backImage=[[UIImageView alloc] init];
        backImage.frame=CGRectMake(0, 0, 320, 416+(isIPhone5?88:0));
        [backImage setImage:IMAGEWITHNAME(isIPhone5?@"iphone5view3back7":@"iphone4view3back7")];
        [self addSubview:backImage];
        [backImage release];
        
        OBShapedButton *oo=[OBShapedButton buttonWithType:UIButtonTypeCustom];
        if (isIPhone5) {
             oo.frame=CGRectMake(80, 0, 160, 250);
        }else{
            oo.frame=CGRectMake(92.5, 0, 135, 207);
        }
        oo.tag=1;
        oo.adjustsImageWhenDisabled=YES;
        oo.adjustsImageWhenHighlighted=YES;
        [oo addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [oo setImage:IMAGEWITHNAME(isIPhone5?@"iphone5view3button8":@"iphone4view3button8") forState:UIControlStateNormal];
        [self addSubview:oo];
        
        
        
        
        
        OBShapedButton *button1=[OBShapedButton buttonWithType:UIButtonTypeCustom];
        if (isIPhone5) {
            button1.frame=CGRectMake(0, 0, 228, 107);
            button1.center=CGPointMake(160, 303);
        }else{
            button1.frame=CGRectMake(0, 0, 190, 89);
            button1.center=CGPointMake(160, 251);
        }
        button1.tag=2;
        button1.adjustsImageWhenDisabled=YES;
        button1.adjustsImageWhenHighlighted=YES;
        [button1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [button1 setImage:IMAGEWITHNAME(isIPhone5?@"iphone5button3":@"iphone4button3") forState:UIControlStateNormal];
        [self addSubview:button1];
        
        
        
        OBShapedButton *button2=[OBShapedButton buttonWithType:UIButtonTypeCustom];
        if (isIPhone5) {
            button2.frame=CGRectMake(0, 0, 307, 107);
            button2.center=CGPointMake(160, 428);
        }else{
            button2.frame=CGRectMake(0, 0, 255, 88);
            button2.center=CGPointMake(160, 353);
        }
        button2.tag=3;
        button2.adjustsImageWhenDisabled=YES;
        button2.adjustsImageWhenHighlighted=YES;
        [button2 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [button2 setImage:IMAGEWITHNAME(isIPhone5?@"iphone5button4":@"iphone4button4") forState:UIControlStateNormal];
        [self addSubview:button2];
        
        
        
        
        UISwipeGestureRecognizer *recognizer;
        recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
        [recognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
        [self addGestureRecognizer:recognizer];
        [recognizer release];
        
        
        recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
        [recognizer setDirection:(UISwipeGestureRecognizerDirectionLeft)];
        [self addGestureRecognizer:recognizer];
        [recognizer release];
        
    }
    return self;
    
    
}

-(void)handleSwipeFrom:(UISwipeGestureRecognizer *)sender{
    
    
    [self.gesterDelegate gestureRecognizerAction:sender];
    
    
}


-(void)buttonAction:(OBShapedButton *)sender{
    [self.buttonDelegate iphoneViewButtonClickViewTag:2 butTag:sender.tag];
    
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
