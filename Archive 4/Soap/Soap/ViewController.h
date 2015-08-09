//
//  ViewController.h
//  Soap
//
//  Created by Green on 6/27/15.
//  Copyright (c) 2015 Greens. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    
IBOutlet UITextField *celcius;
    
    IBOutlet UITextField *farhenheit;
    NSMutableData *mut_data;
    NSXMLParser *xmlParser;
    UIActivityIndicatorView *activityIndicator;
}

- (IBAction)convertAction:(id)sender;

@end

