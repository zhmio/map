//
//  ScenicTableViewController.m
//  Map
//
//  Created by 郑泓 on 15-3-8.
//  Copyright (c) 2015年 zh. All rights reserved.
//

#import "ScenicTableViewController.h"

@interface ScenicTableViewController () {
    NSArray *descriptions;
    NSArray *photos;
    NSArray *distances;
}

@end

@implementation ScenicTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    descriptions = @[@"黄山", @"凤凰古城", @"苗寨"];
    photos = @[@"huangshan.jpg", @"qiao.jpg", @"he.jpg"];
    distances = @[@"16公里", @"42公里", @"23公里"];
    scenicCount = 9;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reFlush {
    scenicCount += 6;
    [self.tableView reloadData];
    [self stopLoding];
}

- (void)stopLoading {
    [super stopLoding];
}

- (void)endRefresh:(id)arg {
    [self.refreshControl endRefreshing];
}

- (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize {
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return  reSizeImage;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return scenicCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SCENICCELL" forIndexPath:indexPath];
    cell.textLabel.text = descriptions[indexPath.row%3];
    cell.detailTextLabel.text = distances[indexPath.row%3];
    //cell.imageView.image = [self reSizeImage:[UIImage imageNamed:photos[indexPath.row%3]] toSize:CGSizeMake(110, 70)];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UIImage *ig = [UIImage imageNamed:photos[indexPath.row%3]];
        ig = [self reSizeImage:ig toSize:CGSizeMake(110, 70)];
        dispatch_async(dispatch_get_main_queue(), ^{
            cell.imageView.image = ig;
            [cell setNeedsLayout];
        });
    });
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0f;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
