//
//  HPHomePageInputParkNumberActionView.h
//  HPParker
//
//  Created by HZ1280 on 2018/7/17.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HPSJSysActionBackView.h"

@interface HPHomePageInputParkNumberActionView : UIView
//带弧线背景
@property (nonatomic, strong) HPSJSysActionBackView * backView;
//输入框背景
@property (nonatomic, strong) UIView * inputBackView;
//输入框
@property (nonatomic, strong) UITextField * inputTexField;
//动作按钮
@property (nonatomic, strong) UIButton * actionBtn;

@end
