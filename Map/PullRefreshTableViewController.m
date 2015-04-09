//
//  PullRefreshTableViewController.m
//  Map
//
//  Created by 郑泓 on 15-3-8.
//  Copyright (c) 2015年 zh. All rights reserved.
//

#import "PullRefreshTableViewController.h"

#define REFRESH_FOOT_HEIGHT 54.0f
#define BOTTOM_HEIGHT 49.0f
#define NAVITIONBAR_HEIGHT 108.0f
#define TABLE_HEAD_HIGHT 64.0f

@interface PullRefreshTableViewController () {
    BOOL isLoding;
    BOOL isDragging;
    UIView *reFlushFootView;
    UIView *reFlushHeadView;
    UILabel *reFlushLabel;
    UILabel *reFlushHeadLabel;
    UIImageView *reFlushArrow;
    UIImageView *reFlushHeadArrow;
    UIActivityIndicatorView *reFlushHeadSpinner;
    UIActivityIndicatorView *reFlushSpinner;
    NSString *textPull;
    NSString *textRelease;
    NSString *textLoading;
    NSString *textPullDown;
}

@end

@implementation PullRefreshTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    textPull    = @"上拉刷新...";
    textRelease = @"释放开始刷新...";
    textLoading = @"正在加载...";
    textPullDown = @"下拉刷新...";
    [self addReflushFootView];
    [self addReflushHeadView];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    reFlushFootView.frame = CGRectMake(0, self.tableView.contentSize.height, self.tableView.bounds.size.width, REFRESH_FOOT_HEIGHT);
}

- (void)addReflushHeadView {
    CGSize headSize = CGSizeMake(self.tableView.bounds.size.width, REFRESH_FOOT_HEIGHT);
    reFlushHeadView = [[UIView alloc] initWithFrame:CGRectMake(0, -REFRESH_FOOT_HEIGHT, headSize.width, REFRESH_FOOT_HEIGHT)];
    reFlushHeadView.backgroundColor = [UIColor clearColor];
    
    reFlushHeadLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, headSize.width, REFRESH_FOOT_HEIGHT)];
    reFlushHeadLabel.textAlignment = NSTextAlignmentCenter;
    reFlushHeadLabel.text = textPullDown;
    reFlushHeadLabel.textColor = [UIColor blackColor];
    
    reFlushHeadArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow.png"]];
    reFlushHeadArrow.frame = CGRectMake(floorf((REFRESH_FOOT_HEIGHT) + 20),
                                    (floorf(REFRESH_FOOT_HEIGHT - 24) / 2),
                                    27, 44);
    
    reFlushHeadSpinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    reFlushHeadSpinner.frame = CGRectMake(floorf(floorf(REFRESH_FOOT_HEIGHT ) - 20 ), floorf((REFRESH_FOOT_HEIGHT - 20) / 2), 20, 20);
    reFlushHeadSpinner.hidesWhenStopped = YES;
    
    [self.tableView addSubview:reFlushHeadView];
    [reFlushHeadView addSubview:reFlushHeadLabel];
    //[reFlushHeadView addSubview:reFlushHeadArrow];
    [reFlushHeadView addSubview:reFlushHeadSpinner];
}

