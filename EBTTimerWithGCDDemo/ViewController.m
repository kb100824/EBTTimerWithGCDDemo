//
//  ViewController.m
//  EBTTimerWithGCDDemo
//
//  Created by ebaotong on 15/11/25.
//  Copyright © 2015年 com.csst. All rights reserved.
//

#import "ViewController.h"
#import "EBTButtonCountDownTimer.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet EBTButtonCountDownTimer *MinuteSecondBtn;
@property (weak, nonatomic) IBOutlet EBTButtonCountDownTimer *SecondBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnClick:(EBTButtonCountDownTimer *)sender {
    
    sender.countDownTime = 100;
    sender.countDownTimeType = EBTCountDownTimeTypeMinutesAndSeconds;
    [sender startCountDownTimer];
    
    
    
}
- (IBAction)secondBtnClick:(EBTButtonCountDownTimer *)sender
{
    sender.countDownTime = 100;
    sender.countDownTimeType = EBTCountDownTimeTypeSeconds;
    [sender startCountDownTimer];
    
    
}
- (IBAction)btnStopClick:(UIButton *)sender
{
    
    
    [_MinuteSecondBtn stopCountDownTimer];
    [_SecondBtn stopCountDownTimer];
    
    
    
    
}

@end
