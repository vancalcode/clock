//
//  ClockInfoController.m
//  Clock
//
//  Created by YAN on 2017/9/13.
//  Copyright © 2017年 minstone. All rights reserved.
//
//  添加闹钟页面
#import "WallpaperController.h"

@interface WallpaperController ()

@property (strong, nonatomic) IBOutlet UILabel *timeLab;
@property (assign, nonatomic) float brightness;
@end

@implementation WallpaperController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self updateTime];
    
    //定时器 反复执行
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissController)];
    [self.view addGestureRecognizer:tap];
    
    
    // 设置屏幕常亮，默认是NO。亮度范围是0.1 - 1.0
    [UIApplication sharedApplication].idleTimerDisabled = YES;
//    [[UIScreen mainScreen] setBrightness: 0.5];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    // 获取屏幕亮度
    self.brightness = [UIScreen mainScreen].brightness;
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    // 恢复屏幕亮度
    [UIScreen mainScreen].brightness = self.brightness;
}

- (void)updateTime{
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *dataFormatter = [[NSDateFormatter alloc]init];
    [dataFormatter setDateFormat:@"HH:mm"];
    NSString *dateString = [dataFormatter stringFromDate:currentDate];
    self.timeLab.text = dateString;
}

- (void)dismissController{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
