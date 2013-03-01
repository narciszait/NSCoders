//
//  MapViewController.m
//  NSCoders
//
//  Created by Narcis on 4/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MapViewController.h"
#import "LocalizedCurrentLocation.h"

@implementation MapViewController

@synthesize map; //currentLocation
@synthesize toolbar;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Find Us", nil);
        self.tabBarItem.image = [UIImage imageNamed:@"map"];
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
    UIColor *color = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"vertical_cloth.png"]];
    self.view.backgroundColor = color;
    [color release];
    
    [self createToolbar];
    
    [map setMapType:MKMapTypeStandard];
    [map setZoomEnabled:YES];
    [map setScrollEnabled:YES];
    MKCoordinateRegion region={{0.0,0.0},{0.0,0.0}};
    region.center.latitude=55.69313;
    region.center.longitude=12.54343;
    region.span.latitudeDelta=0.01f;
    region.span.longitudeDelta=0.01f;
    [map setRegion:region animated:YES];
    
    map.showsUserLocation=YES;
    
    [map setDelegate:self];
    
    DisplayMap *ann=[[DisplayMap alloc] init];
    ann.title=@"Cafe Retro Norrebro";
    ann.coordinate=region.center;
    [map addAnnotation:ann];
}

-(MKAnnotationView*)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    MKPinAnnotationView *pinView=nil;
    if(annotation!=mapView.userLocation){
        static NSString *defaultPinID=@"com.narcis.testing.nscoders";
        pinView=(MKPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:defaultPinID];
        if(pinView==nil){
            pinView=[[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:defaultPinID]autorelease];
        }
        pinView.pinColor=MKPinAnnotationColorGreen;
        pinView.canShowCallout=YES;
        pinView.animatesDrop=YES;
    }
    else{
        [mapView.userLocation setTitle:@"I am here!"];
    }
    return pinView;
}

//-(IBAction)showUser:(id)sender{
//   [map setCenterCoordinate:map.userLocation.coordinate animated:YES]; 
//}
//
//-(IBAction)showRoute:(id)sender{
//    //UIActionSheet *sheet=[[UIActionSheet alloc] initWithTitle:@"Open in Maps" delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:@"Apple Maps",@"Google Maps", nil];
//    //[sheet showInView:self.view];
//    
//        UIAlertView *alertUser=[[UIAlertView alloc] initWithTitle:@"Open external app" message:@"This will open Apple Maps" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
//        [alertUser show];
//        [alertUser release];
//    
//    //    UIApplication *app = [UIApplication sharedApplication];
//    //    [app openURL:[NSURL URLWithString:@"http://maps.google.com/maps?q=Paris"]];
//}

//-(void)actionSheet:(UIActionSheet*)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
 //   CLLocationCoordinate2D
//}

-(void)createToolbar{
    toolbar.tintColor=[[UIColor alloc] initWithRed:0.882 green:0.894 blue:0.941 alpha:1]; 
    [toolbar setTranslucent:YES];
   
    UIImage *locateUser = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"locateUser" ofType:@"png"]];
    UIButton *locateUserButton = [[UIButton alloc] init];
    [locateUserButton setImage:locateUser forState:UIControlStateNormal];
    [locateUserButton addTarget:self action:@selector(showUserLocation:) forControlEvents:UIControlEventTouchUpInside];
    [locateUserButton setFrame:CGRectMake(0, 0, 30, 32)];
    
    UIImage *car = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"car" ofType:@"png"]];
    UIButton *carButton = [[UIButton alloc] init];
    [carButton setImage:car forState:UIControlStateNormal];
    [carButton addTarget:self action:@selector(showDrivingRoute:) forControlEvents:UIControlEventTouchUpInside];
    [carButton setFrame:CGRectMake(0, 0, 30, 32)];
    
    UIImage *walk = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"walk" ofType:@"png"]];
    UIButton *walkButton = [[UIButton alloc] init];
    [walkButton setImage:walk forState:UIControlStateNormal];
    [walkButton addTarget:self action:@selector(showWalkingRoute:) forControlEvents:UIControlEventTouchUpInside];
    [walkButton setFrame:CGRectMake(0, 0, 30, 32)];
    
    UIImage *public = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"public" ofType:@"png"]];
    UIButton *publicButton = [[UIButton alloc] init];
    [publicButton setImage:public forState:UIControlStateNormal];
    [publicButton addTarget:self action:@selector(showPublicTransport:) forControlEvents:UIControlEventTouchUpInside];
    [publicButton setFrame:CGRectMake(0, 0, 30, 32)];

    
    UIBarButtonItem *button1 = [[UIBarButtonItem alloc] initWithCustomView:locateUserButton];
    UIBarButtonItem *button2 = [[UIBarButtonItem alloc] initWithCustomView:carButton];
    UIBarButtonItem *button3 = [[UIBarButtonItem alloc] initWithCustomView:walkButton];
    UIBarButtonItem *button4 = [[UIBarButtonItem alloc] initWithCustomView:publicButton];
    
    
    UIBarButtonItem *flexibleSpace1=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *flexibleSpace2=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *flexibleSpace3=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];

    
    NSArray *buttonItems = [NSArray arrayWithObjects:button1, flexibleSpace1, button2, flexibleSpace2, button3, flexibleSpace3, button4, nil];
    [toolbar setItems:buttonItems];
    [self.view addSubview:toolbar];

}

-(IBAction)showUserLocation:(id)sender{
    NSLog(@"User Location");
}

-(IBAction)showDrivingRoute:(id)sender{
     NSLog(@"driving route");
}

-(IBAction)showWalkingRoute:(id)sender{
    NSLog(@"walking route");
}

-(IBAction)showPublicTransport:(id)sender{
    NSLog(@"Public transport");
}



-(void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex==0){
        [alertView release];
    }
    if(buttonIndex==1){
        NSString* address = @"Jægersborggade 16, 2200 København N, Denmark";
        NSString* currentLocation = [LocalizedCurrentLocation currentLocationStringForCurrentLanguage];
        //NSString* url = [NSString stringWithFormat: @"http://maps.google.com/maps?saddr=%@&daddr=%@&dirflg=r",[currentLocation stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[address stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
         NSString* url = [NSString stringWithFormat: @"http://maps.apple.com/?saddr=%@&daddr=%@&dirflg=r",[currentLocation stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[address stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        UIApplication *app = [UIApplication sharedApplication];
        [app openURL: [NSURL URLWithString: url]];

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

@end
