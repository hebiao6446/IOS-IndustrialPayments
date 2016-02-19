//
//  ProductDescriptionViewController.m
//  IndustrialPayments
//
//  Created by May Peach & He Biao on 14-9-4.
//  Copyright (c) 2014年 Hebiao. All rights reserved.
//

#import "ProductDescriptionViewController.h"

#import "HeadFile.h"


@interface ProductDescriptionViewController ()

@end

@implementation ProductDescriptionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title=@"产品描述";
    
    
    mutableDic=[[NSMutableDictionary alloc] init];
    
    
    
    
    table=[[UITableView alloc] init];
    //    35
    table.frame=CGRectMake(0, 0,320, 44*8);
    table.delegate=self;
    table.dataSource=self;
    table.backgroundColor=[UIColor whiteColor];
    table.separatorColor=RGBA(181, 181, 181, 1);
    if(ISIOS7LATER){
        table.separatorInset=UIEdgeInsetsMake(0, 20, 0, 0);
    }else{
        table.backgroundView=nil;
        table.backgroundColor=nil;
    }
    table.showsVerticalScrollIndicator=NO;
    [self.view addSubview:table];
    
    
    _refreshHeaderView = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f - table.bounds.size.height, self.view.frame.size.width, table.bounds.size.height)];
    _refreshHeaderView.delegate = self;
    [table addSubview:_refreshHeaderView];
    [_refreshHeaderView refreshLastUpdatedDate];
    
    
    // Do any additional setup after loading the view.
    
    
    
    
    
    
    [self getViewData];
}
-(void)reloadTableViewDataSource{
    
    fromReload=YES;
    
    _reloading = YES;
    
    [self getViewData];
    
    
    //    [table reloadData];
    
    
    
    
    
	
}

- (void)doneLoadingTableViewData{
    
	_reloading = NO;
	[_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:table];
	
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    
    _refreshHeaderView.delegate = self;
    
    
	
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    
  
    
    
    [_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
    
    
    
    
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
    
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    
    
    [_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
    
    
    
}

- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view{
    [self reloadTableViewDataSource];
    
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view{
	return _reloading; // should return if data source model is reloading
}

- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view{
	return [NSDate date]; // should return date data source was last changed
}

-(void)getViewData{
    
    
    
    
    
    
    
    
    
    
    
    self.httpRequest=[ASIFormDataRequest requestWithURL:[NSURL URLWithString:GETPRODUCTOTHERDATA_17]];
    [self.httpRequest setDelegate:self];
    [self.httpRequest setRequestMethod:@"POST"];
    [self.httpRequest setDefaultResponseEncoding:NSUTF8StringEncoding];
    [self.httpRequest setPostValue:@(self.productId) forKey:@"product.productId"];
    [self.httpRequest setDidStartSelector:@selector(startGetData:)];
    [self.httpRequest setDidFinishSelector:@selector(finishGetData:)];
    [self.httpRequest setDidFailSelector:@selector(failGetData:)];
    [self.httpRequest startAsynchronous];
    
    
}

-(void)startGetData:(ASIFormDataRequest *)sender{
    
    [StaticFunction addAlertView:self.view msg:@"请稍后..."];
    
    
    
 
    [mutableDic removeAllObjects];
    
    
    
}
-(void)finishGetData:(ASIFormDataRequest *)sender{
    [StaticFunction removeAlertView:self.view];
    
    
    
    
    
    NSDictionary *data=[HttpRequestDic JsonData:sender];
    
    
    
    
    
    
    if ([HttpRequestDic isOkStatus:data]) {
        
    
        
        
        
        
        
        [mutableDic setDictionary:data];
        [table reloadData];
        
        

        
        
        
        
        
        
        
        
        
        
    }else{
        
        
        
        
        
        [StaticFunction alertView:self.view msg:data[@"msg"]];
        
    }
    
    
    if (fromReload) {
        
        [self doneLoadingTableViewData];
        
        
        //        [StaticFunction alertView:self.view msg:@"刷新成功"];
        
    }
}
-(void)failGetData:(ASIFormDataRequest *)sender{
    
    [StaticFunction removeAlertView:self.view];
    
    
    
    if (fromReload) {
        
        [self doneLoadingTableViewData];
        
        
        //          [StaticFunction alertView:self.view msg:REQUEST_FAIL_MSG];
        
    }
    
    
}



-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    
    
    
    return 0;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
    return 44;
    
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    
    return 8;
    
    
    
    
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *CellIdentifier = @"Cell";
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"]autorelease];
    }
    
    cell.backgroundColor=[UIColor whiteColor];
    
    
    
    //    cell.selectedBackgroundView = [[[UIView alloc] initWithFrame:cell.frame] autorelease];
    //    cell.selectedBackgroundView.backgroundColor = CELL_BACKGROUDN_COLOR;
    
    //    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    
    NSDictionary *data=[NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cell2" ofType:@"plist"]][indexPath.row];
    
    
    
    UILabel *labelKey=[[UILabel alloc] init];
    labelKey.backgroundColor=[UIColor clearColor];
    labelKey.textColor=[UIColor lightGrayColor];
    labelKey.font=[UIFont systemFontOfSize:15];
    labelKey.frame=CGRectMake(20, 0, 140, 44);
    labelKey.text=data[@"value1"];
    [cell addSubview:labelKey];
    [labelKey release];

    
    
    UILabel *labelValue=[[UILabel alloc] init];
    labelValue.backgroundColor=[UIColor clearColor];
    labelValue.textColor=[UIColor grayColor];
    labelValue.font=[UIFont systemFontOfSize:15];
    labelValue.textAlignment=NSTextAlignmentRight;
    labelValue.frame=CGRectMake(160, 0, 140, 44);
      if ([mutableDic count]>0) {
          labelValue.text=mutableDic[data[@"value2"]];
      }
    [cell addSubview:labelValue];
    [labelValue release];
    

    
    
    
    return cell;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    
}


-(void)dealloc{
    
    [table release];table=nil;
    
    
    [_refreshHeaderView release];_refreshHeaderView=nil;
    
  
    
    
    
    
    [mutableDic release];mutableDic=nil;
    
    
    
    
    

    
    [super dealloc];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
