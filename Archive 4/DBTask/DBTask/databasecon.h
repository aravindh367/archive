//
//  databasecon.h
//  dbtask
//
//  Created by Green on 6/29/15.
//  Copyright (c) 2015 Greens. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"
#define DBName @"sathishDB.sqlite"
@interface databasecon : NSObject
{
    sqlite3 *database;
    
    NSString *documentsPath;
    NSString *documentsDir;
    NSString *databaseName;
    
    BOOL result;
    NSMutableDictionary *dict;
    NSMutableArray *dictArray;
    NSUserDefaults *userCurrentStatus;

}
-(void)verifyDatabase : (NSString *)dbname : (NSString *)dbPath;
-(void)openDatabase;
-(BOOL)Insert : (NSString *)empnameDB : (NSString *)empidDB;
-(NSMutableArray *)selectallRecords;
-(BOOL)update:(NSString*)empnameDB : (NSString *)empidDB;
-(BOOL)deleteDB : (NSString *)empnameDB : (NSString *)empidDB;
-(BOOL)loginDB : (NSString *)empnameDB : (NSString *)empidDB;
-(BOOL)USerCheck:(NSString*)empidDB;
-(NSMutableArray *)getallRecords;


@property(nonatomic,retain)NSString *name;
@property(nonatomic,retain)NSString *pass;

@end
