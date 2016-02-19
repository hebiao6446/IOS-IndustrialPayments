//
//  ProductDescriptionViewController.h
//  IndustrialPayments
//
//  Created by May Peach & He Biao on 14-9-4.
//  Copyright (c) 2014年 Hebiao. All rights reserved.
//

#import "BackBaseViewController.h"

#import "EGORefreshTableHeaderView.h"

@interface ProductDescriptionViewController : BackBaseViewController<UITableViewDataSource,UITableViewDelegate,EGORefreshTableHeaderDelegate>{
    
 
    
    
    UITableView *table;
    
    
    EGORefreshTableHeaderView *_refreshHeaderView;
    
    BOOL _reloading;
    
    
    BOOL  fromReload;
    
    
    
    
    NSMutableDictionary *mutableDic;
    
    
    
 
    
    
    
}

@property int  productId;


@end
