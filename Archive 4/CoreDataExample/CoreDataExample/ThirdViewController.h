//
//  ThirdViewController.h
//  CoreDataExample
//
//  Created by Green on 7/9/15.
//  Copyright (c) 2015 Greens. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdViewController : UIViewController
{
    IBOutlet UILabel *langLabel;
    
}
@property(nonatomic,retain)NSString *language;
@property(nonatomic,retain)NSArray *array_three;

@property(nonatomic,retain)NSManagedObjectContext  *mangedobjectContext_three;
@end
