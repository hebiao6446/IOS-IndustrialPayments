//
//  HttpRequestDic.m
//  SmartCircle
//
//  Created by May Peach on 13-7-10.
//  Copyright (c) 2013年 MayPeach. All rights reserved.
//

#import "HttpRequestDic.h"
#import "ASIFormDataRequest.h"


@implementation HttpRequestDic


+(NSDictionary *)JsonData:(ASIHTTPRequest *)request{
    
    
    
    NSData *_data=[request responseData];
    NSString *afertEncoder=[[NSString alloc] initWithData:_data encoding:CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingUTF8)];
    NSDictionary *data=[afertEncoder JSONValue];
    
    [afertEncoder release];
    
    return data;
    

}

+(BOOL)isOkStatus:(NSDictionary *)data{
    
    if ([[data objectForKey:@"status"] isEqualToString:@"0000"]) {
        
        return YES;
    }
    
    return NO;
}
@end

