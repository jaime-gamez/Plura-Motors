//
//  DetailViewController.m
//  Plura Motors
//
//  Created by Lion User on 13/08/2012.
//  Copyright (c) 2012 Jaime Gamez. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item
@synthesize detail2Label = _detail2Label;
@synthesize price = _price;
@synthesize photo = _photo;
@synthesize photo2 = _photo2;

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        
        //self.detailDescriptionLabel.text = [self.detailItem description];
        NSMutableString *cocheName = [NSMutableString stringWithString:[self.detailItem objectForKey:@"marca"]];
        [cocheName appendString:@" "];
        [cocheName appendString:[self.detailItem objectForKey:@"modelo"]];
        [cocheName appendString:@" "];
        [cocheName appendString:[self.detailItem objectForKey:@"version"]] ;
        self.detailDescriptionLabel.text = cocheName;
        
        NSMutableString *cochePrice = [NSMutableString stringWithFormat:@"$%@",[self.detailItem objectForKey:@"precio"]];
        self.price.text = cochePrice;
        
        NSArray *images = [self.detailItem objectForKey:@"_fotos"];
        NSMutableString *urlImage = [NSMutableString stringWithString:@"http://pluramotorsdemo.appspot.com/img/"];
        //[images objectAtIndex:0];
        [urlImage appendFormat:@"%@.png",[images objectAtIndex:0]];
        
        NSURL *url = [NSURL URLWithString:urlImage];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *img = [[UIImage alloc] initWithData:data];
        self.photo.image = img;
        
        
        NSMutableString *urlImage2 = [NSMutableString stringWithString:@"http://pluramotorsdemo.appspot.com/img/"];
        //[images objectAtIndex:0];
        [urlImage2 appendFormat:@"%@.png",[images objectAtIndex:1]];
        
        NSURL *url2 = [NSURL URLWithString:urlImage2];
        NSData *data2 = [NSData dataWithContentsOfURL:url2];
        UIImage *img2 = [[UIImage alloc] initWithData:data2];
        self.photo2.image = img2;

        
        //NSLog(@"\nFOTOS: %@ \n ", urlImage);
        NSMutableString *cocheDetails = [NSMutableString stringWithFormat:@"%@ - %@kms",[self.detailItem objectForKey:@"anio"], [self.detailItem objectForKey:@"kms"]];
        self.detail2Label.text = cocheDetails;
        
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)viewDidUnload
{
    [self setPrice:nil];
    [self setPhoto:nil];
    [self setPhoto2:nil];
    [self setDetail2Label:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Detail", @"Detail");
    }
    return self;
}
							
#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
