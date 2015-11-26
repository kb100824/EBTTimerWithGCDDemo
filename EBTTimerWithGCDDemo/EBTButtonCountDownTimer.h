//
//  EBTButtonCountDownTimer.h
//  EBTTimerWithGCDDemo
//
//  Created by ebaotong on 15/11/25.
//  Copyright © 2015年 com.csst. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,EBTCountDownTimeType)
{
   
     EBTCountDownTimeTypeMinutesAndSeconds = 0,//倒计时按照分和秒格式显示
     EBTCountDownTimeTypeSeconds//倒计时按照秒格式显示
};


@interface EBTButtonCountDownTimer : UIButton
/**
 *  倒计时时间
 */
@property(nonatomic,assign)NSInteger countDownTime;

/**
 *  倒计时要显示的格式
 */
@property(nonatomic,assign)EBTCountDownTimeType countDownTimeType;


/**
 *  开始倒计时
 */
- (void)startCountDownTimer;
/**
 *  停止倒计时
 */
- (void)stopCountDownTimer;

@end
