//
//  CPH_Cocoa.m
//  NSCoders
//
//  Created by Narcis on 3/1/13.
//
//

#import "CPH_Cocoa.h"

@implementation CPH_Cocoa

@synthesize backToolbar;
@synthesize cphCocoa;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    cphCocoa=[[UIWebView alloc] initWithFrame:self.view.bounds];
    [cphCocoa loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://cocoacopenhagen.com"]]];
    [self.view addSubview:cphCocoa];
    [cphCocoa release];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
