//
//  SecondViewController.h
//  CoreDataExample
//
//  Created by Green on 7/9/15.
//  Copyright (c) 2015 Greens. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController
{
   IBOutlet UITableView *tableview;
    
}
@property(nonatomic,retain)NSManagedObjectContext  *mangedobjectContext_one;
@property(nonatomic,retain)NSArray  *array_secondView;

@end
