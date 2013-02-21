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
}

@property (nonatomic,retain) IBOutlet MKMapView *map;

-(IBAction)showUser:(id)sender;
-(IBAction)showRoute:(id)sender;

@end
