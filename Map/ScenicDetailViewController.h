//
//  ScenicDetailViewController.h
//  Map
//
//  Created by 郑泓 on 15-3-8.
//  Copyright (c) 2015年 zh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScenicDetailViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIButton *playButton;
@property (nonatomic, strong) IBOutlet UITextView *textView;
@property (nonatomic, strong) IBOutlet UILabel *moreLabel;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *scrollHeight;

- (IBAction)btnClick:(id)sender;

- (void)close:(id)sender;

@end
