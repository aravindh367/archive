//
//  AddViewController.h
//  TableSearchPractice
//
//  Created by Green on 7/5/15.
//  Copyright (c) 2015 Greens. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddViewController : UIViewController
{
    
    __weak IBOutlet UITextField *addText;
}
- (IBAction)addTableValue:(id)sender;
@end
