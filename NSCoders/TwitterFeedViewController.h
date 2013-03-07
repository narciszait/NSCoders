//
//  TwitterFeedViewController.h
//  NSCoders
//
//  Created by Narcis on 4/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TwitterFeed.h"

@interface TwitterFeedViewController : UIViewController <UITabBarControllerDelegate>{
    TwitterFeed *feedViewController;
}

@property (nonatomic, retain) TwitterFeed *feedViewController;

@property (strong, nonatomic) UITabBarController *tabBarController;

@end
