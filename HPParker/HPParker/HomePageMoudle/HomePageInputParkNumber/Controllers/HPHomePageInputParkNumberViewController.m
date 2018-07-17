//
//  HPHomePageInputParkNumberViewController.m
//  HPParker
//
//  Created by HZ1280 on 2018/7/17.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "HPHomePageInputParkNumberViewController.h"
#import "HPHomePageInputParkNumberActionView.h"

@interface HPHomePageInputParkNumberViewController ()

@property (nonatomic, strong) HPHomePageInputParkNumberActionView * inPutActionView;
@property (nonatomic, assign) CGFloat actionViewOrgY;

@end

@implementation HPHomePageInputParkNumberViewController

-(HPHomePageInputParkNumberActionView *)inPutActionView
{
    if (_inPutActionView == nil)
    {
        _inPutActionView = [[HPHomePageInputParkNumberActionView alloc] initWithFrame:CGRectMake(0, MainScreen.height - 150 - 50, MainScreen.width, 150 + 50)];
        self.actionViewOrgY = MainScreen.height - 150 - 50;
    }
    return _inPutActionView;
}

-(void)viewDidAppear:(BOOL)animated
{
    [self.inPutActionView.inputTexField becomeFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.inPutActionView];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(showKeyboard:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(hideKeyboard:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];

}



- (void)showKeyboard:(NSNotification *)noti
{
    CGRect keyBoardRect = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];

    CGFloat keBoardH = keyBoardRect.size.height;

    [UIView animateWithDuration:0.25 animations:^{

        self.inPutActionView.frame = CGRectMake(0, self.actionViewOrgY - keBoardH, MainScreen.width, 150 + 50);
    }];
}

- (void)hideKeyboard:(NSNotification *)noti
{

    [UIView animateWithDuration:0.25 animations:^{

        self.inPutActionView.frame = CGRectMake(0, self.actionViewOrgY , MainScreen.width, 150 + 50);
    }];
}
@end
