//
//  StaticFunction.m
//  SmartCircle
//
//  Created by May Peach on 13-6-26.
//  Copyright (c) 2013年 MayPeach. All rights reserved.
//

#import "StaticFunction.h"
#import "Reachability.h"

#import "MyAlertView.h"


#import "CommonCrypto/CommonDigest.h"



#define KALERTVIEWTAG    99*99*99
#define KALERTTIME        2.0f


@implementation StaticFunction



#define FILE_MAIN_PATH @"morning_news_main_path"
#define IMAGE_PATH @"image_path"



+(void)alertView:(UIView *)view msg:(NSString *)msg{
	if([view viewWithTag:KALERTVIEWTAG] == nil){
		MyAlertView *alertView = [MyAlertView alertViewInView:view getMessage:msg kind:NO x:view.bounds.size.width y:view.bounds.size.height-60];
		[self performSelector:@selector(removeAlertView:) withObject:alertView afterDelay:KALERTTIME];
	}
}
+(void)alertView:(UIView *)view msg:(NSString *)msg  leng:(int )le{
    if([view viewWithTag:KALERTVIEWTAG] == nil){
		MyAlertView *alertView = [MyAlertView alertViewInView:view getMessage:msg kind:NO x:view.bounds.size.width y:view.bounds.size.height+le];
		[self performSelector:@selector(removeAlertView:) withObject:alertView afterDelay:KALERTTIME];
	}
}
+(void)addAlertView:(UIView *)view msg:(NSString *)mag{
	if([view viewWithTag:KALERTVIEWTAG] == nil){
		[MyAlertView alertViewInView:view getMessage:mag kind:YES x:view.bounds.size.width y:view.bounds.size.height-60];
	}
}

+(void)removeAlertView:(UIView *)view{
    if([view isKindOfClass:[MyAlertView class]])
    {
        [(MyAlertView *)view removeView];
    }
    else{
        [[view viewWithTag:KALERTVIEWTAG] removeFromSuperview];
    }
}




+(NSString *)dataFilePath{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
// 	NSString *libraryDirectory = [[paths objectAtIndex:0] stringByAppendingPathComponent:FILE_MAIN_PATH];
	return [paths objectAtIndex:0];
}

+(NSString *)imageFilePath{
	return [[self dataFilePath] stringByAppendingPathComponent:IMAGE_PATH];
}

+(BOOL)localExistenceThisImage:(NSString*)imageName{
	NSString *path = [[self imageFilePath] stringByAppendingPathComponent:imageName];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	if([fileManager fileExistsAtPath:path])return YES;
	return NO;
}
+(void)createImagePath{
    if(![[NSFileManager defaultManager] fileExistsAtPath:[self imageFilePath]]){
		[[NSFileManager defaultManager] createDirectoryAtPath:[self imageFilePath] withIntermediateDirectories:YES attributes:nil error:nil];
	}
}
+(double)getImageFileMB{
    NSFileManager *fileManager=[NSFileManager defaultManager];
    NSArray *fileList =[fileManager contentsOfDirectoryAtPath:[self imageFilePath] error:nil];
    
    long fileSize=0;
    
       
    for (NSString *fileName in fileList) {
      NSString *path = [[self imageFilePath] stringByAppendingPathComponent:fileName];
        
        NSError *error=nil;//局部变量必须赋值，并不是默认的nil
        NSDictionary * fileAttributes = [fileManager attributesOfItemAtPath:path error:&error];
        if (fileAttributes == nil || error!=nil){
        
        }else{
            NSNumber *fileSizeNum = [fileAttributes objectForKey:NSFileSize];
            fileSize += [fileSizeNum longValue];
        }
        
        
    }
    
    
   
    
    
    return fileSize/1024.0;
}
+(void)deleteImagePath{
//    NSArray *files = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[self imageFilePath] error:NULL];
//    if ([files count] == 0) {
//        NSLog(@"Not file in  photos directory");
//        return;
//    }
//    for (int i=0; i<[files count]; i++) {
//        NSString *filePath = [[self imageFilePath] stringByAppendingPathComponent:[files objectAtIndex:i]];
//        [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
//    }
    
    [[NSFileManager defaultManager] removeItemAtPath:[self imageFilePath]error:nil];
    
    [self createImagePath];
    
    
}
+(UILabel *)getTileLabel:(NSString *)title{
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0 , 200, 44)];
    titleLabel.backgroundColor = [UIColor clearColor];
    //    titleLabel.font = [UIFont fontWithName:@"ArialHebrew" size:20];
    titleLabel.font=[UIFont boldSystemFontOfSize:19];
    
    //设置文本字体与大小
    //    titleLabel.textColor = [UIColor colorWithRed:(0.0/255.0) green:(255.0 / 255.0) blue:(0.0 / 255.0) alpha:1];  //设置文本颜色
    titleLabel.textColor=[UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.shadowColor=[UIColor grayColor];
    titleLabel.shadowOffset=CGSizeMake(-1.0, -1.0);
    titleLabel.text=title;
    
    
    return [titleLabel  autorelease];
}
+(NSString *)trimSpaceInTextField:(NSString *)str{
    return  [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    
}


+(BOOL)isValidateEmail:(NSString *)email

{
    
    NSString *emailRegex = @"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",emailRegex];
    
    return [emailTest evaluateWithObject:email];
    
}
+(BOOL)isUserNetOK{
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    
    if (!didRetrieveFlags)
    {
        NSLog(@"Error. Could not recover network reachability flags");
        return NO;
    }
    
    BOOL isReachable = flags & kSCNetworkFlagsReachable;
    BOOL needsConnection = flags & kSCNetworkFlagsConnectionRequired;
    return (isReachable && !needsConnection) ? YES : NO;
}

