//
//  MapViewController.m
//  Map
//
//  Created by 郑泓 on 15-3-9.
//  Copyright (c) 2015年 zh. All rights reserved.
//

#import "MapViewController.h"
#import "CallOutAnnotationView.h"
#import "ScenicDetailViewController.h"
#import "iflyMSC/IFlySpeechConstant.h"
#import "iflyMSC/IFlySpeechUtility.h"
#import "iflyMSC/IFlyRecognizerView.h"

@interface MapViewController () {
    BMKMapView *bmkMapView;
    BMKLocationService *_locService;
    BMKPoiSearch* _poisearch;
    IFlyRecognizerView * iflyRecognizerView;
    UISearchBar *searchBar;
    UIButton *listenBtn;
}

@property (nonatomic, strong) BMKMapView *bmkMapView;

@end

@implementation MapViewController

@synthesize bmkMapView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    BMKMapView *mapView = [[BMKMapView alloc] initWithFrame:self.view.bounds];
    self.bmkMapView = mapView;
    //self.view = bmkMapView;
    [self.view addSubview:bmkMapView];
    
    
    _locService = [[BMKLocationService alloc]init];
    [_locService startUserLocationService];
    bmkMapView.showsUserLocation = NO;//先关闭显示的定位图层
    bmkMapView.userTrackingMode = BMKUserTrackingModeNone;//设置定位的状态
    bmkMapView.showsUserLocation = YES;//显示定位图层
    
    _poisearch = [[BMKPoiSearch alloc] init];
    bmkMapView.isSelectedAnnotationViewFront = YES;
    
    iflyRecognizerView = [[IFlyRecognizerView alloc] initWithCenter:self.view.center];
    iflyRecognizerView.delegate = self;
    
    searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(20, 25, 250, 30)];
    searchBar.showsCancelButton = YES;
    searchBar.delegate = self;
    [self.view addSubview:searchBar];
    [self.view bringSubviewToFront:searchBar];
    
    listenBtn = [[UIButton alloc] initWithFrame:CGRectMake(270, 25, 60, 30)];
    [listenBtn setBackgroundImage:[UIImage imageNamed:@"huatong.png"] forState:UIControlStateNormal];
    [listenBtn addTarget:self action:@selector(lisBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:listenBtn];
    [self.view addSubview:listenBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [bmkMapView viewWillAppear];
    bmkMapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
    _locService.delegate = self;
    _poisearch.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
    iflyRecognizerView.delegate = self;
}
- (void)viewWillDisappear:(BOOL)animated
{
    [bmkMapView viewWillDisappear];
    bmkMapView.delegate = nil; // 不用时，置nil
    _locService.delegate = nil;
    _poisearch.delegate = nil;
    //终止识别
    [iflyRecognizerView cancel];
    [iflyRecognizerView setDelegate:nil];
}

- (void)viewDidAppear:(BOOL)animated {
    BMKPointAnnotation* annotation = [[BMKPointAnnotation alloc]init];
    CLLocationCoordinate2D coor;
    coor.latitude = 39.915;
    coor.longitude = 116.404;
    annotation.coordinate = coor;
    annotation.title = @"七星公园";
    [bmkMapView addAnnotation:annotation];
    
    BMKPointAnnotation *annotation2 = [[BMKPointAnnotation alloc]init];
    CLLocationCoordinate2D coor2;
    coor2.latitude = 39.985;
    coor2.longitude = 116.404;
    annotation2.coordinate = coor2;
    annotation2.title = @"十字街";
    [bmkMapView addAnnotation:annotation2];
    
    BMKPointAnnotation *annotation3 = [[BMKPointAnnotation alloc]init];
    CLLocationCoordinate2D coor3;
    coor3.latitude = 40.015;
    coor3.longitude = 116.324;
    annotation3.coordinate = coor3;
    annotation3.title = @"中心广场";
    [bmkMapView addAnnotation:annotation3];
    
    BMKPointAnnotation *annotation4 = [[BMKPointAnnotation alloc]init];
    CLLocationCoordinate2D coor4;
    coor4.latitude = 40.035;
    coor4.longitude = 116.804;
    annotation4.coordinate = coor4;
    annotation4.title = @"穿山公园";
    [bmkMapView addAnnotation:annotation4];
    
    BMKPointAnnotation *annotation5 = [[BMKPointAnnotation alloc]init];
    CLLocationCoordinate2D coor5;
    coor5.latitude = 40.055;
    coor5.longitude = 116.584;
    annotation5.coordinate = coor5;
    annotation5.title = @"甲天下广场";
    [bmkMapView addAnnotation:annotation5];
    
    BMKPointAnnotation* annotation6 = [[BMKPointAnnotation alloc]init];
    CLLocationCoordinate2D coor6;
    coor6.latitude = 25.279;
    coor6.longitude = 110.342;
    annotation6.coordinate = coor6;
    annotation6.title = @"七星公园";
    [bmkMapView addAnnotation:annotation6];
    
    BMKPointAnnotation *annotation7 = [[BMKPointAnnotation alloc]init];
    CLLocationCoordinate2D coor7;
    coor7.latitude = 25.272;
    coor7.longitude = 110.316;
    annotation7.coordinate = coor7;
    annotation7.title = @"十字街";
    [bmkMapView addAnnotation:annotation7];
    
    BMKPointAnnotation *annotation8 = [[BMKPointAnnotation alloc]init];
    CLLocationCoordinate2D coor8;
    coor8.latitude = 25.228;
    coor8.longitude = 110.340;
    annotation8.coordinate = coor8;
    annotation8.title = @"中心广场";
    [bmkMapView addAnnotation:annotation8];
    
    BMKPointAnnotation *annotation9 = [[BMKPointAnnotation alloc]init];
    CLLocationCoordinate2D coor9;
    coor9.latitude = 25.251;
    coor9.longitude = 110.272;
    annotation9.coordinate = coor9;
    annotation9.title = @"穿山公园";
    [bmkMapView addAnnotation:annotation9];
    
    BMKPointAnnotation *annotation10 = [[BMKPointAnnotation alloc]init];
    CLLocationCoordinate2D coor10;
    coor10.latitude = 25.264;
    coor10.longitude = 110.269;
    annotation10.coordinate = coor10;
    annotation10.title = @"甲天下广场";
    [bmkMapView addAnnotation:annotation10];
}

- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[BMKPointAnnotation class]]) {
        /*BMKPinAnnotationView *newAnnotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"myAnnotation"];
        newAnnotationView.pinColor = BMKPinAnnotationColorPurple;
        newAnnotationView.animatesDrop = YES;// 设置该标注点动画显示
        //newAnnotationView.canShowCallout = NO;
        return newAnnotationView;*/
        CallOutAnnotationView *newAnnotaitonView = [[CallOutAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"myAnnotation"];
        return newAnnotaitonView;
    }
    return nil;
}

