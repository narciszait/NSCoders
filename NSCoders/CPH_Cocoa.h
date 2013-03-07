//
//  CPH_Cocoa.h
//  NSCoders
//
//  Created by Narcis on 3/1/13.
//
//

#import <UIKit/UIKit.h>

@interface CPH_Cocoa : UIViewController <UIWebViewDelegate> {
    IBOutlet UIToolbar *backToolbar;
    IBOutlet UIWebView *cphCocoa;
}

@property (nonatomic,retain) IBOutlet UIToolbar *backToolbar;
@property (nonatomic,retain) IBOutlet UIWebView *cphCocoa;

-(IBAction)backToApp:(id)sender;

@end
