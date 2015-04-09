//
//  PullRefreshTableViewController.h
//  Map
//
//  Created by 郑泓 on 15-3-8.
//  Copyright (c) 2015年 zh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PullRefreshTableViewController : UITableViewController {
    NSInteger scenicCount;
}

- (void)reFlush;

- (void)stopLoding;

@end
