//
//  NewsDetailViewController.m
//  Map
//
//  Created by 郑泓 on 15-3-7.
//  Copyright (c) 2015年 zh. All rights reserved.
//

#import "NewsDetailViewController.h"
#import "ClipViewPage.h"

@interface NewsDetailViewController () {
    //ClipViewPage *imagePage;
    UIPageControl *pageControl;
    NSInteger selectedTag;
}

@end

@implementation NewsDetailViewController

@synthesize textView, scrollView, contentView, scrollWidth;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    screenSize = self.view.bounds.size;
    scaleX = screenSize.width / 100;
    scaleY = screenSize.height / 50;
    scaleX = scaleX > scaleY ? scaleY : scaleX;
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, screenSize.width, screenSize.height - 75)];
    pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(screenSize.width/2 - 15, screenSize.height - 70, 30, 25)];
    textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, screenSize.width, screenSize.height - 49)];
    textView.editable = NO;
    [self.view addSubview:textView];
    textView.text = @"英国科学家表示，俗称为“超级地球”的“格利泽581d”行星的确存在。图为“格利泽581d”的艺术构想图。中国日报网3月7日电 据英国《每日邮报》3月6日报道，“格利泽581d”行星大小约为地球的3倍，是人类在太阳系之外发现的第一个位于宜居带中的行星，被称为“超级地球”。它距离地球22光年，在浩瀚的宇宙中算得上是“邻居”。有趣的是，学者过去曾一度认为它根本不存在。“格利泽581d”围绕“格利泽581”公转，并且位于后者的宜居带中，是人类潜在的太空移民选择，人称“超级地球”。英国玛丽皇后大学的吉列姆 安格拉达-埃斯屈得教授说：“ 格利泽581d 存在（与否）事关重大，因为这是我们首次在另一个恒星的宜居带中发现类似地球的行星。”“格利泽581d”存在与否曾一度产生争议。天文学家早在2010年就接收到了“格利泽581d”发出的信号。美国宾州州立大学的学者们2014年分析认为，这些信号只是距离地球22光年之外的其他星球发出的“噪音”，断言“格利泽581d”——及其伙伴“格利泽581g”——根本就不存在。不过，英国学者的最新研究可能让“格利泽581d”的“命运”峰回路转。玛丽皇后大学和赫特福德大学的科学家们表示，宾州州立大学把研究大行星的方法套用到了小行星身上，可能因此错过“格利泽581d”。在更加准确的研究方法的帮助下，英国学者们表示，已经确认“格利泽581d”的确存在。安德拉达-埃斯屈得说：“科学家们经常讨论解读数据的方法，不过我有信心 格利泽581d 一直在 格利泽581 的轨道中转动。”英国科学家表示，俗称为“超级地球”的“格利泽581d”行星的确存在。图为“格利泽581d”的艺术构想图。中国日报网3月7日电 据英国《每日邮报》3月6日报道，“格利泽581d”行星大小约为地球的3倍，是人类在太阳系之外发现的第一个位于宜居带中的行星，被称为“超级地球”。它距离地球22光年，在浩瀚的宇宙中算得上是“邻居”。有趣的是，学者过去曾一度认为它根本不存在。“格利泽581d”围绕“格利泽581”公转，并且位于后者的宜居带中，是人类潜在的太空移民选择，人称“超级地球”。英国玛丽皇后大学的吉列姆 安格拉达-埃斯屈得教授说：“ 格利泽581d 存在（与否）事关重大，因为这是我们首次在另一个恒星的宜居带中发现类似地球的行星。”“格利泽581d”存在与否曾一度产生争议。天文学家早在2010年就接收到了“格利泽581d”发出的信号。美国宾州州立大学的学者们2014年分析认为，这些信号只是距离地球22光年之外的其他星球发出的“噪音”，断言“格利泽581d”——及其伙伴“格利泽581g”——根本就不存在。不过，英国学者的最新研究可能让“格利泽581d”的“命运”峰回路转。玛丽皇后大学和赫特福德大学的科学家们表示，宾州州立大学把研究大行星的方法套用到了小行星身上，可能因此错过“格利泽581d”。在更加准确的研究方法的帮助下，英国学者们表示，已经确认“格利泽581d”的确存在。安德拉达-埃斯屈得说：“科学家们经常讨论解读数据的方法，不过我有信心 格利泽581d 一直在 格利泽581 的轨道中转动。”英国科学家表示，俗称为“超级地球”的“格利泽581d”行星的确存在。图为“格利泽581d”的艺术构想图。中国日报网3月7日电 据英国《每日邮报》3月6日报道，“格利泽581d”行星大小约为地球的3倍，是人类在太阳系之外发现的第一个位于宜居带中的行星，被称为“超级地球”。它距离地球22光年，在浩瀚的宇宙中算得上是“邻居”。有趣的是，学者过去曾一度认为它根本不存在。“格利泽581d”围绕“格利泽581”公转，并且位于后者的宜居带中，是人类潜在的太空移民选择，人称“超级地球”。英国玛丽皇后大学的吉列姆 安格拉达-埃斯屈得教授说：“ 格利泽581d 存在（与否）事关重大，因为这是我们首次在另一个恒星的宜居带中发现类似地球的行星。”“格利泽581d”存在与否曾一度产生争议。天文学家早在2010年就接收到了“格利泽581d”发出的信号。美国宾州州立大学的学者们2014年分析认为，这些信号只是距离地球22光年之外的其他星球发出的“噪音”，断言“格利泽581d”——及其伙伴“格利泽581g”——根本就不存在。不过，英国学者的最新研究可能让“格利泽581d”的“命运”峰回路转。玛丽皇后大学和赫特福德大学的科学家们表示，宾州州立大学把研究大行星的方法套用到了小行星身上，可能因此错过“格利泽581d”。在更加准确的研究方法的帮助下，英国学者们表示，已经确认“格利泽581d”的确存在。安德拉达-埃斯屈得说：“科学家们经常讨论解读数据的方法，不过我有信心 格利泽581d 一直在 格利泽581 的轨道中转动。”(原标题：“超级地球”确认存在 为首个系外宜居星球)";
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(screenSize.width - 105, 107, 100, 50)];
    imageView1.image = [UIImage imageNamed:@"clip1.png"];
    imageView1.tag = 0;
    imageView1.userInteractionEnabled = YES;
    [textView addSubview:imageView1];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [imageView1 addGestureRecognizer:tap];
    
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(screenSize.width - 105, 507, 100, 50)];
    imageView2.image = [UIImage imageNamed:@"clip2.png"];
    imageView2.userInteractionEnabled = YES;
    imageView2.tag = 1;
    [textView addSubview:imageView2];
    tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [imageView2 addGestureRecognizer:tap];
    
    UIImageView *imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(screenSize.width - 105, 807, 100, 50)];
    imageView3.image = [UIImage imageNamed:@"clip0.png"];
    imageView3.userInteractionEnabled = YES;
    imageView3.tag = 2;
    [textView addSubview:imageView3];
    tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [imageView3 addGestureRecognizer:tap];
    clipViewsFrames = @[[NSValue valueWithCGRect:imageView1.frame], [NSValue valueWithCGRect:imageView2.frame], [NSValue valueWithCGRect:imageView3.frame]];
    clipViews = @[imageView1, imageView2, imageView3];
    
    [self createPage];
    //scrollWidth.constant = screenSize.width * contentView.subviews.count;
    scrollView.contentSize = CGSizeMake(screenSize.width * scrollView.subviews.count, 0);
    scrollView.pagingEnabled = YES;
    scrollView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:scrollView];
    scrollView.hidden = YES;
    scrollView.delegate = self;
    
    pageControl.numberOfPages = 3;
    [self.view addSubview:pageControl];
    [pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    pageControl.hidden = YES;
    
    textView.textAlignment = NSTextAlignmentJustified;
    UIBezierPath *bezierPath1 = [UIBezierPath bezierPathWithRoundedRect:imageView1.frame cornerRadius:0.3];
    UIBezierPath *bezierPath2 = [UIBezierPath bezierPathWithRoundedRect:imageView2.frame cornerRadius:0.3];
    UIBezierPath *bezierPath3 = [UIBezierPath bezierPathWithRoundedRect:imageView3.frame cornerRadius:0.3];
    
    textView.textContainer.exclusionPaths = @[bezierPath1, bezierPath2, bezierPath3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createPage {
    UIImageView *clipImage1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"clip1.png"]];
    UIImageView *clipImage2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"clip2.png"]];
    UIImageView *clipImage3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"clip0.png"]];
    clipImage1.userInteractionEnabled = YES;
    clipImage2.userInteractionEnabled = YES;
    clipImage3.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [clipImage1 addGestureRecognizer:tap];
    tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [clipImage2 addGestureRecognizer:tap];
    tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [clipImage3 addGestureRecognizer:tap];
    [self loadScrollViewWithPage:clipImage1];
    [self loadScrollViewWithPage:clipImage2];
    [self loadScrollViewWithPage:clipImage3];
}