+(BOOL)stringContentString:(NSString *)motherString subString:(NSString *)sonString{
    if ([motherString rangeOfString:sonString].location!=NSNotFound) {
        
        return YES;
    }else {
        return NO;
    }
    
    
}

+(BOOL)isMobileNumber:(NSString *)mobileNum
{
    
    
    if (mobileNum.length==0) {
        
        return NO;
    }
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[0127-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[56]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}
+ (CGFloat) colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length

{
    
    NSString *substring = [string substringWithRange: NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0;
    
}
+ (UIColor *) colorWithHexString: (NSString *) hexString

{
    
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString: @"#"withString: @""] uppercaseString];
    
    CGFloat alpha, red, blue, green;
    
    switch ([colorString length]) {
            
        case 3: // #RGB
            
            alpha = 1.0f;
            
            red   = [self colorComponentFrom: colorString start: 0 length: 1];
            
            green = [self colorComponentFrom: colorString start: 1 length: 1];
            
            blue  = [self colorComponentFrom: colorString start: 2 length: 1];
            
            break;
            
        case 4: // #ARGB
            
            alpha = [self colorComponentFrom: colorString start: 0 length: 1];
            
            
            red   = [self colorComponentFrom: colorString start: 1 length: 1];
            
            green = [self colorComponentFrom: colorString start: 2 length: 1];
            
            blue  = [self colorComponentFrom: colorString start: 3 length: 1];
            
            break;
            
        case 6: // #RRGGBB
            
            alpha = 1.0f;
            
            red   = [self colorComponentFrom: colorString start: 0 length: 2];
            
            green = [self colorComponentFrom: colorString start: 2 length: 2];
            
            blue  = [self colorComponentFrom: colorString start: 4 length: 2];
            
            break;
            
        case 8: // #AARRGGBB
            
            alpha = [self colorComponentFrom: colorString start: 0 length: 2];
            
            red   = [self colorComponentFrom: colorString start: 2 length: 2];
            
            green = [self colorComponentFrom: colorString start: 4 length: 2];
            
            blue  = [self colorComponentFrom: colorString start: 6 length: 2];
            
            break;
            
        default:
            
            [NSException raise:@"Invalid color value"format: @"Color value %@ is invalid.  It should be a hex value of the form #RBG, #ARGB, #RRGGBB, or #AARRGGBB", hexString];
            
            break;
            
    }
    
    return [UIColor colorWithRed: red green: green blue: blue alpha: alpha];
    
}
//将图片处理成圆角
+ (UIImage *) createRoundedRectImage:(UIImage*)image size:(CGSize)size
{
    // the size of CGContextRef
    int w = size.width;
    int h = size.height;
    
    UIImage *img = image;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL, w, h, 8, 4 * w, colorSpace, kCGImageAlphaPremultipliedFirst);
    CGRect rect = CGRectMake(0, 0, w, h);
    
    CGContextBeginPath(context);
    addRoundedRectToPath(context, rect, 80, 88);//控制圆角弧度
    CGContextClosePath(context);
    CGContextClip(context);
    CGContextDrawImage(context, CGRectMake(0, 0, w, h), img.CGImage);
    CGImageRef imageMasked = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    return [UIImage imageWithCGImage:imageMasked];
}

