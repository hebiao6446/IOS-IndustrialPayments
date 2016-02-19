//
//  UserPart.m
//  IndustrialPayments
//
//  Created by May Peach & He Biao on 14-8-28.
//  Copyright (c) 2014年 Hebiao. All rights reserved.
//

#import "UserPart.h"

@implementation UserPart


+(BOOL)getUserLoginStatus{
    NSUserDefaults *def=[NSUserDefaults standardUserDefaults];
    if ([def objectForKey:@"UserLoginStatus"]!=nil) {
        return [[def objectForKey:@"UserLoginStatus"] boolValue];
    }
    
    return NO;
}

+(void)saveUserLoginStatus:(BOOL)status{
    
    NSUserDefaults *def=[NSUserDefaults standardUserDefaults];
    
    [def setValue:@(status) forKey:@"UserLoginStatus"];
    
    [def synchronize];
    
}
+(void)saveUserLoginId:(id)loginId{
    NSUserDefaults *def=[NSUserDefaults standardUserDefaults];
    
    [def setValue:loginId forKey:@"UserLoginId"];
    
    [def synchronize];
    
}
+(id)getUserLoginId{
    
    
    NSUserDefaults *def=[NSUserDefaults standardUserDefaults];
    if ([def objectForKey:@"UserLoginId"]!=nil) {
        return [def objectForKey:@"UserLoginId"];
    }
    
    return @(-1);
}


+(void)saveUserRealName:(id)realName{
    
    NSUserDefaults *def=[NSUserDefaults standardUserDefaults];
    
    [def setValue:realName forKey:@"realName"];
    
    [def synchronize];
    
    
}
+(id)getUserRealName{
    
    NSUserDefaults *def=[NSUserDefaults standardUserDefaults];
    if ([def objectForKey:@"realName"]!=nil) {
        return [def objectForKey:@"realName"];
    }
    
    return @"";
}


+(void)saveUserState:(id)state{
    
    
    NSUserDefaults *def=[NSUserDefaults standardUserDefaults];
    
    [def setValue:state forKey:@"state"];
    
    [def synchronize];
}
+(id)getUserState{
    
    NSUserDefaults *def=[NSUserDefaults standardUserDefaults];
    if ([def objectForKey:@"state"]!=nil) {
        return [def objectForKey:@"state"];
    }
    
    return @(-1);
    
}


+(void)saveUserId:(id)userId{
    NSUserDefaults *def=[NSUserDefaults standardUserDefaults];
    
    [def setValue:userId forKey:@"userId"];
    
    [def synchronize];
    
}
+(id)getUserId{
    
    NSUserDefaults *def=[NSUserDefaults standardUserDefaults];
    if ([def objectForKey:@"userId"]!=nil) {
        return [def objectForKey:@"userId"];
    }
    
    return @(-1);
    
}

+(void)saveUserType:(id)userType{
    NSUserDefaults *def=[NSUserDefaults standardUserDefaults];
    
    [def setValue:userType forKey:@"userType"];
    
    [def synchronize];
    
}
+(id)getUserType{
    
    NSUserDefaults *def=[NSUserDefaults standardUserDefaults];
    if ([def objectForKey:@"userType"]!=nil) {
        return [def objectForKey:@"userType"];
    }
    
    return @(-1);
}

+(void)saveUser:(NSDictionary *)data{
    [self saveUserLoginId:data[@"loginId"]];
    [self saveUserRealName:data[@"realName"]];
    [self saveUserState:data[@"state"]];
    [self saveUserType:data[@"userType"]];
    [self saveUserId:data[@"userId"]];
    
}


@end
