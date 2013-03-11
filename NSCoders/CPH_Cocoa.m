//
//  CPH_Cocoa.m
//  NSCoders
//
//  Created by Narcis on 3/1/13.
//
//

#import "CPH_Cocoa.h"
#import "AboutViewController.h"

@implementation CPH_Cocoa


@synthesize cphCocoaWebView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization        
//        backToolbar.tintColor=[[UIColor alloc] initWithRed:1 green:0 blue:0 alpha:1];
//        [backToolbar setTranslucent:YES];
        
//        UIImage *back = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"locateUser" ofType:@"png"]];
//        UIButton *backButton = [[UIButton alloc] init];
//        [backButton setImage:back forState:UIControlStateNormal];
//        [backButton addTarget:self action:@selector(backToApp:) forControlEvents:UIControlEventTouchUpInside];
//        [backButton setFrame:CGRectMake(0, 0, 30, 32)];
//        
//        
//        UIBarButtonItem *button1 = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        
       // UIBarButtonItem *flexibleSpace1=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        
       // NSArray *buttonItems = [NSArray arrayWithObjects:button1, nil];
        //[backToolbar setItems:buttonItems];
        //[self.view addSubview:backToolbar];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSLog(@"cocoacph");
    
//    backToolbar=[[UINavigationBar alloc] init];
//    backToolbar.delegate=self;
    
    //[self createToolbar];
    
    //[self.navigationController setToolbarHidden:NO];
    cphCocoaWebView=[[UIWebView alloc] initWithFrame:self.view.bounds];
    [cphCocoaWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://copenhagencocoa.com"]]];
    [self.view addSubview:cphCocoaWebView];
    cphCocoaWebView.delegate=self;
    [cphCocoaWebView release];
}


-(void)webViewDidFinishLoad:(UIWebView *)webView{
    CGSize contentSize = webView.scrollView.contentSize;
    CGSize viewSize = self.view.bounds.size;
    
    float rw = viewSize.width / contentSize.width;
    
    webView.scrollView.minimumZoomScale = rw;
    webView.scrollView.maximumZoomScale = rw;
    webView.scrollView.zoomScale = rw;
    
    [webView setFrame:CGRectMake(0.0, 44.0, 320.0, 372.0)];
}

-(IBAction)backToApp:(id)sender{
    NSLog(@"Back to App");
    //AboutViewController *about=[[AboutViewController alloc] initWithNibName:@"AboutViewController" bundle:nil];
    //[self  presentModalViewController:about animated:YES];
    
    //[about release];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
