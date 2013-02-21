//
//  AboutViewController.h
//  NSCoders
//
//  Created by Narcis on 4/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutViewController : UIViewController{
   IBOutlet UILabel  *description;
   IBOutlet UILabel *linkToCph;
   IBOutlet UILabel *linkToNS;
}

@property (nonatomic,retain) IBOutlet UILabel *description;
@property (nonatomic,retain) IBOutlet UILabel *linkToCph;
@property (nonatomic,retain) IBOutlet UILabel *linkToNS;


@end
