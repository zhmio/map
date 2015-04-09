//
//  MapViewController.h
//  Map
//
//  Created by 郑泓 on 15-3-9.
//  Copyright (c) 2015年 zh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMapKit.h"
#import "iflyMSC/IFlyRecognizerViewDelegate.h"

@interface MapViewController : UIViewController <BMKMapViewDelegate, BMKLocationServiceDelegate, UISearchBarDelegate, IFlyRecognizerViewDelegate, BMKPoiSearchDelegate>

@end
