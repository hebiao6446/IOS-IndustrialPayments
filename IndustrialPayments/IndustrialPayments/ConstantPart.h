//
//  ConstantPart.h
//  IndustrialPayments
//
//  Created by May Peach & He Biao on 14-8-28.
//  Copyright (c) 2014年 Hebiao. All rights reserved.
//

#define isIPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)


#define ISIOS7LATER ([[[UIDevice currentDevice] systemVersion] floatValue]>=7.0)


#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define HEXRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define HEXRGBA(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]


#define  IMAGEWITHNAME(name) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:@"png"]] 


#define REDCOLOR_HOMEDATA RGBA(250,78,78,1)
#define REDCOLOR_BUTTON RGBA(230,30,30,1)

#define VIEW_BACKGROUD_COLOR RGBA(10,96,143,1)

#define CELL_BACKGROUDN_COLOR  RGBA(242,190,43,1)


#define YELLOWCOLOR  RGBA(245, 196, 52, 1)



#define NOTICE_ENDEDITING @"notice_endediting"
#define NOTICE_CHANGE_REMAIN_TIME @"notice_change_remain_time"


#define SERVICE_TEL_NUMBER @"4000068808"

#define LINE_MAX_HEIGHT   2000000  //// 最大

#define LOADING_WORD_TEXT @"别急,服务器正在为您提供数据"

#define NO_DATA_WARN @"若无数据,请下拉重试"



#define MAIN_URL @"http://192.168.1.2/pay/api/"


/// 首页数据
#define HOMEVIEW_1 [MAIN_URL stringByAppendingString:@"billproduct/getFirstShow"]



/// 用户登录
#define USERLOGIN_2  [MAIN_URL stringByAppendingString:@"customer/login"]



/// 获取验证码
#define GETVERIFYCODE_3 [MAIN_URL stringByAppendingString:@"customer/generateVerifyCode"]



///注册
#define RIGSTER_USER_4 [MAIN_URL stringByAppendingString:@"customer/save"]

/// 重置密码
#define RESET_PASS_5 [MAIN_URL stringByAppendingString:@"customer/resetPassword"]


//  获取票据支付利率
#define GETRATE_6  [MAIN_URL stringByAppendingString:@"payment/getRate"]


// 理财列表
#define GETINCOMELIST_7 [MAIN_URL stringByAppendingString:@"billproduct/getBillProductList"]


/// 计算 收益计算器
#define INCOMECALCULATOR_8 [MAIN_URL stringByAppendingString:@"calculator/fixRateProfit"]


//// 消息
#define  MSGLIST_9 [MAIN_URL stringByAppendingString:@"message/getSysMessageList"]

/// 修改密码
#define CHANGEPASSWORD_10 [MAIN_URL stringByAppendingString:@"customer/updatePassword"]


/// 获取城市列表
#define GETCITYLIST_11 [MAIN_URL stringByAppendingString:@"customer/getAreas"]


///注册信息修改--展现
#define GETUSERINFO_12 [MAIN_URL stringByAppendingString:@"customer/updateCustomerInfo"]


//// 保存用户信息
#define SAVEUSERINFO_13 [MAIN_URL stringByAppendingString:@"customer/saveCustomerInfo"]


/// 银行列表
#define GETBANKLIST_14 [MAIN_URL stringByAppendingString:@"customer/getBanks"]


/// 获取支行 列表
#define GETSUBBANKLIST_15 [MAIN_URL stringByAppendingString:@"customer/getBanksByArea"]


/// 获取产品详情
#define GETPRODUCTDETAIL_16 [MAIN_URL stringByAppendingString:@"billproduct/getBillProductInfo"]


/// 产品其他数据
#define GETPRODUCTOTHERDATA_17 [MAIN_URL stringByAppendingString:@"billproduct/getBillProductComment"]

///定息理财 投资记录展现
#define GETPRODUCTAUCTION_18 [MAIN_URL stringByAppendingString:@"billproduct/getProductAuction"]

///我的预约 --定制
#define GETBILLBUY_19 [MAIN_URL stringByAppendingString:@"financing/BillBuy/getBillBuy"]

/// 我的预约 --融资
#define GETBILLSELL_20 [MAIN_URL stringByAppendingString:@"financing/BillSell/getBillSell"]

