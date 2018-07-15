//
//  HPHomePageViewController.m
//  HadsomParkerForDriver
//
//  Created by mac on 2018/7/14.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "HPHomePageViewController.h"
#import "HPSJSySActionView.h"
#import "HPSJBaiduMapView.h"
#import "HPSJVerticalSegmenView.h"
#import "HPMessageListViewController.h"



@interface HPHomePageViewController ()<HPSJVerticalSegmenViewDelegate>

@property (nonatomic, strong) HPSJSySActionView * sysActionView;

@property (nonatomic, strong) HPSJBaiduMapView * baiduMapView;

@property (nonatomic, strong) HPSJVerticalSegmenView * typeSegment;
@property (nonatomic, strong) HPSJVerticalSegmenView * bigSegment;

@property (nonatomic, strong) UISearchBar * searchBar;

@end

@implementation HPHomePageViewController

-(HPSJVerticalSegmenView *)typeSegment
{
    if (!_typeSegment)
    {
        _typeSegment = [[HPSJVerticalSegmenView alloc] initWithFrame:CGRectMake(MainScreen.width - 60, 100, 50, 120) actionTitleArray:@[@"个人",@"商业",@"公共"]];
        _typeSegment.delegate = self;
    }
    return _typeSegment;
}

-(HPSJVerticalSegmenView *)bigSegment
{
    if (!_bigSegment)
    {
        _bigSegment = [[HPSJVerticalSegmenView alloc] initWithFrame:CGRectMake(MainScreen.width - 60, 300, 50, 80) actionTitleArray:@[@"+",@"-"]];
        _bigSegment.delegate = self;
    }
    return _bigSegment;
}

-(void)viewWillAppear:(BOOL)animated
{
    self.baiduMapView.mapView.delegate = self.baiduMapView;
    [self.baiduMapView.mapView viewWillAppear];
}

-(void)viewDidDisappear:(BOOL)animated
{
    self.baiduMapView.mapView.delegate = nil;
    [self.baiduMapView.mapView viewWillDisappear];
}

-(HPSJBaiduMapView *)baiduMapView
{
    if (!_baiduMapView)
    {
        _baiduMapView = [[HPSJBaiduMapView alloc] initWithFrame:CGRectMake(0, 0, MainScreen.width, MainScreen.height  - 83 - 110)];
    }
    return _baiduMapView;
}

-(HPSJSySActionView *)sysActionView
{
    if (_sysActionView == nil)
    {
        _sysActionView = [[HPSJSySActionView alloc] initWithFrame:CGRectMake(0, MainScreen.height - 150 - 83, MainScreen.width, 150)];
    }
    return _sysActionView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    [self.view addSubview:self.sysActionView];
    
    UISegmentedControl * seg = [UISegmentedControl alloc] ;
    
    
    [self setUpMapView];
    [self setNavRightBarItemWithTitleName:@"消息"];
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, MainScreen.width - 56 - 56, 40)];
    self.searchBar.searchBarStyle = UISearchBarStyleProminent;
    self.searchBar.placeholder = @"请输入";
    self.navigationItem.titleView  = self.searchBar;
}
-(void)setUpMapView
{
//    if ([HPTools isCurrentLanguageIsChiniese])
    {
        [self.view addSubview:self.baiduMapView];
        [self.view bringSubviewToFront:self.sysActionView];
        
    }
    [self.view addSubview:self.typeSegment];
    [self.view addSubview:self.bigSegment];

    
}

-(void)rightBarItemAction:(UIBarButtonItem *)sender
{
    HPMessageListViewController * messageListVc = [HPMessageListViewController new];
    messageListVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:messageListVc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
