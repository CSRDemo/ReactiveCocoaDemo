//
//  CSRTabbarViewController.m
//  SpotlightDemo
//
//  Created by mac on 2017/2/27.
//  Copyright © 2017年 LeoAiolia. All rights reserved.
//

#import "CSRTabbarViewController.h"
#import "CSRNavigationController.h"


@interface CSRTabbarViewController ()

@end

@implementation CSRTabbarViewController


+ (void)initialize {
    NSDictionary  *noDic = @{
                             NSFontAttributeName:[UIFont systemFontOfSize:12],
                             NSForegroundColorAttributeName:[UIColor  darkGrayColor],
                             };
    NSDictionary  *selDic = @{
                              NSFontAttributeName:[UIFont systemFontOfSize:12],
                              NSForegroundColorAttributeName:CSRTabBarSelectFontColor
                              };
    //UI_APPEARANCE_SELECTOR  外表 出现 一但遇到该标记  表示其属性或方法 可以同一设定 设定
    UITabBarItem  *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:noDic forState:UIControlStateNormal];
    [item setTitleTextAttributes:selDic forState:UIControlStateSelected];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    
    NSArray *className = @[@"MainViewController",@"SecondViewController",@"ThreeViewController"];
    NSArray *titles = @[@"首页",@"发现",@"我的"];
    NSArray *unSelectImages = @[@"首页",@"闪电",@"我的"];
    for (NSInteger i = 0; i<className.count; i++) {
        
        Class class = NSClassFromString(className[i]);
        NSString *unselectedImage = unSelectImages[i];
        NSString *selectedImage = [NSString stringWithFormat:@"%@2",unselectedImage];
        [self setUpChildVC:[class new] withTitle:titles[i] imageNamed:unselectedImage andSelectedImageNamed:selectedImage];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - pravite Function

/**
 *  给 tabBar 上的子视图设置图标和选中图标的样式，并将其添加到父视图
 *
 *  @param childVC       子视图
 *  @param image         未选中时候的 image 样式
 *  @param selectedImage 选中的时候的 image 样式
 */
- (void)setUpChildVC:(UIViewController *)childVC withTitle:(NSString *)title imageNamed:(NSString *)image andSelectedImageNamed:(NSString *)selectedImage
{
    childVC.tabBarItem.title = title;
    childVC.navigationItem.title = title;
    childVC.tabBarItem.image = [UIImage imageNamed:image];
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithTintColor:CSRTabBarSelectFontColor];
    CSRNavigationController *nav = [[CSRNavigationController alloc] initWithRootViewController:childVC];
    [self addChildViewController:nav];
    
}

@end
