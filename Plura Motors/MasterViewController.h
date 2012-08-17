//
//  MasterViewController.h
//  Plura Motors
//
//  Created by Lion User on 13/08/2012.
//  Copyright (c) 2012 Jaime Gamez. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController{
    NSMutableArray *tableData; //holds the table data
}

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
