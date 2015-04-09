//
//  ClipViewPage.h
//  Map
//
//  Created by 郑泓 on 15-3-7.
//  Copyright (c) 2015年 zh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClipViewPage : UIViewController <UIScrollViewDelegate>

@property (nonatomic, strong) IBOutlet UIScrollView *clipScrollView;
@property (nonatomic, strong) IBOutlet UIPageControl *clipPageControl;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *scrollWidth;
@property (nonatomic, strong) IBOutlet UIView *contentView;
@property (nonatomic, strong) NSArray *clipViewsFrames;
@property (nonatomic, weak) id delegate;
@property (nonatomic) NSInteger currentPage;
@property (nonatomic) float scaleX;

- (IBAction)changePage:(id)sender;

@end
