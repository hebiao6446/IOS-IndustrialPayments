//
//  HttpRequestDic.h
//  SmartCircle
//
//  Created by May Peach on 13-7-10.
//  Copyright (c) 2013年 MayPeach. All rights reserved.
//


#import "SBJSON.h"

@class ASIHTTPRequest;

@interface HttpRequestDic : SBJSON


+(NSDictionary *)JsonData:(ASIHTTPRequest *)request;

+(BOOL)isOkStatus:(NSDictionary *)data;

@end
