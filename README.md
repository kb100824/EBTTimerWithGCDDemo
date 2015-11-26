# 倒计时或者短信验证码

#1把EBTButtonCountDownTimer.h和.m文件导入工程

#2 在xib或者sb界面拖一个Button按钮，然后把其class设置为"EBTButtonCountDownTimer"。并托线条设置其相关属性即可实现。

#3 操作步骤

@property (weak, nonatomic) IBOutlet EBTButtonCountDownTimer *MinuteSecondBtn;

@property (weak, nonatomic) IBOutlet EBTButtonCountDownTimer *SecondBtn;


/**
 *  按分秒格式显示倒计时
 *
 *  @param sender
 */
- (IBAction)btnClick:(EBTButtonCountDownTimer *)sender {
    
    sender.countDownTime = 100;
    sender.countDownTimeType = EBTCountDownTimeTypeMinutesAndSeconds;
    [sender startCountDownTimer];
    
    
    
}
/**
 *  按秒格式显示倒计时
 *
 *  @param sender
 */

- (IBAction)secondBtnClick:(EBTButtonCountDownTimer *)sender
{
    sender.countDownTime = 100;
    sender.countDownTimeType = EBTCountDownTimeTypeSeconds;
    [sender startCountDownTimer];
    
    
}
/**
 *  停止倒计时
 *
 *  @param sender
 */

- (IBAction)btnStopClick:(UIButton *)sender
{
    
    
    [_MinuteSecondBtn stopCountDownTimer];
    [_SecondBtn stopCountDownTimer];
    
    
    
    
}
#效果图

[!Image]()

