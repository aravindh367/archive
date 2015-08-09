//
//  ViewController.h
//  DBTask
//
//  Created by Green on 7/4/15.
//  Copyright (c) 2015 Greens. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{

    __weak IBOutlet UITextField *empname;
    
    __weak IBOutlet UITextField *empid;
    
    
}
- (IBAction)insert:(id)sender;
- (IBAction)select:(id)sender;
- (IBAction)update:(id)sender;
- (IBAction)deelete:(id)sender;
- (IBAction)login:(id)sender;



@end

