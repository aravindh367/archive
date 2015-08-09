//
//  secondViewController.h
//  TableViewPracticeFinal
//
//  Created by Greens on 10/07/15.
//  Copyright (c) 2015 greens. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface secondViewController : UIViewController
{
    
    
}

@property(nonatomic,retain) IBOutlet UIImageView *detailImg;
@property(nonatomic,retain) IBOutlet UILabel *detailLabel;
@property(nonatomic,retain) NSString *activestring;
@property(nonatomic,retain) NSString *activestring1;
@property(nonatomic,retain) NSString *activestring2;
- (IBAction)barAction:(id)sender;



@end
