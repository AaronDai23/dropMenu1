//
//  DropMenuButton.h
//  dropMenu
//
//  Created by dpq on 16/10/17.
//  Copyright © 2016年 dpq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DropMenuButton : UIButton
@property (nonatomic,assign) BOOL bClicked;
@property (nonatomic,strong) UIButton *button;

@property (nonatomic,copy) void(^clicked) (DropMenuButton *sender);
@end
