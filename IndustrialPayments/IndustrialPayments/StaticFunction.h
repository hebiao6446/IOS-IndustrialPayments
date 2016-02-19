//
//  StaticFunction.h
//  SmartCircle
//
//  Created by May Peach on 13-6-26.
//  Copyright (c) 2013年 MayPeach. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StaticFunction : NSObject

+(void)alertView:(UIView *)view msg:(NSString *)msg;
+(void)addAlertView:(UIView *)view msg:(NSString *)mag;

+(void)removeAlertView:(UIView *)view;
+(void)alertView:(UIView *)view msg:(NSString *)msg  leng:(int )le;

+(NSString *)dataFilePath;
+(NSString *)imageFilePath;
+(BOOL)localExistenceThisImage:(NSString*)imageName;
+(void)createImagePath;
+(double)getImageFileMB;
+(void)deleteImagePath;
+(UILabel *)getTileLabel:(NSString *)title;
+(NSString *)trimSpaceInTextField:(NSString *)str;
+(BOOL)isUserNetOK;
+(BOOL)isMobileNumber:(NSString *)mobileNum;
+(BOOL)stringContentString:(NSString *)motherString subString:(NSString *)sonString;

+(BOOL)isValidateEmail:(NSString *)email;



+ (UIColor *) colorWithHexString: (NSString *) hexString;

+(UIImage *)changeimagetocilce:(UIImage*)image;
+ (UIImage *) createRoundedRectImage:(UIImage*)image size:(CGSize)size;

+(NSMutableAttributedString*)timeString:(NSString*)str_original;
+(NSMutableAttributedString*)rateString:(NSString*)str_original;



@end
