//
//  AppDelegate.h
//  Map
//
//  Created by 郑泓 on 15-3-7.
//  Copyright (c) 2015年 zh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMapKit.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, BMKGeneralDelegate> {
    UINavigationController *navigationController;
    BMKMapManager* _mapManager;
}

@property (strong, nonatomic) UIWindow *window;


@end

