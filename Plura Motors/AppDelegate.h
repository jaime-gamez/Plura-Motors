//
//  AppDelegate.h
//  Plura Motors
//
//  Created by Lion User on 13/08/2012.
//  Copyright (c) 2012 Jaime Gamez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController *navigationController;

@property (strong, nonatomic) UISplitViewController *splitViewController;

@property (nonatomic,strong) NSMutableArray *tableData; //holds the table data
@end