//  我的预约-删除-定制
#define DELETEBILLBUY_21 [MAIN_URL stringByAppendingString:@"financing/BillBuy/upBillBuy"]


//   我的预约-删除-融资
#define DELETEBILLSELL_22 [MAIN_URL stringByAppendingString:@"financing/BillSell/upBillSell"]


/// 3.7.1 我的交易--工业支付
#define GETBILLPAY_23 [MAIN_URL stringByAppendingString:@"financing/BillPayment/getBillPayment"]


//// 定息理财
#define GETBILLPRODUCT_24 [MAIN_URL stringByAppendingString:@"financing/BillProduct/getBillProduct"]


/// 上架票据
#define GETFINANCPRODUCT_25 [MAIN_URL stringByAppendingString:@"financing/FinancProduct/getFinancProduct"]

/// 出价票据
#define GETFINANCBUY_26 [MAIN_URL stringByAppendingString:@"financing/FinancProductBuy/getFinancProductBuy"]


/// // 3.7.1.1 我的交易-删除-承现支付 ---ios 工业支付删除
#define DELETEBILLPAY_27 [MAIN_URL stringByAppendingString:@"financing/BillPayment/upBillPayment"]

/// 上架票据 删除
#define DELETEBILLPAY_28 [MAIN_URL stringByAppendingString:@"financing/FinancProduct/upFinancProduct"]

/// 出价票据 删除
#define DELETEBILLPAY_29 [MAIN_URL stringByAppendingString:@"financing/FinancProductBuy/upFinancProductBuy"]

/// 定息理财 删除
#define DELETEBILLPAY_30 [MAIN_URL stringByAppendingString:@"financing/BillProduct/upBillProduct"]



///出价记录
#define GETPRICERECORD_31 [MAIN_URL stringByAppendingString:@"financing/AuctionProduct/getAuctionProduct"]


//// 获取票据数
#define GETDATACOUNT_32 [MAIN_URL stringByAppendingString:@"financing/BillCount/getBillCount"]

/// 管理票据 可用
#define MANAGEBILL_33 [MAIN_URL stringByAppendingString:@"financing/BillManage/getBillManageAvailable"]

/// 管理票据 已经售
#define MANAGEBILL_34 [MAIN_URL stringByAppendingString:@"financing/BillManage/getBillManageSold"]

/// 管理票据 冻结
#define MANAGEBILL_35 [MAIN_URL stringByAppendingString:@"financing/BillManage/getBillManageFreeze"]


/// 发布票据
#define PUBLISHBILL_36 [MAIN_URL stringByAppendingString:@"financing/saveBillRelease"]


/// 票据列表获取
#define GETBILLPAYLIST_37 [MAIN_URL stringByAppendingString:@"payment/getBills"]


/// 票据支付验证码获取
#define GETBILLPAYCODE_38 [MAIN_URL stringByAppendingString:@"bill/getSmsVerificationCode"]

// 获取税率 服务费 	// 2.3 获取票据支付服务费合计
#define GETSERVICETALL_39 [MAIN_URL stringByAppendingString:@"payment/computeBillServiceFee"]



//// 个人用户绑定银行卡
#define PERSONBINGCARD_40 [MAIN_URL stringByAppendingString:@"customer/bankcard/addBankCard"]



////我的订单
#define MYORDER_41 [MAIN_URL stringByAppendingString:@"customer/getOrderListByPage"]



/// 企业Info 详情
#define GETUSERINFO_42 [MAIN_URL stringByAppendingString:@"customer/showCustomerInfo"]


//// 上传图像
#define UPLOADUSERPHOTO_43  [MAIN_URL stringByAppendingString:@"customer/updateHeadPhoto"]


/// 提现 获取余额
#define GETUSERCASH_44  [MAIN_URL stringByAppendingString:@"customer/takeCash"]

/// 提现提交订单
#define COMMITBILL_45  [MAIN_URL stringByAppendingString:@"customer/submitTakeCash"]


//// 提交票据支付订单
#define COMMITBILLPAY_46  [MAIN_URL stringByAppendingString:@"payment/billPayment"]


//// 现金支付 税率
#define GETRATECASHPAY_47 [MAIN_URL stringByAppendingString:@"payment/computeCashServiceFee"]