- (void)mapView:(BMKMapView *)mapView didSelectAnnotationView:(BMKAnnotationView *)view {
    ScenicDetailViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ScenicDetail"];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:viewController];
    viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:viewController action:@selector(close:)];
    [self presentViewController:navController animated:YES completion:nil];
}

- (void)mapView:(BMKMapView *)mapView regionWillChangeAnimated:(BOOL)animated {
    [_locService stopUserLocationService];
    bmkMapView.showsUserLocation = NO;
}

- (void)mapStatusDidChanged:(BMKMapView *)mapView {
    //[bmkMapView bringSubviewToFront:searchBar];
    //[bmkMapView bringSubviewToFront:listenBtn];
}

- (void)onGetPoiResult:(BMKPoiSearch *)searcher result:(BMKPoiResult*)result errorCode:(BMKSearchErrorCode)error
{
    // 清楚屏幕中所有的annotation
    NSArray* array = [NSArray arrayWithArray:bmkMapView.annotations];
    [bmkMapView removeAnnotations:array];
    
    if (error == BMK_SEARCH_NO_ERROR) {
        for (int i = 0; i < result.poiInfoList.count; i++) {
            BMKPoiInfo* poi = [result.poiInfoList objectAtIndex:i];
            BMKPointAnnotation* item = [[BMKPointAnnotation alloc]init];
            item.coordinate = poi.pt;
            item.title = poi.name;
            [bmkMapView addAnnotation:item];
            if(i == 0)
            {
                //将第一个点的坐标移到屏幕中央
                bmkMapView.centerCoordinate = poi.pt;
            }
        }
    } else if (error == BMK_SEARCH_AMBIGUOUS_ROURE_ADDR){
        NSLog(@"起始点有歧义");
    } else {
        // 各种情况的判断。。。
    }
}


