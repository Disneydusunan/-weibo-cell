//
//  ViewController.m
//  weibo cell
//
//  Created by 谢谦 on 16/2/16.
//  Copyright © 2016年 杜苏南. All rights reserved.
//

#import "ViewController.h"
#import "weibo.h"
#import "WeiboTableViewCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSMutableArray *_weiboData;
    NSMutableArray *_weiboCell;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    
    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    // Do any additional setup after loading the view, typically from a nib.
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

-(void)initData
{
    
  
        NSString *path = [[NSBundle mainBundle]pathForResource:@"weibo.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];

    
//        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
//    for(NSDictionary *dic in array){
//        weibo *wei = [[weibo alloc]initWithDictionary:dic];
//        WeiboTableViewCell *cell = [[WeiboTableViewCell alloc]init];
//        cell.weiboModel = wei;
//        
//        [arrayM addObject:cell];
//    }
//    _weiboCell = [arrayM copy];

    
    
    _weiboData = [[NSMutableArray alloc]init];
    _weiboCell = [[NSMutableArray alloc]init];
    
    
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [_weiboData addObject:[weibo weiboWithDictionary:obj]];
        WeiboTableViewCell *cell = [[WeiboTableViewCell alloc]init];
        [_weiboCell addObject:cell];
    }];
    
    
//    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        [_weiboData addObject:[weibo weiboWithDictionary:obj]];
//        WeiboTableViewCell *cell = [[WeiboTableViewCell alloc]init];
//        [_weiboCell addObject:cell];
//        
//    }];
//

    
    
    
    
//        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:_weiboData.count];
//        for(NSDictionary *dic in array){
//            weibo *wei = [weibo weiboWithDictionary:dic];
//            WeiboTableViewCell *weiCell = [[WeiboTableViewCell alloc]init];
//            weiCell.weiboModel = wei;
//            
//            [arrayM addObject:weiCell];
//        }
//        _weiboData =[arrayM copy];
//
//    }
//    return _weiboData;
}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  _weiboData.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    WeiboTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[WeiboTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    weibo *wei = _weiboData[indexPath.row];
    cell.weiboModel = wei;
    
    
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WeiboTableViewCell *cell = _weiboCell[indexPath.row];
    cell.weiboModel = _weiboData[indexPath.row];
    
    return cell.height;

}


-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
