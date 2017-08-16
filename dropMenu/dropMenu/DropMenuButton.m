//
//  DropMenuButton.m
//  dropMenu
//
//  Created by dpq on 16/10/17.
//  Copyright © 2016年 dpq. All rights reserved.
//

#import "DropMenuButton.h"
#import "SDAutoLayout.h"

@implementation DropMenuButton
{
   UIImageView *_icon;
}


-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

- (void) initView {
    _button = [UIButton buttonWithType:UIButtonTypeSystem];
    _button.titleLabel.font = [UIFont systemFontOfSize:12.f];
    [_button setTitleColor:C_MAIN_COLOR forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
 
    _button.titleLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:_button];
    _button.sd_layout.leftSpaceToView(self,15).topEqualToView(self).bottomEqualToView(self).rightSpaceToView(self,15);
    
    _icon = [[UIImageView alloc] init];
    _icon.contentMode = UIViewContentModeCenter;
    _icon.image = [UIImage imageNamed:@"service_icon_open"];
    _icon.transform = CGAffineTransformMakeRotation(0);
    [self addSubview:_icon];
    _icon.sd_layout.rightSpaceToView(self,10).heightIs(10.f).widthIs(10.f).topSpaceToView(self,(self.bounds.size.height - 10) / 2);
}

- (void) buttonAction:(UIButton *) sender {
    _bClicked = !_bClicked;
    [UIView animateWithDuration:.3f animations:^{
        if (_bClicked) {
            [sender setTitleColor:C_MAIN_COLOR forState:UIControlStateNormal];
            _icon.transform = CGAffineTransformMakeRotation(M_PI * 1);
        }else{
            [sender setTitleColor:C_MAIN_COLOR forState:UIControlStateNormal];
            _icon.transform = CGAffineTransformMakeRotation(0);
        }
    }];
    
    if (_clicked) {
        _clicked(self);
    }
}

-(void)setBClicked:(BOOL)bClicked{
    _bClicked = bClicked;
    [UIView animateWithDuration:.3f animations:^{
        if (_bClicked) {
            [_button setTitleColor:C_MAIN_COLOR forState:UIControlStateNormal];
            _icon.transform = CGAffineTransformMakeRotation(M_PI * 1);        }else{
                [_button setTitleColor:C_MAIN_COLOR forState:UIControlStateNormal];
                _icon.transform = CGAffineTransformMakeRotation(0);
            }
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
