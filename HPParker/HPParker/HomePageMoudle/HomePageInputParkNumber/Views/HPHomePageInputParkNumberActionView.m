//
//  HPHomePageInputParkNumberActionView.m
//  HPParker
//
//  Created by HZ1280 on 2018/7/17.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "HPHomePageInputParkNumberActionView.h"

@implementation HPHomePageInputParkNumberActionView

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

    self.inputBackView = [[UIView alloc] initWithFrame:CGRectMake(40, 50, MainScreen.width - 80, 40)];
    self.inputBackView.layer.cornerRadius = 20.0;
    self.inputBackView.layer.borderColor = [UIColor blueColor].CGColor;
    self.inputBackView.layer.borderWidth = 1.3;
    self.inputBackView.clipsToBounds = YES;
    [self.backView addSubview:self.inputBackView];

    self.inputTexField = [[UITextField alloc] init];
    self.inputTexField.frame = CGRectMake(20, 0, MainScreen.width - 120, 40);
    self.inputTexField.placeholder = @"请输入车位号";
    [self.inputBackView addSubview:self.inputTexField];


    self.actionBtn  = [UIButton new];
    self.actionBtn.frame  =CGRectMake(40, 50 + 40 +20, MainScreen.width - 80, 40);

    self.actionBtn.layer.cornerRadius = 20.0;
    self.actionBtn.clipsToBounds = YES;
    self.actionBtn.backgroundColor = [UIColor blueColor];
    [self.actionBtn setTitle:@"开始停车" forState:UIControlStateNormal];
    [self.backView addSubview:self.actionBtn];

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self endEditing:YES];
}

@end
