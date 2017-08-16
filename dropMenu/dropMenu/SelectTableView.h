//
//  SelectTableView.h
//  NewGuardLife
//
//  Created by dpq on 16/10/17.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectTableView : UIView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSArray *dataList;

@property (nonatomic,copy) void(^clicked) (int index);

@property (nonatomic,copy) void(^backgroundClicked) (void);

@property (nonatomic,strong) UITableView *tableView;;
-(instancetype)initWithFrame:(CGRect)frame dataList:(NSArray *) dataList;
@end
