//
//  SecondViewController.h
//  GeekyLemon
//
//  Created by Green on 7/8/15.
//  Copyright (c) 2015 Greens. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController
{
    IBOutlet UIImageView *Imageview;
    IBOutlet UITextField *Textfield;
}
-(IBAction)TextfieldMove:(id)sender;
-(IBAction)DismissKeyboard:(id)sender;
- (IBAction)switchBack:(id)sender;
@end
