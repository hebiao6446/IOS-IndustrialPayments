//
//  UserPart.h
//  IndustrialPayments
//
//  Created by May Peach & He Biao on 14-8-28.
//  Copyright (c) 2014年 Hebiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserPart : NSObject

+(BOOL)getUserLoginStatus;
+(void)saveUserLoginStatus:(BOOL)status;


+(void)saveUserLoginId:(id)loginId;
+(id)getUserLoginId;


+(void)saveUserRealName:(id)realName;
+(id)getUserRealName;


+(void)saveUserState:(id)state;
+(id)getUserState;


+(void)saveUserId:(id)userId;
+(id)getUserId;

+(void)saveUserType:(id)userType;
+(id)getUserType;


+(void)saveUser:(NSDictionary *)data;


@end
