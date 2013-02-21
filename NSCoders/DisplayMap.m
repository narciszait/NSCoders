//
//  DisplayMap.m
//  NSCoders
//
//  Created by Narcis on 7/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DisplayMap.h"


@implementation DisplayMap

@synthesize coordinate,title;

-(void)dealloc{
    [title release];
    [super dealloc];
}

@end
