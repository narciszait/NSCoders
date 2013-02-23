//
//  DisplayMap.h
//  NSCoders
//
//  Created by Narcis on 7/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface DisplayMap : NSObject <MKAnnotation>{
    CLLocationCoordinate2D coordinate;
    NSString *title;
    int un_numar;
}

@property (nonatomic,assign) CLLocationCoordinate2D coordinate;
@property (nonatomic,copy) NSString *title;

@end
