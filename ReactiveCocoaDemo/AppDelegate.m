//
//  AppDelegate.m
//  ReactiveCocoaDemo
//
//  Created by User on 2017/2/28.
//  Copyright © 2017年 LeoAiolia. All rights reserved.
//
#import <CoreSpotlight/CoreSpotlight.h>
#import "AppDelegate.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    if ([UIDevice currentDevice].systemVersion.floatValue >= 9.0) {
        [self initSpotlight];
    }
    [self initWindow];
    
    
    return YES;
}

- (void)initWindow
{
    CGSize  windowSize = [[UIScreen mainScreen] bounds].size;
    self.window = [[UIWindow alloc] init];
    _window.backgroundColor = [UIColor redColor];
    _window.frame = CGRectMake(0, 0, windowSize.width, windowSize.height);
    self.tabBarController = [CSRTabbarViewController new];
    _window.rootViewController = self.tabBarController;
    [_window makeKeyAndVisible];
    
}

- (void)initSpotlight
{
    NSArray *titleArr = @[@"one",@"two",@"three"];
    NSArray *contentDescriptionArr = @[@"测试界面1",@"测试界面2",@"测试界面3"];
    NSArray *searchKeyArr = @[@[@"first",@"测试",@"界面1",@"one"],@[@"second",@"测试",@"界面2",@"two"],@[@"third",@"测试",@"界面3",@"three"]];
    NSArray *uniqueIdentifierArr = @[@"oneItem",@"twoItem",@"threeItem"];
    NSMutableArray *searchItems = @[].mutableCopy;
    for (NSInteger i = 0; i< titleArr.count; i ++) {
        /*应用内搜索，想搜索到多少个界面就要创建多少个set ，每个set都要对应一个item*/
        CSSearchableItemAttributeSet *firstSet = [[CSSearchableItemAttributeSet alloc] initWithItemContentType:@"Set"];
        //标题
        firstSet.title = titleArr[i];
        //详细描述
        firstSet.contentDescription = contentDescriptionArr[i];
        //关键字，
        firstSet.contactKeywords = searchKeyArr[i];
        //UniqueIdentifier每个搜索都有一个唯一标示，当用户点击搜索到得某个内容的时候，系统会调用代理方法，会将这个唯一标示传给你，以便让你确定是点击了哪一，方便做页面跳转
        //domainIdentifier搜索域标识，删除条目的时候调用的delegate会传过来这个值
        CSSearchableItem *firstItem = [[CSSearchableItem alloc] initWithUniqueIdentifier:uniqueIdentifierArr[i] domainIdentifier:nil attributeSet:firstSet];
        [searchItems addObject:firstItem];
    }
    
    [[CSSearchableIndex defaultSearchableIndex] indexSearchableItems:searchItems completionHandler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"设置失败%@",error);
            
        }else{
            NSLog(@"设置成功");
        }
    }];
}

/**
 *点击spotlight搜索到的内容，会调用此方法,userActivity.userInfo 里包含搜索内容的UniqueIdentifier
 */
- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray * _Nullable))restorationHandler{
    
    NSString *idetifier  = userActivity.userInfo[@"kCSSearchableItemActivityIdentifier"];
    NSLog(@"%@",userActivity.userInfo);
    
    if ([idetifier isEqualToString:@"oneItem"]) {
        self.tabBarController.selectedIndex = 0;
    }
    else if ([idetifier isEqualToString:@"twoItem"]){
        self.tabBarController.selectedIndex = 1;
    }
    else if ([idetifier isEqualToString:@"threeItem"]){
        self.tabBarController.selectedIndex = 2;
    }
    
    return YES;
}


#pragma mark - other
- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}


@end
