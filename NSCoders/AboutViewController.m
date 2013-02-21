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
    UIColor *color = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"vertical_cloth.png"]];
    self.view.backgroundColor = color;
    
    
    description.textColor=[UIColor colorWithRed:0.875 green:0.875 blue:0.875 alpha:1];
    linkToNS.textColor=[UIColor colorWithRed:0.875 green:0.875 blue:0.875 alpha:1];
    linkToCph.textColor=[UIColor colorWithRed:0.875 green:0.875 blue:0.875 alpha:1];
    
    UITapGestureRecognizer *gestureRecCph = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openUrl:)];
    gestureRecCph.numberOfTouchesRequired = 1;
    gestureRecCph.numberOfTapsRequired = 1;
    [linkToCph addGestureRecognizer:gestureRecCph];
    [gestureRecCph release];
    
    UITapGestureRecognizer *gestureRecNS = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openUrl:)];
    gestureRecNS.numberOfTouchesRequired = 1;
    gestureRecNS.numberOfTapsRequired = 1;
    [linkToNS addGestureRecognizer:gestureRecNS];
    [gestureRecNS release];
    
   [color release];
}

- (void)openUrl:(id)sender
{
    UIGestureRecognizer *rec = (UIGestureRecognizer *)sender;
    
    id hitLabel = [self.view hitTest:[rec locationInView:self.view] withEvent:UIEventTypeTouches];
    
    if ([hitLabel isKindOfClass:[UILabel class]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:((UILabel *)hitLabel).text]];
    }
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
