//
//  HPSJVerticalSegmenView.m
//  HPParker
//
//  Created by mac on 2018/7/15.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "HPSJVerticalSegmenView.h"

@implementation HPSJVerticalSegmenView

-(instancetype)initWithFrame:(CGRect)frame actionTitleArray:(NSArray *)actionTitleArray
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.actionTitleArray = actionTitleArray;
        CGFloat btnW = frame.size.width;
        CGFloat btnH = frame.size.height/3.0;
        self.backgroundColor = [UIColor whiteColor];
        
        for (NSInteger i = 0 ; i<actionTitleArray.count; i++)
        {
            UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(0, btnH * i, btnW, btnH)];
            [btn setTitle:actionTitleArray[i] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            btn.tag = i + 100;
            [btn addTarget:self action:@selector(segmentViewSelect:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
            
        }
        
    }
    return self;
}
-(void)segmentViewSelect:(UIButton *)sender
{
    for (UIButton * btn in self.subviews)
    {
        btn.selected = NO;
    }
    NSInteger index = sender.tag - 100;
    sender.selected = YES;
    if ([self.delegate respondsToSelector:@selector(segmenView:selectIndex:)])
    {
        [self.delegate segmenView:self selectIndex:index];
    }
    
}


@end
