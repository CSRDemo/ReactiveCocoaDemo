//
//  CSRNavigationController.m
//  SpotlightDemo
//
//  Created by mac on 2017/2/27.
//  Copyright © 2017年 LeoAiolia. All rights reserved.
//

#import "CSRNavigationController.h"

@interface CSRNavigationController ()

@end

@implementation CSRNavigationController

+ (void)initialize
{
    
    UINavigationBar *bar = [UINavigationBar appearance];
    bar.translucent = YES;
    //导航条的背景颜色
    bar.barTintColor = [UIColor whiteColor];
    //将导航条上的图标的 默认颜色 设置成白色
    [bar setTintColor:[UIColor redColor]];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:18];
    dict[NSForegroundColorAttributeName] = CSRTabBarSelectFontColor;

    [bar setTitleTextAttributes:dict];
   
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
