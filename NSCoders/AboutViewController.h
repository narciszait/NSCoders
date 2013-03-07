//
//  AboutViewController.h
//  NSCoders
//
//  Created by Narcis on 4/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPH_Cocoa.h"
#import "NSCoders_Night.h"

@interface AboutViewController : UIViewController<UITabBarControllerDelegate>{
   IBOutlet UILabel  *description;
   IBOutlet UIButton *linkToCph;
   IBOutlet UIButton *linkToNS;
}

@property (nonatomic,retain) IBOutlet UILabel *description;
@property (nonatomic,retain) IBOutlet UIButton *linkToCph;
@property (nonatomic,retain) IBOutlet UIButton *linkToNS;

@property (strong, nonatomic) UITabBarController *tabBarController;

-(IBAction)openLinkToCPH:(id)sender;
-(IBAction)openLinkToNS:(id)sender;


@end
