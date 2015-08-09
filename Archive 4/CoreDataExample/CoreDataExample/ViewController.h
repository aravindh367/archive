//
//  ViewController.h
//  CoreDataExample
//
//  Created by Green on 7/9/15.
//  Copyright (c) 2015 Greens. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    
    __weak IBOutlet UITextField *name;
    __weak IBOutlet UITextField *age;
    __weak IBOutlet UITextField *lang;
}
@property(nonatomic,retain)NSManagedObjectContext  *mangedobjectContext;

- (IBAction)saveAction:(id)sender;
- (IBAction)showAction:(id)sender;
- (IBAction)predicateAction:(id)sender;
- (IBAction)nextAction:(id)sender;

@end

