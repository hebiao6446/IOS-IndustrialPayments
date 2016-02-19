//
//  Iphone5UnlockGesture.m
//  IndustrialPayments
//
//  Created by May Peach & He Biao on 14-8-28.
//  Copyright (c) 2014年 Hebiao. All rights reserved.
//

#import "Iphone5UnlockGesture.h"

#import "ConstantPart.h"


@implementation Iphone5UnlockGesture

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(id)init{
    
    self = [super initWithFrame:CGRectMake(0, 0, 320, 568)];
    
    if (self) {
        // Initialization code
        
        self.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"iphone5back.png"]];
        
        
        
        
        
        mutalearray = [[NSMutableArray alloc]init];
        mutag = [[NSMutableArray alloc]init ];
        
        
        
        resulttext = [[UITextField alloc]init];
        
        
        
        imagePhoto=[[UIImageView alloc] init];
        imagePhoto.frame=CGRectMake(0, 0, 70, 70);
        imagePhoto.center=CGPointMake(160, 100);
        imagePhoto.layer.cornerRadius=35;
        imagePhoto.layer.borderWidth=1;
        imagePhoto.clipsToBounds = YES;
        imagePhoto.layer.borderColor=[[UIColor clearColor] CGColor];
        [imagePhoto setImage:IMAGEWITHNAME(@"button4")];
        [self addSubview:imagePhoto];
        [imagePhoto release];
        
        
        nameLabel=[[UILabel alloc] init];
        nameLabel.frame=CGRectMake(0, 135, 320, 30);
        nameLabel.text=@"15921994333";
        nameLabel.textAlignment=NSTextAlignmentCenter;
        nameLabel.backgroundColor=[UIColor clearColor];
        [self addSubview:nameLabel];
        [nameLabel release];

        
        
        
        for (int i=0; i<9; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setFrame:CGRectMake(26+(i%3)*98, 190+(i/3)*90, 72, 72)];
            
            [button setBackgroundColor:[UIColor clearColor]];
            [button setBackgroundImage:[UIImage imageNamed:@"unselectbutton.png"] forState:UIControlStateNormal];
            [button setBackgroundImage:[UIImage imageNamed:@"selectbutton.png"] forState:UIControlStateSelected];
            button.userInteractionEnabled= NO;//用户交互
            button.alpha = 0.9;
            button.tag = i+10000;
            [self addSubview:button];
            [mutalearray addObject:button];
            
        }
        
        
        
        
        
        
        
        
        UIButton *forgetButton=[[UIButton alloc] init];
        forgetButton.frame=CGRectMake(0, 0, 110, 40);
        forgetButton.center=CGPointMake(160, 525-24);
        [forgetButton setImage:[UIImage imageNamed:@"forgetbutton.png"] forState:UIControlStateNormal];
        [self addSubview:forgetButton];
        [forgetButton release];
        

        
        
        
        
        
        
        
        
        
        
        
    }
    return self;
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    
    
    
    
    CGPoint point= [[touches anyObject]locationInView:self];
    curentpoint = point;
    for (UIButton *thisbutton in mutalearray) {
        CGFloat xdiff =point.x-thisbutton.center.x;
        CGFloat ydiff=point.y - thisbutton.center.y;
        //按钮点击成功
        if (fabsf(xdiff) <36 &&fabsf (ydiff) <36){
            
            //            NSLog(@"%d",thisbutton.tag-9999);
            resulttext.text = [NSString stringWithFormat:@"%d",thisbutton.tag-9999];
            resulttext.text = [resulttext.text stringByAppendingString:resulttext.text];
            
            if (!thisbutton.selected) {
                thisbutton.selected = YES;
                [mutag  addObject:thisbutton];
            }
            
        }
    }
    [self setNeedsDisplay];
    [self addstring];
    //    NSLog(@"shuzhu  %@",mutag);
    
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UIButton *thisButton in mutalearray) {
        [thisButton setSelected:NO];
    }
    [mutag removeAllObjects];
    [self setNeedsDisplay];
    
    
    
    
    
    if ([resulttext.text length]>0) {
        
        [self.delegate iphoneUnlockGestureSetGesture:resulttext.text];
        
        
    }
    
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    CGPoint begainpoint=[[touches anyObject]locationInView:self];
    begainpoint = [[touches anyObject]locationInView:self];
    
    for (UIButton *thisbutton in mutalearray) {
        
        CGFloat xdiff =begainpoint.x-thisbutton.center.x;
        CGFloat ydiff=begainpoint.y - thisbutton.center.y;
        
        if (fabsf(xdiff) <36 &&fabsf (ydiff) <36&&fabsf(xdiff)<0&&fabsf (ydiff)<0){
            if (!thisbutton.selected) {
                thisbutton.selected = YES;
                [mutag  addObject:thisbutton];
            }
        }
    }
    
    [self setNeedsDisplay];
    [self addstring];
}
//
-(void)drawRect:(CGRect)rect{
    CGContextRef  contextref = UIGraphicsGetCurrentContext();
    UIButton *buttonn;
    UIButton *buttonn1;
    
    if (mutag.count!=0) {
        buttonn = mutag[0];
        
        [[UIColor  colorWithRed:204.0/255 green:204.0/255 blue:204.0/255 alpha:1] set];
        
        
        CGContextSetLineWidth(contextref, 5);
        CGContextMoveToPoint(contextref, buttonn.center.x, buttonn.center.y);
        
        for (int t=1; t<mutag.count; t++) {
            buttonn1 = mutag[t];
            CGContextAddLineToPoint(contextref, buttonn1.center.x, buttonn1.center.y);
            
        }
        CGContextAddLineToPoint(contextref, curentpoint.x, curentpoint.y);
        
    }
    CGContextStrokePath(contextref);
}
-(void)addstring{
    UIButton *strbutton;
    NSString *string=@"";
    
    for (int t=0; t<mutag.count; t++) {
        strbutton = mutag[t];
        string= [string stringByAppendingFormat:@"%d",strbutton.tag-9999];
        
    }
    
    resulttext.text = string;
    
    
    
    
    
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
