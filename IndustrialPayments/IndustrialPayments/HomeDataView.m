
//
//  HomeDataView.m
//  IndustrialPayments
//
//  Created by May Peach & He Biao on 14-8-28.
//  Copyright (c) 2014年 Hebiao. All rights reserved.
//

#import "HomeDataView.h"

#import "ConstantPart.h"


@implementation HomeDataView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)init{
    
    self = [super initWithFrame:CGRectMake(0, 0, 150, 210)];
    if (self) {
        // Initialization code
        
        self.backgroundColor=[UIColor clearColor];
        
        
        
        UIImageView *imageBack=[[UIImageView alloc] init];
        imageBack.frame=CGRectMake(0, 0, 150, 210);
        [imageBack setImage:IMAGEWITHNAME(@"homedataimage1")];
        [self addSubview:imageBack];
        [imageBack release];
        
        
//        for (int i=0; i<4; i++) {
        
        label1=[[UILabel alloc] init];
        label1.frame=CGRectMake(30, 30 , 75, 30);
        label1.backgroundColor=[UIColor clearColor];
        label1.textColor=REDCOLOR_HOMEDATA;
        //            la.text=@"132312";
        label1.font=[UIFont systemFontOfSize:15];
        [self addSubview:label1];
        [label1 release];
        
        
        
        label2=[[UILabel alloc] init];
        label2.frame=CGRectMake(30, 30+49*1 , 75, 30);
        label2.backgroundColor=[UIColor clearColor];
        label2.textColor=REDCOLOR_HOMEDATA;
        //            la.text=@"132312";
        label2.font=[UIFont systemFontOfSize:15];
        [self addSubview:label2];
        [label2 release];

        
        
        label3=[[UILabel alloc] init];
        label3.frame=CGRectMake(30, 30+49*2 , 75, 30);
        label3.backgroundColor=[UIColor clearColor];
        label3.textColor=REDCOLOR_HOMEDATA;
        //            la.text=@"132312";
        label3.font=[UIFont systemFontOfSize:15];
        [self addSubview:label3];
        [label3 release];
        
        
        
        label4=[[UILabel alloc] init];
        label4.frame=CGRectMake(30, 30+49*3 , 75, 30);
        label4.backgroundColor=[UIColor clearColor];
        label4.textColor=REDCOLOR_HOMEDATA;
        //            la.text=@"132312";
        label4.font=[UIFont systemFontOfSize:15];
        [self addSubview:label4];
        [label4 release];
        

        
        

        
        
        /*
            UILabel *la=[[UILabel alloc] init];
            la.frame=CGRectMake(30, 30+49*1, 75, 30);
            la.backgroundColor=[UIColor clearColor];
            la.textColor=REDCOLOR_HOMEDATA;
//            la.text=@"132312";
            la.font=[UIFont systemFontOfSize:15];
            [self addSubview:la];
            [la release];
            
            
//        }
         
         */
        
        
        
    }
    return self;
    
}


-(void)setData:(NSDictionary *)data{
    
    if ([data count]==0) {
        return;
    }
    
    
}
-(void)dealloc{
    
    [super dealloc];
    
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
