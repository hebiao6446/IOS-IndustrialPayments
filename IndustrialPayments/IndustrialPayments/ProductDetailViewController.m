//
//  ProductDetailViewController.m
//  IndustrialPayments
//
//  Created by May Peach & He Biao on 14-9-4.
//  Copyright (c) 2014年 Hebiao. All rights reserved.
//

#import "ProductDetailViewController.h"

#import "HeadFile.h"
#import "ProductDescriptionViewController.h"



@interface ProductDetailViewController ()

@end

@implementation ProductDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)changeRemainTime:(id)sender{
    
    
    //    NSLog(@"%@",[NSDate date]);
    
    if (remainTime<=0) {
        
        
        
        return;
    }
    
    
    remainTime--;
    
    
 
    [table reloadRowsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:2 inSection:0],nil] withRowAnimation:UITableViewRowAnimationNone];
    
    
    
    
    
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title=@"理财产品";
    [self createBarRightWithImage:@"bar30" with:60];
    
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeRemainTime:) name:NOTICE_CHANGE_REMAIN_TIME object:nil];
    
    
    mutableDic=[[NSMutableDictionary alloc] init];
    
    
    
    
    table=[[UITableView alloc] init];
    //    35
    table.frame=CGRectMake(0, 0,320, 416+(isIPhone5?88:0));
    table.delegate=self;
    table.dataSource=self;
    table.backgroundColor=[UIColor clearColor];
    table.separatorColor=RGBA(138, 158, 211, 1);
    if(ISIOS7LATER){
        table.separatorInset=UIEdgeInsetsMake(0, 0, 0, 0);
    }else{
        table.backgroundView=nil;
        table.backgroundColor=nil;
    }
    table.showsVerticalScrollIndicator=NO;
    [self.view addSubview:table];
    
 
    
    
    
    
    
    
    
    
    
    //　  table.tableFooterView=[self getTableFooter];
    
    _refreshHeaderView = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f - table.bounds.size.height, self.view.frame.size.width, table.bounds.size.height)];
    _refreshHeaderView.delegate = self;
    [table addSubview:_refreshHeaderView];
    [_refreshHeaderView refreshLastUpdatedDate];
    
    
    // Do any additional setup after loading the view.
    
    productDetailBarView=[[ProductDetailBarView alloc] init];
    productDetailBarView.delegate=self;
    [self.view addSubview:productDetailBarView];
    productDetailBarView.hidden=YES;
    
    
    
    
    [self getViewData];
    
}


