//
//  SelectTableView.m
//  NewGuardLife
//
//  Created by dpq on 16/10/17.
//  Copyright © 2016年 dpq. All rights reserved.
//

#import "SelectTableView.h"

#define CELL_HEIGHT 44.f
@implementation SelectTableView
{
   
    int          _index;
}

-(instancetype)initWithFrame:(CGRect)frame dataList:(NSArray *) dataList{
    if (self = [super initWithFrame:frame]) {
        _dataList = dataList;
        [self initView];
    }
    return self;
}

- (void) initView {
    self.backgroundColor = [[UIColor darkGrayColor] colorWithAlphaComponent:.5f];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, _dataList.count * 44.f) style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self addSubview:_tableView];
}

#pragma -mark -UITableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    NSString *model = [_dataList objectAtIndex:indexPath.row];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.textColor = [UIColor blackColor];
        cell.textLabel.font =[UIFont systemFontOfSize:14];
        //line
        if (indexPath.row < _dataList.count - 1) {
            UIView *line = [[UIView alloc] initWithFrame:CGRectMake(10.f, cell.bounds.size.height - .5f, tableView.bounds.size.width - 20.f, .5f)];
            line.backgroundColor = [UIColor blackColor];
            [cell addSubview:line];
        }
    }
    cell.textLabel.text = model;
    return cell;
}
//https://github.com/AaronDai23/dropMenu1
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    for (UITableViewCell *item in tableView.visibleCells) {
        item.textLabel.textColor = [UIColor blackColor];
    }
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.textColor = C_MAIN_COLOR;
    if (_clicked) {
        _clicked((int)indexPath.row);
    }
    ///Users/mac/Desktop/dropMenu
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (_backgroundClicked) {
        _backgroundClicked();
    }
}
- (void)setDataList:(NSArray *)dataList{
    _dataList = dataList;
    [_tableView reloadData];
}
@end