- (void)loadScrollViewWithPage:(UIImageView *)imageView {
    NSInteger count = scrollView.subviews.count;
    CGSize scrollViewSize = scrollView.bounds.size;
    CGSize clipViewsSize = [clipViewsFrames[count] CGRectValue].size;
    imageView.frame = CGRectMake(scrollViewSize.width * count, 0, clipViewsSize.width * scaleX, clipViewsSize.height * scaleX);
    //NSLog(@"%f -- %f -- %f -- %f", clipViewsSize.width, clipViewsSize.width*scaleX, clipViewsSize.height, clipViewsSize.height*scaleX);
    imageView.center = CGPointMake(screenSize.width/2 + screenSize.width * count, screenSize.height/2);
    [scrollView addSubview:imageView];
}

- (void)tap:(UITapGestureRecognizer *)tap {
    UIView *tapClipView = tap.view;
    CGFloat offsetY = textView.contentOffset.y;
    CGPoint center = CGPointMake(screenSize.width/2, screenSize.height/2 + offsetY);
    [UIView animateWithDuration:.3 animations:^{
        if (CGPointEqualToPoint(center, tapClipView.center) || !scrollView.hidden) {
            scrollView.hidden = YES;
            textView.hidden = NO;
            CGRect frame = [clipViewsFrames[selectedTag] CGRectValue];
            UIImageView *imageView = [clipViews objectAtIndex:selectedTag];
            imageView.frame = frame;
            textView.backgroundColor = [UIColor whiteColor];
            self.view.backgroundColor = [UIColor whiteColor];
        } else {
            tapClipView.transform = CGAffineTransformScale(tapClipView.transform, scaleX, scaleX);
            tapClipView.center = center;
            textView.backgroundColor = [UIColor blackColor];
            self.view.backgroundColor = [UIColor blackColor];
            selectedTag = tapClipView.tag;
            scrollView.contentOffset = CGPointMake(screenSize.width * selectedTag, 0);
        }
    } completion:^(BOOL finished) {
        if (pageControl.hidden) {
            scrollView.hidden = NO;
            pageControl.hidden = NO;
            textView.hidden = YES;
        } else {
            //scrollView.hidden = YES;
            pageControl.hidden = YES;
        }
    }];
}

- (void)changePage:(id)sender {
    NSInteger page = pageControl.currentPage;
    CGRect frame = scrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [scrollView scrollRectToVisible:frame animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)aScrollView {
    CGFloat pageWidth = aScrollView.bounds.size.width;
    int page = floor((aScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    pageControl.currentPage = page;
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