-(void)showRight:(UIButton *)sender{
    
    productDetailBarView.hidden=!productDetailBarView.isHidden;
    
}
-(void)ProductDetailBarViewDidButtonClick:(NSInteger)tag{
    productDetailBarView.hidden=YES;
    
    if (tag==1) {
        ProductDescriptionViewController *pdvc=[[ProductDescriptionViewController alloc] init];
        pdvc.productId=self.productId;
        [self.navigationController pushViewController:pdvc animated:YES];
        [pdvc release];
        
        
    }
    
    
    
    
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
    
    
    productDetailBarView.hidden=YES;
   
        
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
    
    
    
    
    
    
    
    
    
    
    
    self.httpRequest=[ASIFormDataRequest requestWithURL:[NSURL URLWithString:GETPRODUCTDETAIL_16]];
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
    
    
    
    remainTime=0;
    [mutableDic removeAllObjects];
    
    
    
}
-(void)finishGetData:(ASIFormDataRequest *)sender{
    [StaticFunction removeAlertView:self.view];
    
    
    
    
    
    NSDictionary *data=[HttpRequestDic JsonData:sender];
    
    
    
    
    
    
    if ([HttpRequestDic isOkStatus:data]) {
        
        remainTime=12345677;
        
        
        
        
    
        

        
        
        
        
        
        
        
        
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
    
    
    if (indexPath.row==0) {
        return 160;
    }else if (indexPath.row==1){
        return 33;
        
        
    }else if (indexPath.row==2){
        return 120;
        
        
    }else if (indexPath.row==3){
        return isIPhone5?191:165;
        
        
    }
    
    
    return 0;
    
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    
    return 4;
    
    
    
    
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *CellIdentifier = @"Cell";
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"]autorelease];
    }
    
    cell.backgroundColor=VIEW_BACKGROUD_COLOR;
    
    
    
    //    cell.selectedBackgroundView = [[[UIView alloc] initWithFrame:cell.frame] autorelease];
    //    cell.selectedBackgroundView.backgroundColor = CELL_BACKGROUDN_COLOR;
    
    //    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    

    
    if (indexPath.row==0) {
        
    }else if (indexPath.row==1){
        
        UILabel *label1=[[UILabel alloc] init];
        label1.frame=CGRectMake(20, 0, 140, 33);
        label1.backgroundColor=[UIColor clearColor];
        label1.textColor=[UIColor redColor];
        label1.text=@"工商银行";
        label1.font=[UIFont systemFontOfSize:15];
        [cell addSubview:label1];
        [label1 release];
        
        
        
        UILabel *label2=[[UILabel alloc] init];
        label2.frame=CGRectMake(160, 0, 140, 33);
        label2.textAlignment=NSTextAlignmentRight;
        label2.backgroundColor=[UIColor clearColor];
        label2.textColor=[UIColor whiteColor];
        label2.font=[UIFont systemFontOfSize:15];
        label2.text=@"到期有222支付";
        [cell addSubview:label2];
        [label2 release];

        
    }else if (indexPath.row==2){
        
        UIImageView *imageView=[[UIImageView alloc] init];
        imageView.frame=CGRectMake(0, 0, 320, 120);
        [imageView setImage:IMAGEWITHNAME(@"image31")];
        [cell addSubview:imageView];
        [imageView release];
        
        
        
        // 利率
        UILabel *rateLabel=[[UILabel alloc] init];
        rateLabel.frame=CGRectMake(40, 15, 90, 35);
        rateLabel.backgroundColor=[UIColor clearColor];
        rateLabel.attributedText=[self rateString:@"8.4%"];
        [cell addSubview:rateLabel];
        [rateLabel release];
        
        
        /// 时间
        UILabel *timeLabel=[[UILabel alloc] init];
        timeLabel.frame=CGRectMake(40, 90, 160, 20);
        timeLabel.backgroundColor=[UIColor clearColor];
        timeLabel.attributedText=[self timeString];
        [cell addSubview:timeLabel];
        [timeLabel release];
        
        
        /// 已经售出
        UILabel *label1=[[UILabel alloc] init];
        label1.frame=CGRectMake(150, 15, 150, 23);
        label1.textAlignment=NSTextAlignmentRight;
        label1.backgroundColor=[UIColor clearColor];
        label1.attributedText=[self label1String:@"已售: 2323.3 元"];
        [cell addSubview:label1];
        [label1 release];
        
        
        
        UILabel *label2=[[UILabel alloc] init];
        label2.frame=CGRectMake(150, 15+24, 150, 23);
        label2.textAlignment=NSTextAlignmentRight;
        label2.backgroundColor=[UIColor clearColor];
        label2.attributedText=[self label2String:@"投资金额: 2323.3 元"];
        [cell addSubview:label2];
        [label2 release];
        
        
        
        UILabel *label3=[[UILabel alloc] init];
        label3.frame=CGRectMake(150, 15+24*2, 150, 23);
        label3.textAlignment=NSTextAlignmentRight;
        label3.backgroundColor=[UIColor clearColor];
        label3.attributedText=[self label3String:@"价格: 2323.3 元"];
        [cell addSubview:label3];
        [label3 release];
        
        
        
        UILabel *label4=[[UILabel alloc] init];
        label4.frame=CGRectMake(150, 15+24*3, 150, 23);
        label4.textAlignment=NSTextAlignmentRight;
        label4.backgroundColor=[UIColor clearColor];
        label4.attributedText=[self label4String:@"项目期限: 23 天"];
        [cell addSubview:label4];
        [label4 release];


        
        
    }else if (indexPath.row==3){
        
        UIImageView *imageBack=[[UIImageView alloc] init];
        imageBack.frame=CGRectMake(0, 0, 320, 90);
        [imageBack setImage:IMAGEWITHNAME(@"cellimage32")];
        [cell addSubview:imageBack];
        [imageBack release];
        
        
        UIButton *cellButton=[[UIButton alloc] init];
        cellButton.frame=CGRectMake(0, 90, 320, 50);
        [cellButton setImage:IMAGEWITHNAME(@"cellbutton33") forState:UIControlStateNormal];
        [cell addSubview:cellButton];
        [cellButton release];
        
    }
    
    
    
    
    return cell;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    
}