static void addRoundedRectToPath(CGContextRef context, CGRect rect, float ovalWidth,
                                 float ovalHeight)
{
    float fw, fh;
    if (ovalWidth == 0 || ovalHeight == 0) {
        CGContextAddRect(context, rect);
        return;
    }
    
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, CGRectGetMinX(rect), CGRectGetMinY(rect));
    CGContextScaleCTM(context, ovalWidth, ovalHeight);
    fw = CGRectGetWidth(rect) / ovalWidth;
    fh = CGRectGetHeight(rect) / ovalHeight;
    
    CGContextMoveToPoint(context, fw, fh/2);  // Start at lower right corner
    CGContextAddArcToPoint(context, fw, fh, fw/2, fh, 1);  // Top right corner
    CGContextAddArcToPoint(context, 0, fh, 0, fh/2, 1); // Top left corner
    CGContextAddArcToPoint(context, 0, 0, fw/2, 0, 1); // Lower left corner
    CGContextAddArcToPoint(context, fw, 0, fw, fh/2, 1); // Back to lower right
    
    CGContextClosePath(context);
    CGContextRestoreGState(context);
}

//将图片处理成圆的
+(UIImage *)changeimagetocilce:(UIImage*)image
{
    UIImage *finalImage = nil;
    UIGraphicsBeginImageContext(image.size);
    {
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        CGAffineTransform trnsfrm = CGAffineTransformConcat(CGAffineTransformIdentity, CGAffineTransformMakeScale(1.0, -1.0));
        trnsfrm = CGAffineTransformConcat(trnsfrm, CGAffineTransformMakeTranslation(0.0, image.size.height));
        CGContextConcatCTM(ctx, trnsfrm);
        CGContextBeginPath(ctx);
        CGContextAddEllipseInRect(ctx, CGRectMake(0.0, 0.0, image.size.width, image.size.height));
        CGContextClip(ctx);
        CGContextDrawImage(ctx, CGRectMake(0.0, 0.0, image.size.width, image.size.height), image.CGImage);
        finalImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
    return finalImage;
}

#define  _is_IOS7  [[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0


+(NSMutableAttributedString*)timeString:(NSString*)str_original{
    NSMutableAttributedString* attstr = [[NSMutableAttributedString alloc]initWithString:str_original];
    
    
    
    NSRange range0 = [str_original rangeOfString:@"天"];
    NSRange range1 = [str_original rangeOfString:@"时"];
    NSRange range2 = [str_original rangeOfString:@"分"];
    NSRange range3 = [str_original rangeOfString:@"秒"];
    
//    NSLog(@"%@  %@  %@  %@ ",NSStringFromRange(range0),NSStringFromRange(range1),NSStringFromRange(range2),NSStringFromRange(range3));
    
    
    if (_is_IOS7) {
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value:(id)[UIColor redColor].CGColor range:NSMakeRange(0, str_original.length)];//用kct开头没用，只好用ns开头的。
        [attstr addAttribute:(NSString *)NSFontAttributeName value:(id)[UIFont systemFontOfSize:14] range:NSMakeRange(0, str_original.length)];
        
        
        
        
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value:(id)[UIColor blackColor].CGColor range:range0];
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value:(id)[UIColor blackColor].CGColor range:range1];
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value:(id)[UIColor blackColor].CGColor range:range2];
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value:(id)[UIColor blackColor].CGColor range:range3];
        
        
    }else{
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, str_original.length)];//用kct开头没用，只好用ns开头的。
        
        
        [attstr addAttribute:(NSString *)NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, str_original.length)];
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value:[UIColor blackColor] range:range0];
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value:[UIColor blackColor] range:range1];
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value:[UIColor blackColor] range:range2];
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value:[UIColor blackColor] range:range3];
    }
    
    
    
    return [attstr autorelease];
}

+(NSMutableAttributedString*)rateString:(NSString*)str_original{
    
    
    NSMutableAttributedString* attstr = [[NSMutableAttributedString alloc]initWithString:str_original];
    
    
    
    NSRange range0 = [str_original rangeOfString:@"%"];
   
    if (_is_IOS7) {
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value:(id)[UIColor redColor].CGColor range:NSMakeRange(0, str_original.length)];//用kct开头没用，只好用ns开头的。
    }else{
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, str_original.length)];//用kct开头没用，只好用ns开头的。
    }
    
    if (_is_IOS7) {
        [attstr addAttribute:(NSString *)NSFontAttributeName value:(id)[UIFont systemFontOfSize:14] range:NSMakeRange(0, str_original.length)];
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value:(id)[UIColor blackColor].CGColor range:range0];
        
    }else{
        [attstr addAttribute:(NSString *)NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, str_original.length)];
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value:[UIColor blackColor] range:range0];
        
    }
    
    
    return [attstr autorelease];
    
}

 

@end
