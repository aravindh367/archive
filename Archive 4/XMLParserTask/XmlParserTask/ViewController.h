//
//  ViewController.h
//  XmlParserTask
//
//  Created by Greens on 6/23/15.
//  Copyright (c) 2015 greens. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

{
    UITableView *myTable;
    NSXMLParser *xmlParser;
    NSMutableArray *title_array;
    NSMutableArray *pubDate_array;
        NSMutableArray *link_array;
        NSMutableArray *description_array;
    NSString *classElement;
    NSMutableString *title_str;
    NSMutableString *link_str;
    NSMutableString *description_str;
    NSMutableString *pub_date_str;
    bool selceted;
    
}
@end

