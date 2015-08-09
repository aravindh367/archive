//
//  FourthViewController.h
//  GeekyLemon
//
//  Created by Green on 7/8/15.
//  Copyright (c) 2015 Greens. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FourthViewController : UIViewController
{
    
    IBOutlet UISearchController *searchBar;
    IBOutlet UIWebView *webview;
    	    IBOutlet UIActivityIndicatorView *activityIndicator;
}
- (IBAction)searchAction:(id)sender;
@end
