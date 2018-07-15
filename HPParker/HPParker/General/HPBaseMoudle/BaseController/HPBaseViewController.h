//
//  HPBaseViewController.h
//  HadsomParkerForDriver
//
//  Created by mac on 2018/7/14.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HPBaseViewController : UIViewController


/**
 设置界面nav的右侧按钮图片名称

 @param imageName 图片名称字符串
 */
-(void)setNavRightBarItemWithImageName:(NSString *)imageName;

/**
 设置界面nav的右侧按钮图片标题

 @param titleName 标题
 */
-(void)setNavRightBarItemWithTitleName:(NSString *)titleName;
/**
 nav右侧按钮点击相应
 
 @param sender 按钮
 */
-(void)rightBarItemAction:(UIBarButtonItem *)sender;

@end
