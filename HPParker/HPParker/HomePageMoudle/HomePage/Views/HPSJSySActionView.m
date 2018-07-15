//
//  HPSJSySActionView.m
//  HadsomParkerForDriver
//
//  Created by mac on 2018/7/15.
//  Copyright © 2018年 mac. All rights reserved.
// 首页带弧线扫一扫View

#import "HPSJSySActionView.h"

@implementation HPSJSySActionView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self sj_initSubViews];
    }
    return self;
}
-(void)sj_initSubViews
{
    self.backView = [[HPSJSysActionBackView alloc] initWithFrame:CGRectMake(0, 0, MainScreen.width, self.frame.size.height)];
    [self addSubview:self.backView];
    
    self.actionBtn = [UIButton new];
    [self.actionBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    self.actionBtn.backgroundColor = [UIColor yellowColor];
    [self addSubview:self.actionBtn];

    self.actionBtn.frame = CGRectMake(MainScreen.width/2.0 - 35, 40, 80, 80);

}


@end