-(NSMutableAttributedString*)timeString{
    
    
   
    
    int day =  remainTime / (60 * 60 * 24);
    int hour = ( remainTime % (60 * 60 * 24)) / (60 * 60);
    int minute = (( remainTime % (60 * 60 * 24)) % (60 * 60)) / (60);
    int second = ((( remainTime % (60 * 60 * 24)) % (60 * 60)) % (60));
    
    
    
    
    NSString *str_original=[NSString stringWithFormat:@"%d天%d时%d分%d秒",day,hour,minute,second];
    NSMutableAttributedString* attstr = [[NSMutableAttributedString alloc]initWithString:str_original];
    
    
    
    NSRange range0 = [str_original rangeOfString:@"天"];
    NSRange range1 = [str_original rangeOfString:@"时"];
    NSRange range2 = [str_original rangeOfString:@"分"];
    NSRange range3 = [str_original rangeOfString:@"秒"];
    
 
    
    
    if (ISIOS7LATER) {
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value:(id)[UIColor redColor].CGColor range:NSMakeRange(0, str_original.length)];//用kct开头没用，只好用ns开头的。
        [attstr addAttribute:(NSString *)NSFontAttributeName value:(id)[UIFont systemFontOfSize:14] range:NSMakeRange(0, str_original.length)];
        
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value:(id)[UIColor whiteColor].CGColor range:range0];
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value:(id)[UIColor whiteColor].CGColor range:range1];
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value:(id)[UIColor whiteColor].CGColor range:range2];
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value:(id)[UIColor whiteColor].CGColor range:range3];
        
        
    }else{
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, str_original.length)];//用kct开头没用，只好用ns开头的。
        
        
        [attstr addAttribute:(NSString *)NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, str_original.length)];
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value:[UIColor whiteColor] range:range0];
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value:[UIColor whiteColor] range:range1];
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value:[UIColor whiteColor] range:range2];
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value:[UIColor whiteColor] range:range3];
    }
    
    
    
    return [attstr autorelease];
}

-(NSMutableAttributedString*)rateString:(NSString*)str_original{
    
    
    NSMutableAttributedString* attstr = [[NSMutableAttributedString alloc]initWithString:str_original];
    
    
    
    NSRange range0 = [str_original rangeOfString:@"%"];
    
    if (ISIOS7LATER) {
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value:(id)[UIColor redColor].CGColor range:NSMakeRange(0, str_original.length)];//用kct开头没用，只好用ns开头的。
        
        [attstr addAttribute:(NSString *)NSFontAttributeName value:(id)[UIFont systemFontOfSize:30] range:NSMakeRange(0, str_original.length)];
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value:(id)[UIColor blackColor].CGColor range:range0];
        [attstr addAttribute:(NSString *)NSFontAttributeName value:(id)[UIFont systemFontOfSize:22] range:range0];
        
        
    }else{
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, str_original.length)];//用kct开头没用，只好用ns开头的。
        
        [attstr addAttribute:(NSString *)NSFontAttributeName value:[UIFont systemFontOfSize:30] range:NSMakeRange(0, str_original.length)];
        
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value:[UIColor blackColor] range:range0];
        [attstr addAttribute:(NSString *)NSFontAttributeName value:[UIFont systemFontOfSize:22] range:range0];
    }
    
    
    
    
    return [attstr autorelease];
    
}