- (void)addReflushFootView {
    CGSize footSize = CGSizeMake(self.tableView.bounds.size.width, REFRESH_FOOT_HEIGHT);
    reFlushFootView = [[UIView alloc] initWithFrame:CGRectMake(0, self.tableView.frame.size.height, footSize.width, REFRESH_FOOT_HEIGHT)];
    reFlushFootView.backgroundColor = [UIColor clearColor];
    
    reFlushLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, footSize.width, REFRESH_FOOT_HEIGHT)];
    reFlushLabel.textAlignment = NSTextAlignmentCenter;
    reFlushLabel.text = textPull;
    reFlushLabel.textColor = [UIColor blackColor];
    
    reFlushArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow.png"]];
    reFlushArrow.frame = CGRectMake(floorf((REFRESH_FOOT_HEIGHT) + 20),
                                    (floorf(REFRESH_FOOT_HEIGHT - 24) / 2),
                                    27, 44);
    
    reFlushSpinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    reFlushSpinner.frame = CGRectMake(floorf(floorf(REFRESH_FOOT_HEIGHT ) - 20 ), floorf((REFRESH_FOOT_HEIGHT - 20) / 2), 20, 20);
    reFlushSpinner.hidesWhenStopped = YES;
    
    [self.tableView addSubview:reFlushFootView];
    [reFlushFootView addSubview:reFlushLabel];
    [reFlushFootView addSubview:reFlushArrow];
    [reFlushFootView addSubview:reFlushSpinner];
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    if (isLoding) {
        return;
    }
    //NSLog(@"%f", scrollView.contentSize.height);
    //reFlushFootView.frame = CGRectMake(0, scrollView.contentSize.height + NAVITIONBAR_HEIGHT +5, scrollView.frame.size.width, REFRESH_FOOT_HEIGHT);
    isDragging = YES;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //NSLog(@"%f",scrollView.contentOffset.y);
    //NSLog(@"%f -- %f -- %f -- %f", scrollView.contentSize.height, scrollView.contentOffset.y, scrollView.bounds.size.height, scrollView.contentInset.bottom);
    float screenHeight = [[UIScreen mainScreen] bounds].size.height - TABLE_HEAD_HIGHT - BOTTOM_HEIGHT;
    float deceleratY = scrollView.contentSize.height - (scrollView.contentOffset.y + TABLE_HEAD_HIGHT + screenHeight - (scrollView.contentInset.bottom - BOTTOM_HEIGHT));
    if (isLoding && scrollView.contentOffset.y > 0) {
        
    } else if (deceleratY < -REFRESH_FOOT_HEIGHT && scrollView.contentOffset.y > 0) {
        reFlushLabel.text = textRelease;
        //NSLog(@"scrollViewDidScroll");
        self.tableView.contentInset = UIEdgeInsetsMake(TABLE_HEAD_HIGHT, 0, REFRESH_FOOT_HEIGHT + BOTTOM_HEIGHT, 0);
    } else if (scrollView.contentOffset.y < -REFRESH_FOOT_HEIGHT - TABLE_HEAD_HIGHT) {
        reFlushHeadLabel.text = textRelease;
        self.tableView.contentInset = UIEdgeInsetsMake(TABLE_HEAD_HIGHT + REFRESH_FOOT_HEIGHT, 0, BOTTOM_HEIGHT, 0);
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (isLoding) {
        return;
    }
    isDragging = NO;
    //float screenHeight = [[UIScreen mainScreen] bounds].size.height - TABLE_HEAD_HIGHT - BOTTOM_HEIGHT;
    //float deceleratY = scrollView.contentSize.height - (scrollView.contentOffset.y + TABLE_HEAD_HIGHT + screenHeight - (scrollView.contentInset.bottom - BOTTOM_HEIGHT));
    if ([reFlushLabel.text isEqualToString:textRelease] && scrollView.contentOffset.y > 0) {
        reFlushLabel.text = textLoading;
        [reFlushSpinner startAnimating];
        //NSLog(@"scrollViewDidEndDragging");
        //self.tableView.contentInset = UIEdgeInsetsMake(TABLE_HEAD_HIGHT, 0, REFRESH_FOOT_HEIGHT + BOTTOM_HEIGHT, 0);
        [self startLoding];
    } else if ([reFlushHeadLabel.text isEqualToString:textRelease] && scrollView.contentOffset.y < 0) {
        reFlushHeadLabel.text = textLoading;
        [reFlushHeadSpinner startAnimating];
        isLoding = YES;
        [self performSelector:@selector(stopLoading) withObject:nil afterDelay:1.0f];
    }
}

/*- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (isLoding) {
        return;
    }
    isDragging = NO;
    //float screenHeight = [[UIScreen mainScreen] bounds].size.height - TABLE_HEAD_HIGHT - BOTTOM_HEIGHT;
    //float deceleratY = scrollView.contentSize.height - (scrollView.contentOffset.y + TABLE_HEAD_HIGHT + screenHeight - (scrollView.contentInset.bottom - BOTTOM_HEIGHT));
    if ([reFlushLabel.text isEqualToString:textRelease] && scrollView.contentOffset.y > 0) {
        reFlushLabel.text = textLoading;
        [reFlushSpinner startAnimating];
        NSLog(@"scrollViewDidEndDragging");
        //self.tableView.contentInset = UIEdgeInsetsMake(TABLE_HEAD_HIGHT, 0, REFRESH_FOOT_HEIGHT + BOTTOM_HEIGHT, 0);
        [self startLoding];
    } else if ([reFlushHeadLabel.text isEqualToString:textRelease] && scrollView.contentOffset.y < 0) {
        reFlushHeadLabel.text = textLoading;
        [reFlushHeadSpinner startAnimating];
        isLoding = YES;
        [self performSelector:@selector(stopLoading) withObject:nil afterDelay:1.0f];
    }
}*/

- (void)startLoding {
    isLoding = YES;
    [self performSelector:@selector(reFlush) withObject:nil afterDelay:1.0f];
}

- (void)stopLoding {
    isLoding = NO;
    [reFlushSpinner stopAnimating];
    [reFlushHeadSpinner stopAnimating];
    reFlushLabel.text = textPull;
    reFlushHeadLabel.text = textPullDown;
    self.tableView.contentInset = UIEdgeInsetsMake(TABLE_HEAD_HIGHT, 0, BOTTOM_HEIGHT, 0);
    reFlushFootView.frame = CGRectMake(0, self.tableView.contentSize.height, self.tableView.bounds.size.width, REFRESH_FOOT_HEIGHT);
}

- (void)reFlush {}

@end