/**
 *在地图View将要启动定位时，会调用此函数
 *@param mapView 地图View
 */
- (void)willStartLocatingUser
{
    NSLog(@"start locate");
}

/**
 *用户方向更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    [bmkMapView updateLocationData:userLocation];
    //NSLog(@"heading is %@",userLocation.heading);
}

/**
 *用户位置更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
        //NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
    if (bmkMapView.userTrackingMode != BMKUserTrackingModeFollow) {
        bmkMapView.showsUserLocation = NO;
        bmkMapView.userTrackingMode = BMKUserTrackingModeFollow;
        bmkMapView.showsUserLocation = YES;
    }
    [bmkMapView updateLocationData:userLocation];
}

/**
 *在地图View停止定位后，会调用此函数
 *@param mapView 地图View
 */
- (void)didStopLocatingUser
{
    NSLog(@"stop locate");
}

/**
 *定位失败后，会调用此函数
 *@param mapView 地图View
 *@param error 错误号，参考CLError.h中定义的错误号
 */
- (void)didFailToLocateUserWithError:(NSError *)error
{
    NSLog(@"location error");
}


- (void)dealloc {
    if (bmkMapView) {
        bmkMapView = nil;
    }
    if (_poisearch != nil) {
        _poisearch = nil;
    }
    if (_locService != nil) {
        _locService = nil;
    }
}

- (void)onResult:(NSArray *)resultArray isLast:(BOOL)isLast {
    NSMutableString *result = [[NSMutableString alloc] init];
    NSDictionary *dic = [resultArray objectAtIndex:0];
    
    for (NSString *key in dic) {
        [result appendFormat:@"%@",key];
    }
    
    searchBar.text = [NSString stringWithFormat:@"%@%@",searchBar.text,result];
}

/** 识别结束回调方法
 @param error 识别错误
 */
- (void)onError:(IFlySpeechError *)error
{
    
    
    NSLog(@"识别错误 errorCode:%d",[error errorCode]);
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)mSearchBar {
    [mSearchBar resignFirstResponder];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)mSearchBar {
    [mSearchBar resignFirstResponder];
    BMKCitySearchOption *citySearchOption = [[BMKCitySearchOption alloc]init];
    citySearchOption.pageIndex = 0;
    citySearchOption.pageCapacity = 10;
    citySearchOption.city= @"桂林";
    citySearchOption.keyword = mSearchBar.text;
    BOOL flag = [_poisearch poiSearchInCity:citySearchOption];
    if(flag)
    {
        NSLog(@"城市内检索发送成功");
    }
    else
    {
        NSLog(@"城市内检索发送失败");
    }
}

- (void)lisBtnClick:(id)sender {
    [iflyRecognizerView setParameter:@"iat" forKey:[IFlySpeechConstant IFLY_DOMAIN]];
    [iflyRecognizerView setParameter:@"plain" forKey:[IFlySpeechConstant RESULT_TYPE]];
    [iflyRecognizerView start];
    
    NSLog(@"start listenning...");
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
