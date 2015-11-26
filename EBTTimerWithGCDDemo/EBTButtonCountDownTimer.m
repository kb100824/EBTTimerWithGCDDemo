//
//  EBTButtonCountDownTimer.m
//  EBTTimerWithGCDDemo
//
//  Created by ebaotong on 15/11/25.
//  Copyright © 2015年 com.csst. All rights reserved.
//
#define kWeakSelf(weakSelf)  __weak __typeof(self)weakSelf = self
//红色按钮正常状态  #ec5d5f
#define kButtonRedNormalColor [UIColor colorWithRed:0.894 green:0.271 blue:0.278 alpha:1.000]
//红色按钮点击状态  #c01c26
#define kButtonRedClickedColor [UIColor colorWithRed:0.72 green:0.1 blue:0.13 alpha:1]
//红色按钮失效下的颜色 #808080
#define kButtonDisabledGrayColor [UIColor colorWithWhite:0.427 alpha:1.000]

#define kButtonWhiteNormalColor [UIColor colorWithWhite:1.000 alpha:1.000]

#import "EBTButtonCountDownTimer.h"

@interface EBTButtonCountDownTimer ()
{

    __block NSInteger countDownCount; //倒计时时间
    dispatch_source_t sourceTimer;
    
    
}
@end


@implementation EBTButtonCountDownTimer
/**
 *  使用颜色来充当背景图
 *
 *  @param color
 *
 *  @return
 */
- (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (void)awakeFromNib
{
    [self setBackgroundImage:[self imageWithColor:kButtonRedNormalColor]
                    forState:UIControlStateNormal];
    [self setBackgroundImage:[self imageWithColor:kButtonRedClickedColor]
                    forState:UIControlStateHighlighted];
    [self setBackgroundImage:[self imageWithColor:kButtonDisabledGrayColor]
                    forState:UIControlStateDisabled];
    [self setTitleColor:kButtonWhiteNormalColor forState:UIControlStateNormal];
     self.layer.cornerRadius = 3.f;
     self.layer.masksToBounds = YES;
     [self.titleLabel setFont:[UIFont systemFontOfSize:14.f]];
     [self setTitle:@"获取验证码" forState:UIControlStateNormal];
}
- (void)setCountDownTime:(NSInteger)countDownTime
{
    _countDownTime = countDownTime;
    countDownCount = _countDownTime;
}
- (void)setCountDownTimeType:(EBTCountDownTimeType)countDownTimeType
{
    _countDownTimeType = countDownTimeType;
}
- (void)startCountDownTimer
{
    kWeakSelf(weakSelf);
    dispatch_queue_t queue = dispatch_queue_create(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    sourceTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(sourceTimer, dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(sourceTimer, ^{
        
        if (countDownCount <= 0)
        {
            [self stopCountDownTimer];
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.enabled = YES;
                [weakSelf setTitle:@"重新获取" forState:UIControlStateNormal];
                
            });
            
        }
        else
        {
            NSInteger minutes = countDownCount / 60;
            NSInteger seconds = countDownCount % 60;
            NSString *strTime = nil;
            if(weakSelf.countDownTimeType == EBTCountDownTimeTypeMinutesAndSeconds)
            {
                strTime = [NSString stringWithFormat:@"剩余%ld分%ld秒",minutes, seconds];
            }
            else
            {
                strTime = [NSString stringWithFormat:@"剩余%ld秒", countDownCount];
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
             
                 weakSelf.enabled = NO;
                [weakSelf setTitle:strTime forState:UIControlStateNormal];
            });
            countDownCount--;
        
        }
        
    });
    
    dispatch_resume(sourceTimer);
    
}
- (void)stopCountDownTimer
{
    dispatch_source_cancel(sourceTimer);
    sourceTimer = nil;
    self.enabled = YES;
    [self setTitle:@"重新获取" forState:UIControlStateNormal];
}

@end
