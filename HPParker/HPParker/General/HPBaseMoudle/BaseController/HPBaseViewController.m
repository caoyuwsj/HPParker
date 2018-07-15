//
//  HPBaseViewController.m
//  HadsomParkerForDriver
//
//  Created by mac on 2018/7/14.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "HPBaseViewController.h"

@interface HPBaseViewController ()

@end

@implementation HPBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 设置界面nav的右侧按钮图片名称
 
 @param imageName 图片名称字符串
 */
-(void)setNavRightBarItemWithImageName:(NSString *)imageName
{
    if (self.navigationController )
    {
        if (imageName.length > 0)
        {
            UIBarButtonItem * rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:imageName] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarItemAction:)];
            self.navigationItem.rightBarButtonItem = rightItem;
        }
        else
        {
            self.navigationItem.rightBarButtonItem = nil;
        }
    }
    else
    {
        return;
    }
}

/**
 设置界面nav的右侧按钮图片标题
 
 @param titleName 标题
 */
-(void)setNavRightBarItemWithTitleName:(NSString *)titleName
{
    if (self.navigationController )
    {
        if (titleName.length > 0)
        {
            UIBarButtonItem * rightItem = [[UIBarButtonItem alloc] initWithTitle:titleName style:UIBarButtonItemStylePlain target:self action:@selector(rightBarItemAction:)];
            self.navigationItem.rightBarButtonItem = rightItem;
        }
        else
        {
            self.navigationItem.rightBarButtonItem = nil;
        }
    }
    else
    {
        return;
    }
}

-(void)rightBarItemAction:(UIBarButtonItem *)sender
{
    
}


@end
