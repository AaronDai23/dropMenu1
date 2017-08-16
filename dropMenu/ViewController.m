//
//  ViewController.m
//  dropMenu
//
//  Created by mac on 2017/8/16.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ViewController.h"
#import "SelectTableView.h"
#import "MyDropMenu.h"
#define NAV_HEIGHT 64.f
#define MAIN_WIDTH          [UIScreen mainScreen].bounds.size.width
#define MAIN_HEIGHT         [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView     *_tableView;
    NSMutableArray  *_bigdataList;
    
    SelectTableView             *_qunzuView;
    SelectTableView             *_serviceView;
    SelectTableView             *_ascView;
    //参数
    NSString                    *_stuat;
    NSString                    *_serveGroupId;
}
@property (nonatomic,strong) NSMutableArray    *classArr;
@property (nonatomic,strong) NSMutableArray    *qunzuList;
@property (nonatomic,strong) NSMutableArray    *dataList;
@property (nonatomic,assign) int             pageIndex;
@property (nonatomic,strong) MyDropMenu      *dropMenu;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化请求参数
    self.title = @"筛选视图";
    _bigdataList = [[NSMutableArray alloc] init];
    _qunzuList = [[NSMutableArray alloc] init];
    _dataList = [[NSMutableArray alloc] init];
    _classArr = [[NSMutableArray alloc] init];
    _pageIndex = 1;
    
    [self initData];
    [self initView];
    
}
- (void)initData{
    for (int i = 0; i < 6; i++) {
        if (i == 0) {
            [_qunzuList addObject:@"全部群组"];
            continue;
        }
        [_qunzuList addObject:[NSString stringWithFormat:@"群组%d",i]];
    }
    for (int i = 0; i < 6; i++) {
        [_classArr addObject:[NSString stringWithFormat:@"状态%d",i]];
    }
    
   
  }
- (void) initView {
    __weak typeof(self) _self = self;
    //筛选视图
  
    _qunzuView = [[SelectTableView alloc] initWithFrame:CGRectMake(0, NAV_HEIGHT + 35.f, MAIN_WIDTH, MAIN_HEIGHT - NAV_HEIGHT - 35.f)  dataList:_qunzuList];
    _qunzuView.backgroundClicked = ^(void){
        [_self.dropMenu hideView:0];
    };
    _qunzuView.clicked = ^(int index){
        NSString *model = _self.qunzuList[index];
        [_self.dropMenu setButtonTitle:0 title:model];
        };
    
    //状态
    _serviceView = [[SelectTableView alloc] initWithFrame:_qunzuView.frame dataList:_classArr];
    _serviceView.backgroundClicked = ^(void){
        [_self.dropMenu hideView:1];
    };
    _serviceView.clicked = ^(int index){
        NSString *status = _self.classArr[index];
        [_self.dropMenu setButtonTitle:1 title:status];
    };
    
    //筛选
    _dropMenu = [[MyDropMenu alloc]initWithFrame:CGRectMake(0, NAV_HEIGHT, MAIN_WIDTH, 35.f)
                                          titles:@[@"全部群组",@"状态"]
                                           views:@[_qunzuView,_serviceView]];
    _dropMenu.delegate = self;
    [self.view addSubview:_dropMenu];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
