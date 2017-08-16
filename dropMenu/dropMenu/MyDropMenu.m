//
//  MyDropMenu.m
//  dropMenu
//
//  Created by dpq on 16/10/17.
//  Copyright © 2016年 dpq. All rights reserved.
//

#import "MyDropMenu.h"

@implementation MyDropMenu
-(instancetype)initWithFrame:(CGRect)frame titles:(NSArray *) titles views:(NSArray *) views{
    if (self = [super initWithFrame:frame]) {
        _titles = titles;
        _views = views;
        _buttons = [[NSMutableArray alloc] init];
        [self initView];
    }
    return self;
}

- (void) initView {
    if (_titles.count == 0) {
        return;
    }
    __weak typeof(self) _self = self;
    float width = self.frame.size.width / _titles.count;
    for (int i = 0; i < _titles.count; i++) {
        //按钮
        DropMenuButton *btn = [[DropMenuButton alloc] initWithFrame:CGRectMake(i * width, 0, width, self.frame.size.height)];
        [btn.button setTitle:_titles[i] forState:UIControlStateNormal];
        btn.tag = 1000 + i;
        btn.clicked = ^(DropMenuButton *sender){
            [_self buttonAction:sender];
        };
        [self addSubview:btn];
        [_buttons addObject:btn];
        
        if (i > 0 || i < _titles.count - 1) {
            //线条
            UIView *line = [[UIView alloc] initWithFrame:CGRectMake(i * width - .5f, 0, .5f, self.frame.size.height)];
            line.backgroundColor = [UIColor groupTableViewBackgroundColor];
            [self addSubview:line];
        }
    }
    //底部线条
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - .5f, self.frame.size.width, .5f)];
    line.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self addSubview:line];
}

- (void) buttonAction:(DropMenuButton *) sender{
    NSLog(@"%@",sender.button.titleLabel.text);
    int index = (int)sender.tag - 1000;
    if (_clicked) {
        _clicked(index);
    }
    if (index >= _views.count) {
        return;
    }
    for (int i = 0; i < _views.count; i++) {
        if (i == index) {
            continue;
        }
        UIView *v = _views[i];
        [v removeFromSuperview];
        DropMenuButton *btn = (DropMenuButton *)_buttons[i];
        if (btn.bClicked) {
            [btn setBClicked:NO];
        }
    }
    UIView *v = _views[index];
    if (sender.bClicked) {
        v.alpha = 0;
        [_delegate.view addSubview:v];
        [UIView animateWithDuration:.3f animations:^{
            v.alpha = 1;
        }];
    }else{
        [UIView animateWithDuration:.3f animations:^{
            v.alpha = 0;
        }];
    }
}


#pragma -mark -公开操作

- (void) setButtonTitle:(int) index title:(NSString *) title{
    if (index >= _titles.count || index < 0) {
        return;
    }
    DropMenuButton *btn = (DropMenuButton *)_buttons[index];
    [btn.button setTitle:title forState:UIControlStateNormal];
    [self hideView:index];
}

- (void) hideView:(int) index {
    if (index >= _views.count || index < 0) {
        return;
    }
    UIView *v = [_views objectAtIndex:index];
    [UIView animateWithDuration:.3f animations:^{
        v.alpha = 0;
    }];
    DropMenuButton *btn = (DropMenuButton *)_buttons[index];
    if (btn.bClicked) {
        [btn setBClicked:NO];
    }
}

//隐藏弹出视图
- (void) hideAllView {
    for (int i = 0; i < _views.count; i++) {
        UIView *v = [_views objectAtIndex:i];
        [UIView animateWithDuration:.3f animations:^{
            v.alpha = 0;
        }];
        [((DropMenuButton *)_buttons[i]) setBClicked:NO];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
