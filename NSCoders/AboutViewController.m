//
//  AboutViewController.m
//  NSCoders
//
//  Created by Narcis on 4/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AboutViewController.h"

@implementation AboutViewController

@synthesize linkToNS, linkToCph; //description
@synthesize description;
@synthesize tabBarController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"About", @"About");
        self.tabBarItem.image = [UIImage imageNamed:@"more"];
    }
    return self;}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIColor *color = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"bright_squares.png"]];
    self.view.backgroundColor = color;
    
    //self.navController=[[UINavigationController alloc] initWithRootViewController:self];
    
    
    description.textColor=[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1];
    [linkToNS setTitleColor:[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1] forState:UIControlStateNormal];
    //[linkToNS setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0]];
    [linkToNS setBackgroundColor:[UIColor clearColor]];
    
    [linkToCph setTitleColor:[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1] forState:UIControlStateNormal];
    //[linkToCph setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0]];
    [linkToCph setBackgroundColor:[UIColor clearColor]];
        
   [color release];
}

-(IBAction)openLinkToCPH:(id)sender{
    NSLog(@"link to CPH");
    CPH_Cocoa *cphCocoa=[[CPH_Cocoa alloc] init];
    [self presentModalViewController:cphCocoa animated:YES];
    
}

-(IBAction)openLinkToNS:(id)sender{
    NSLog(@"link to NS");
    NSCoders_Night *nsView=[[NSCoders_Night alloc] initWithNibName:@"NSCoders_Night" bundle:nil];
    [self  presentModalViewController:nsView animated:YES];
    
    [nsView release];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;

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

-(void)dealloc{
    [description release];
    [linkToCph release];
    [linkToNS release];
    [super dealloc];    
}

@end
