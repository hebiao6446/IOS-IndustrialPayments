//
//  Iphone4View3.m
//  IndustrialPayments
//
//  Created by May Peach & He Biao on 14-9-4.
//  Copyright (c) 2014年 Hebiao. All rights reserved.
//

#import "Iphone4View3.h"

#import "HeadFile.h"
#import "OBShapedButton.h"


@implementation Iphone4View3

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(id)init{
    
    self = [super initWithFrame:CGRectMake(0, 0, 320, 416)];
    if (self) {
        // Initialization code
        
        
        self.backgroundColor=[UIColor clearColor];
        
        
        
        UIImageView *backImage=[[UIImageView alloc] init];
        backImage.frame=CGRectMake(0, 0, 320, 416);
        [backImage setImage:IMAGEWITHNAME(@"iphone4view3back7")];
        [self addSubview:backImage];
        [backImage release];
        
        OBShapedButton *oo=[OBShapedButton buttonWithType:UIButtonTypeCustom];
        oo.frame=CGRectMake(92.5, 0, 135, 207);
        oo.adjustsImageWhenDisabled=YES;
        oo.adjustsImageWhenHighlighted=YES;
        [oo addTarget:self action:@selector(ooAction:) forControlEvents:UIControlEventTouchUpInside];
        [oo setImage:IMAGEWITHNAME(@"iphone4view3button8") forState:UIControlStateNormal];
        [self addSubview:oo];
        
        
        
        
        
        OBShapedButton *button1=[OBShapedButton buttonWithType:UIButtonTypeCustom];
        button1.frame=CGRectMake(0, 0, 190, 89);
        button1.center=CGPointMake(160, 251);
        button1.adjustsImageWhenDisabled=YES;
        button1.adjustsImageWhenHighlighted=YES;
        [button1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [button1 setImage:IMAGEWITHNAME(@"iphone4button3") forState:UIControlStateNormal];
        [self addSubview:button1];
        
        
        
        OBShapedButton *button2=[OBShapedButton buttonWithType:UIButtonTypeCustom];
        button2.frame=CGRectMake(0, 0, 255, 88);
        button2.center=CGPointMake(160, 353);
        button2.adjustsImageWhenDisabled=YES;
        button2.adjustsImageWhenHighlighted=YES;
        [button2 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [button2 setImage:IMAGEWITHNAME(@"iphone4button4") forState:UIControlStateNormal];
        [self addSubview:button2];
        
        
        
    }
    return self;
    
    
}

-(void)ooAction:(OBShapedButton *)sender{
    
    
}

-(void)buttonAction:(OBShapedButton *)sender{
    
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