-(NSMutableAttributedString*)label1String:(NSString*)str_original{
    
    
    NSMutableAttributedString* attstr = [[NSMutableAttributedString alloc]initWithString:str_original];
    
    
    
    NSRange range0 = [str_original rangeOfString:@"已售:"];
    NSRange range1 = [str_original rangeOfString:@"元"];
    
    
    
    if (ISIOS7LATER) {
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value:(id)[UIColor redColor].CGColor range:NSMakeRange(0, str_original.length)];//用kct开头没用，只好用ns开头的。
        [attstr addAttribute:(NSString *)NSFontAttributeName value:(id)[UIFont systemFontOfSize:14] range:NSMakeRange(0, str_original.length)];
        
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value:(id) RGBA(185, 185, 185, 1).CGColor range:range0];
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value:(id) RGBA(185, 185, 185, 1).CGColor range:range1];
        
       
        
    }else{
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, str_original.length)];//用kct开头没用，只好用ns开头的。
        
        
        [attstr addAttribute:(NSString *)NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, str_original.length)];
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value: RGBA(185, 185, 185, 1) range:range0];
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value: RGBA(185, 185, 185, 1) range:range1];
        
    }
    
    
    
    return [attstr autorelease];
    
}
-(NSMutableAttributedString*)label2String:(NSString*)str_original{
    
    
    NSMutableAttributedString* attstr = [[NSMutableAttributedString alloc]initWithString:str_original];
    
 
    
    NSRange range0 = [str_original rangeOfString:@"投资金额:"];
    NSRange range1 = [str_original rangeOfString:@"元"];
    
    
    
    if (ISIOS7LATER) {
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value:(id)[UIColor redColor].CGColor range:NSMakeRange(0, str_original.length)];//用kct开头没用，只好用ns开头的。
        [attstr addAttribute:(NSString *)NSFontAttributeName value:(id)[UIFont systemFontOfSize:14] range:NSMakeRange(0, str_original.length)];
        
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value:(id) RGBA(185, 185, 185, 1).CGColor range:range0];
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value:(id) RGBA(185, 185, 185, 1).CGColor range:range1];
        
        
        
    }else{
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, str_original.length)];//用kct开头没用，只好用ns开头的。
        
        
        [attstr addAttribute:(NSString *)NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, str_original.length)];
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value: RGBA(185, 185, 185, 1) range:range0];
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value: RGBA(185, 185, 185, 1) range:range1];
        
    }
    
    
    
    return [attstr autorelease];
    
}

-(NSMutableAttributedString*)label3String:(NSString*)str_original{
    
    
    NSMutableAttributedString* attstr = [[NSMutableAttributedString alloc]initWithString:str_original];
    
    
    
    NSRange range0 = [str_original rangeOfString:@"价格:"];
    NSRange range1 = [str_original rangeOfString:@"元"];
    
    
    
    if (ISIOS7LATER) {
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value:(id)[UIColor redColor].CGColor range:NSMakeRange(0, str_original.length)];//用kct开头没用，只好用ns开头的。
        [attstr addAttribute:(NSString *)NSFontAttributeName value:(id)[UIFont systemFontOfSize:14] range:NSMakeRange(0, str_original.length)];
        
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value:(id) RGBA(185, 185, 185, 1).CGColor range:range0];
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value:(id) RGBA(185, 185, 185, 1).CGColor range:range1];
        
        
        
    }else{
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, str_original.length)];//用kct开头没用，只好用ns开头的。
        
        
        [attstr addAttribute:(NSString *)NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, str_original.length)];
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value: RGBA(185, 185, 185, 1) range:range0];
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value: RGBA(185, 185, 185, 1) range:range1];
        
    }
    
    
    
    return [attstr autorelease];
    
}

-(NSMutableAttributedString*)label4String:(NSString*)str_original{
    
    
    NSMutableAttributedString* attstr = [[NSMutableAttributedString alloc]initWithString:str_original];
    
    
    
    NSRange range0 = [str_original rangeOfString:@"项目期限:"];
    NSRange range1 = [str_original rangeOfString:@"天"];
    
    
    
    if (ISIOS7LATER) {
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value:(id)[UIColor redColor].CGColor range:NSMakeRange(0, str_original.length)];//用kct开头没用，只好用ns开头的。
        [attstr addAttribute:(NSString *)NSFontAttributeName value:(id)[UIFont systemFontOfSize:14] range:NSMakeRange(0, str_original.length)];
        
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value:(id) RGBA(185, 185, 185, 1).CGColor range:range0];
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value:(id) RGBA(185, 185, 185, 1).CGColor range:range1];
        
        
        
    }else{
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, str_original.length)];//用kct开头没用，只好用ns开头的。
        
        
        [attstr addAttribute:(NSString *)NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, str_original.length)];
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value: RGBA(185, 185, 185, 1) range:range0];
        [attstr addAttribute:(NSString *)NSForegroundColorAttributeName value: RGBA(185, 185, 185, 1) range:range1];
        
    }
    
    
    
    return [attstr autorelease];
    
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
