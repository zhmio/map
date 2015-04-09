//
//  ScenicDetailViewController.m
//  Map
//
//  Created by 郑泓 on 15-3-8.
//  Copyright (c) 2015年 zh. All rights reserved.
//

#import "ScenicDetailViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <QuartzCore/QuartzCore.h>

@interface ScenicDetailViewController () {
    AVAudioPlayer *audioPlayer;
}

@end

@implementation ScenicDetailViewController

@synthesize playButton, textView, moreLabel, scrollHeight;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [playButton setBackgroundImage:[UIImage imageNamed:@"play.png"] forState:UIControlStateNormal];
    [playButton setBackgroundImage:[UIImage imageNamed:@"stop.png"] forState:UIControlStateSelected];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [textView addGestureRecognizer:tap];
    textView.text = @"黄山简介：黄山雄踞风景秀丽的安徽南部，是我国最著名的山岳风景区之一。黄山集名山之长：泰山之雄伟，华山之险峻，衡山之烟云，庐山之飞瀑，雁荡山之巧石，峨眉山之清凉。明代旅行家、地理学家， 徐霞客两游黄山，赞叹说：“登黄山天下无山，观止矣！”又留“五岳归来不看山，黄山归来不看岳”的美誉。更有“天下第一奇山”之称。可以说无峰不石，无石 不松，无松不奇，并以 奇松、怪石、云海、温泉 黄山四绝著称于世。其二湖，三瀑，十六泉，二十四溪相映争辉。春、夏、秋、冬四季景色各异。黄山还兼有“天然动物园和天下植物园”的美称，有植物近1500种，动物500多种。黄山处于亚热带季风气候区内，地处中亚热带北缘、常绿阔叶林、红壤黄壤地带。由于山高谷深，气候呈垂直变化。同时由于北坡和南坡受阳光的辐射差大，局部地形对其气候起主导作用，形成云雾多、湿度大、降水多的气候特点，接近于海洋性气候，夏无酷暑，冬少严寒，四季平均温度差仅20摄氏度左右。夏季最高气温27℃，冬季最低气温－22℃，年均气温7.8°C，夏季平均温度为25℃，冬季平均温度为0℃以上。年平均降雨日数183天，多集中于4-6月，山上全年降水量为2395mm。西南风、西北风频率较大，年平均降雪日数49天。";

    CGRect bezierRect = CGRectMake(self.view.frame.size.width - moreLabel.frame.size.width, 0, moreLabel.frame.size.width, textView.frame.size.height);
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:bezierRect cornerRadius:0.3];
    textView.textContainer.exclusionPaths = @[bezierPath];
    textView.layer.borderColor = [UIColor darkGrayColor].CGColor;
    textView.layer.borderWidth = .3f;
    [self.view bringSubviewToFront:moreLabel];
    scrollHeight.constant = [[UIScreen mainScreen] bounds].size.height - 64.0f - 49.0f;
}

- (void)close:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tap:(id)sender {
    CGRect textRect = textView.frame;
    if (!moreLabel.hidden) {
        CGSize maxSize = CGSizeMake(textRect.size.width, CGFLOAT_MAX);
        maxSize = [textView sizeThatFits:maxSize];
        textView.frame = CGRectMake(textRect.origin.x, textRect.origin.y, maxSize.width, maxSize.height);
        moreLabel.hidden = YES;
        UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectZero cornerRadius:0.3];
        textView.textContainer.exclusionPaths = @[bezierPath];
        scrollHeight.constant = textRect.origin.y + maxSize.height;
    } else {
        textView.frame = CGRectMake(textRect.origin.x, textRect.origin.y, textRect.size.width, 60);
        CGRect bezierRect = CGRectMake(self.view.frame.size.width - moreLabel.frame.size.width, 0, moreLabel.frame.size.width, textView.frame.size.height);
        UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:bezierRect cornerRadius:0.3];
        textView.textContainer.exclusionPaths = @[bezierPath];
        moreLabel.hidden = NO;
        scrollHeight.constant = [[UIScreen mainScreen] bounds].size.height - 64.0f - 49.0f;
    }
}

- (IBAction)btnClick:(id)sender {
    UIButton *btn = (UIButton *)sender;
    if (!btn.selected) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"apple" ofType:@"mp3"];
        NSURL *url = [NSURL URLWithString:path];
        NSError *error;
        audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
        [audioPlayer play];
        btn.selected = YES;
    } else {
        [audioPlayer stop];
        btn.selected = NO;
    }
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
