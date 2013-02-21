//
//  TwitterFeedViewController.m
//  NSCoders
//
//  Created by Narcis on 4/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TwitterFeedViewController.h"

#import "TwitterFeed.h"


@implementation TwitterFeedViewController

@synthesize feedViewController;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Twitter Feed", nil);
        self.tabBarItem.image = [UIImage imageNamed:@"chat"];
    }
    return self;
}
							
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //UIColor *color = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"vertical_cloth.png"]];
    //self.view.backgroundColor = color;
    //[color release];
    
    //UINavigationController *twitterFeed=[[UINavigationController alloc] initWithRootViewController:tweets];
    
    
    //self.tabBarController.selectedViewController = [[[[TwitterFeed alloc] initWithUsername:@"twitter"] autorelease] animated:YES];
    
    feedViewController = [[TwitterFeed alloc] initWithUsername:@"copenhagencocoa"];
    CGRect frame=feedViewController.view.frame;
    frame.origin.y=0;
    feedViewController.view.frame=frame;
    [self.view addSubview:feedViewController.view]; 
    
    
//    [self.tabBarController presentModalViewController:[[[TwitterFeed alloc] initWithUsername:@"cocoacopenhagen"] autorelease] animated:YES];
    //presentModalViewController
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    [feedViewController release];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
