//
//  NewsDetailViewController.h
//  Map
//
//  Created by 郑泓 on 15-3-7.
//  Copyright (c) 2015年 zh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsDetailViewController : UIViewController<UIScrollViewDelegate> {
    float scaleX;
    float scaleY;
    CGSize screenSize;
    NSArray *clipViewsFrames;
    NSArray *clipViews;
}

@property (nonatomic, strong) IBOutlet UITextView *textView;
@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) IBOutlet UIView *contentView;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *scrollWidth;

- (void)tap:(UITapGestureRecognizer *)tap;

@end
