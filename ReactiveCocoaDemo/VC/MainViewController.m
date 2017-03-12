//
//  MainViewController.m
//  SpotlightDemo
//
//  Created by mac on 2017/2/27.
//  Copyright © 2017年 LeoAiolia. All rights reserved.
//

#import "MainViewController.h"
#import <SafariServices/SafariServices.h>
//@import SafariServices;
@interface MainViewController () <SFSafariViewControllerDelegate>

@property (strong, nonatomic) NSDictionary *dic;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary *dic = @{
                          @"百度":@"https://www.baidu.com",
                          @"新浪":@"http://www.sina.com.cn",
                          @"腾讯":@"http://www.qq.com",
                          @"网易":@"http://www.163.com",
                          };
    self.dic = dic;
    
    NSMutableArray *stackSubViews = [NSMutableArray arrayWithCapacity:0];
    for (NSInteger i = 0; i<4; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn.tag = i + 100;
        NSArray *titleArr = self.dic.allKeys;
        [btn setTitle:titleArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont boldSystemFontOfSize:14];
        [self.view addSubview:btn];
        btn.backgroundColor = CSRColor(200, 200, 200, 1);
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [stackSubViews addObject:btn];
    }
    
    UIStackView *stackView = [[UIStackView alloc] initWithArrangedSubviews:stackSubViews];
    stackView.bounds = CGRectMake(0, 0, 200, 200);
    stackView.center = self.view.center;
    //轴心，轴线 水平方向 或者 垂直方向
    stackView.axis = UILayoutConstraintAxisVertical;
    //分布 每个view的大小都相同
    stackView.distribution = UIStackViewDistributionFillEqually;
    //间隔
    stackView.spacing = 10;
    //对齐方式
    stackView.alignment = UIStackViewAlignmentFill;
    [self.view addSubview:stackView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)btnClick:(UIButton *)sender
{
    NSArray *titleArr = self.dic.allKeys;
    NSString *urlString = self.dic[titleArr[sender.tag - 100]];
    //调用safari打开内部链接
    SFSafariViewController *sfViewControllr = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:urlString]];
    sfViewControllr.delegate = self;
    [self presentViewController:sfViewControllr animated:YES completion:^{
        
    }];
    
}
#pragma mark - safariViewControllerDelegate
- (void)safariViewControllerDidFinish:(nonnull SFSafariViewController *)controller
{
    [controller dismissViewControllerAnimated:YES completion:nil];
}

@end
