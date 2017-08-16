//
//  MyDropMenu.h
//  dropMenu
//
//  Created by dpq on 16/10/17.
//  Copyright © 2016年 dpq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DropMenuButton.h"
@interface MyDropMenu : UIView
@property (nonatomic,strong) NSArray *titles;
@property (nonatomic,strong) NSArray *views;
@property (nonatomic,strong) NSMutableArray *buttons;

@property (nonatomic,strong) UIViewController *delegate;

@property (nonatomic,copy) void(^clicked) (int index);

-(instancetype)initWithFrame:(CGRect)frame titles:(NSArray *) titles views:(NSArray *) views;

- (void) hideView:(int) index;

- (void) setButtonTitle:(int) index title:(NSString *) title;

@end
