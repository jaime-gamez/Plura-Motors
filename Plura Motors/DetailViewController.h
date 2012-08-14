//
//  DetailViewController.h
//  Plura Motors
//
//  Created by Lion User on 13/08/2012.
//  Copyright (c) 2012 Jaime Gamez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
