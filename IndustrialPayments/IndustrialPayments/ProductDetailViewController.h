//
//  ProductDetailViewController.h
//  IndustrialPayments
//
//  Created by May Peach & He Biao on 14-9-4.
//  Copyright (c) 2014年 Hebiao. All rights reserved.
//

#import "BackBaseViewController.h"

#import "ProductDetailBarView.h"

#import "EGORefreshTableHeaderView.h"


@interface ProductDetailViewController : BackBaseViewController<ProductDetailBarViewDelegate,UITableViewDataSource,UITableViewDelegate,EGORefreshTableHeaderDelegate>{
    
    ProductDetailBarView *productDetailBarView;
    
    
    UITableView *table;
    
    
    EGORefreshTableHeaderView *_refreshHeaderView;
    
    BOOL _reloading;
    
    
    BOOL  fromReload;
    

    
    
    NSMutableDictionary *mutableDic;
    
    
    
    int remainTime;
    
    
    
}

@property int  productId;

@end
