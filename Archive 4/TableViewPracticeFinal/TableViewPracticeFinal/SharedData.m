//
//  SharedData.m
//  DemoApp
//
//  Created by Mohan on 05/03/13.
//  Copyright (c) 2013 Therapy Box. All rights reserved.
//

#import "SharedData.h"

@implementation SharedData
//Active Downloads

@synthesize tempString;
+ (SharedData *) sharedConstants{
    // the instance of this class is stored here
    static SharedData *myInstance = nil;
    
    // check to see if an instance already exists
    if (nil == myInstance) {
        myInstance  = [[[self class] alloc] init];
        myInstance.tempString =[[NSString alloc]init];
    }
    // return the instance of this class
    return myInstance;
    

}//End of class method
@end

