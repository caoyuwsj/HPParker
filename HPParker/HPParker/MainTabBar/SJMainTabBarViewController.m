//
//  SJMainTabBarViewController.m
//  HadsomParkerForDriver
//
//  Created by mac on 2018/7/14.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "SJMainTabBarViewController.h"
#import "HPHomePageViewController.h"
#import "HPSJFindParkPageViewController.h"
#import "HPSJServicePageViewController.h"
#import "HPSJMyCenterPageViewController.h"

@interface SJMainTabBarViewController ()

@property (nonatomic, strong) HPHomePageViewController * homePageVc;
@property (nonatomic, strong) HPSJFindParkPageViewController * finParkVc;
@property (nonatomic, strong) HPSJServicePageViewController * serviceVc;
@property (nonatomic, strong) HPSJMyCenterPageViewController * myCenterVc;

@end

@implementation SJMainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.homePageVc = [HPHomePageViewController new];
    self.homePageVc.title = @"首页";
    UINavigationController * homeNav = [[UINavigationController alloc] initWithRootViewController:self.homePageVc];
    
    self.finParkVc = [HPSJFindParkPageViewController new];
    self.finParkVc.title = @"查找";
    UINavigationController * findNav = [[UINavigationController alloc] initWithRootViewController:self.finParkVc];
    
    self.serviceVc = [HPSJServicePageViewController new];
    self.serviceVc.title = @"服务";
    UINavigationController * seviceNav = [[UINavigationController alloc] initWithRootViewController:self.serviceVc];
    
    self.myCenterVc = [HPSJMyCenterPageViewController new];
    self.myCenterVc.title = @"我的";
    UINavigationController * myNav = [[UINavigationController alloc] initWithRootViewController:self.myCenterVc];
    
    self.viewControllers = @[homeNav,findNav,seviceNav,myNav];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
