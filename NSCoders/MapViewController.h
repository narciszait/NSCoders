//
//  MapViewController.h
//  NSCoders
//
//  Created by Narcis on 4/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapKit/MapKit.h"
#import "CoreLocation/CoreLocation.h"
#import "DisplayMap.h"

@interface MapViewController : UIViewController <MKMapViewDelegate, UIAlertViewDelegate>{
    IBOutlet MKMapView *map;
    IBOutlet UIToolbar *toolbar;
}

@property (nonatomic,retain) IBOutlet MKMapView *map;

@property (nonatomic,retain) IBOutlet UIToolbar *toolbar;


//-(IBAction)showUser:(id)sender;
//-(IBAction)showRoute:(id)sender;
-(IBAction)showUserLocation:(id)sender;
-(IBAction)showDrivingRoute:(id)sender;
-(IBAction)showWalkingRoute:(id)sender;
-(IBAction)showPublicTransport:(id)sender;

@end
