//
//  ClipViewPage.m
//  Map
//
//  Created by 郑泓 on 15-3-7.
//  Copyright (c) 2015年 zh. All rights reserved.
//

#import "ClipViewPage.h"
#import "NewsDetailViewController.h"

@interface ClipViewPage ()

@end

@implementation ClipViewPage

@synthesize clipPageControl, clipScrollView, delegate, currentPage, clipViewsFrames, scaleX, scrollWidth, contentView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    int pageCount = 3;
    CGRect scrollViewFrame = clipScrollView.frame;
    clipScrollView.pagingEnabled = YES;
    clipScrollView.contentSize = CGSizeMake(scrollViewFrame.size.width * pageCount, 0);
    clipScrollView.showsHorizontalScrollIndicator = NO;
    clipScrollView.showsVerticalScrollIndicator = NO;
    clipPageControl.numberOfPages = pageCount;
    [self createPage];
    [clipScrollView setContentOffset:CGPointMake(scrollViewFrame.size.width * currentPage, 0)];
    scrollWidth.constant = scrollViewFrame.size.width * contentView.subviews.count;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createPage {
    UIImageView *clipImage1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"clip1.png"]];
    UIImageView *clipImage2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"clip2.png"]];
    UIImageView *clipImage3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"clip0.png"]];
    clipImage1.tag = 0;
    clipImage2.tag = 1;
    clipImage3.tag = 2;
    clipImage1.userInteractionEnabled = YES;
    clipImage2.userInteractionEnabled = YES;
    clipImage3.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:delegate action:@selector(tap:)];
    [clipImage1 addGestureRecognizer:tap];
    tap = [[UITapGestureRecognizer alloc] initWithTarget:delegate action:@selector(tap:)];
    [clipImage2 addGestureRecognizer:tap];
    tap = [[UITapGestureRecognizer alloc] initWithTarget:delegate action:@selector(tap:)];
    [clipImage3 addGestureRecognizer:tap];
    [self loadScrollViewWithPage:clipImage1];
    [self loadScrollViewWithPage:clipImage2];
    [self loadScrollViewWithPage:clipImage3];
}

- (void)loadScrollViewWithPage:(UIImageView *)imageView {
    NSInteger count = contentView.subviews.count;
    CGSize scrollViewSize = clipScrollView.bounds.size;
    CGSize clipViewsSize = [clipViewsFrames[count] CGRectValue].size;
    imageView.frame = CGRectMake(scrollViewSize.width * count, 0, clipViewsSize.width * scaleX, clipViewsSize.height * scaleX);
    NSLog(@"%f -- %f -- %f -- %f", clipViewsSize.width, clipViewsSize.width*scaleX, clipViewsSize.height, clipViewsSize.height*scaleX);
    imageView.center = CGPointMake(scrollViewSize.width/2 + scrollViewSize.width * count, scrollViewSize.height/2);
    [contentView addSubview:imageView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat pageWidth = scrollView.bounds.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    clipPageControl.currentPage = page;
}

- (IBAction)changePage:(id)sender {
    NSInteger page = clipPageControl.currentPage;
    CGRect frame = clipScrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [clipScrollView scrollRectToVisible:frame animated:YES];
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
