//
//  SharedData.h
//  DemoApp
//
//  Created by Mohan on 05/03/13.
//  Copyright (c) 2013 Therapy Box. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SharedData : NSObject
{
    
}

+ (SharedData *) sharedConstants;
@property(nonatomic,retain)NSString *tempString;



@end
