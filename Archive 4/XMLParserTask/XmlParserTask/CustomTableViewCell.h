//
//  CustomTableViewCell.h
//  XmlParserTask
//
//  Created by Greens on 6/23/15.
//  Copyright (c) 2015 greens. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
{
    
}
@property(nonatomic,retain) IBOutlet UILabel *leftLabel;
@property(nonatomic,retain) IBOutlet UILabel *rightLabel;
@property(nonatomic,retain) IBOutlet  UILabel  *centerLabel;
@property(nonatomic,retain) IBOutlet  UILabel  *descLabel;
@end
