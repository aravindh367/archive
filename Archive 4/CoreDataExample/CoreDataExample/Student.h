//
//  Student.h
//  CoreDataExample
//
//  Created by Green on 7/9/15.
//  Copyright (c) 2015 Greens. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Student : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSString * lang;

@end
