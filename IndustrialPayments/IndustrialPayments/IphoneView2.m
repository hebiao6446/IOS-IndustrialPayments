//
//  IphoneView2.m
//  IndustrialPayments
//
//  Created by May Peach & He Biao on 14-9-4.
//  Copyright (c) 2014年 Hebiao. All rights reserved.
//

#import "IphoneView2.h"

#import "OBShapedButton.h"
#import "HeadFile.h"

@implementation IphoneView2

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
        [backImage setImage:IMAGEWITHNAME(isIPhone5?@"iphone5view2back5":@"iphone4view2back5")];
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
        [oo setImage:IMAGEWITHNAME(isIPhone5?@"iphone5view2button6":@"iphone4view2button6") forState:UIControlStateNormal];
        [self addSubview:oo];
        
        
        
        
        
        OBShapedButton *button1=[OBShapedButton buttonWithType:UIButtonTypeCustom];
        if (isIPhone5) {
            
            button1.frame=CGRectMake(0, 0, 260, 155);
            button1.center=CGPointMake(160, 328);
        }else{
            button1.frame=CGRectMake(0, 0, 215, 128);
            button1.center=CGPointMake(160, 270);
        }
        button1.tag=2;
        button1.adjustsImageWhenDisabled=YES;
        button1.adjustsImageWhenHighlighted=YES;
        [button1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [button1 setImage:IMAGEWITHNAME(isIPhone5?@"iphone5view2button9":@"iphone4view2button9") forState:UIControlStateNormal];
        [self addSubview:button1];
        
        
        
        
        
        
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
