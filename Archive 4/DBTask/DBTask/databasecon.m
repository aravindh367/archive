//
//  databasecon.m
//  dbtask
//
//  Created by Green on 6/29/15.
//  Copyright (c) 2015 Greens. All rights reserved.
//

#import "databasecon.h"
#import "ViewController.h"

@implementation databasecon

@synthesize name,pass;



-(void)verifyDatabase : (NSString *)dbName : (NSString *)dbPath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPath])
    {
        NSString *databasePathFromApp = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:databaseName];
        [fileManager copyItemAtPath:databasePathFromApp toPath:dbPath error:nil];
        NSLog(@"documentsPath %@ - %@",dbPath,databasePathFromApp);
    }
}

-(void)openDatabase
{
    
    databaseName = DBName;
    
    
    documentsDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex: 0];
    
    NSLog(@"documentsDir-->%@",documentsDir);
    
    documentsPath = [documentsDir stringByAppendingPathComponent:databaseName];
    NSLog(@"documentsPath-->%@",documentsPath);

    [self verifyDatabase :databaseName:documentsPath];
    
}
-(NSMutableArray *)selectallRecords
{
   // ViewController *view=[[ViewController alloc]init];
    [self openDatabase];
    
    dictArray = [[NSMutableArray alloc]init];

    
    if(sqlite3_open([documentsPath UTF8String], &database) == SQLITE_OK)
    {

        const char *sqlStatement = nil;
        
      sqlStatement=[[NSString stringWithFormat:@"select * from emplogin"]UTF8String];
        sqlite3_stmt *compiledStatement;
    
        if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK)
        {

            while(sqlite3_step(compiledStatement) == SQLITE_ROW)
            {
                NSLog(@"DATA PRESENT");
                NSString *username = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 0)];
               NSString *password = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)];
                dict = [[NSMutableDictionary alloc]init];
                [dict setObject:username forKey:@"empname"];
                [dict setObject:password forKey:@"empid"];

                [dictArray addObject:dict];
     
                
                
            }
            
        }
        else
        {
            NSLog(@"Failed");
            NSLog(@"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(database));
        }
        sqlite3_finalize(compiledStatement);
    }
    sqlite3_close(database);
    
    return dictArray;
    
}
-(NSMutableArray *)getallRecords
{
    [self openDatabase];
    

    dictArray = [[NSMutableArray alloc]init];
    
    // sqlite3_open(const char *filename, sqlite3 **ppDb)
    
    if(sqlite3_open([documentsPath UTF8String], &database) == SQLITE_OK)
    {
        // Setup the SQL Statement and compile it for faster access
        const char *sqlStatement = nil;
        
        sqlStatement=[[NSString stringWithFormat:@"select *from emplogin"]UTF8String];
        
        
        //  sqlite3_prepare_v2(<#sqlite3 *db#>, <#const char *zSql#>, <#int nByte#>, <#sqlite3_stmt **ppStmt#>, <#const char **pzTail#>)
        sqlite3_stmt *compiledStatement;
        if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK)
        {
            // Loop through the results and add them to the feeds array
            while(sqlite3_step(compiledStatement) == SQLITE_ROW)
            {
                NSLog(@"DATA PRESENT");
               name = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 0)];
               pass = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)];
                
                //NSString *tagValue = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 2)];
                //NSString *deleteValue = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 3)];
                
                dict = [[NSMutableDictionary alloc]init];
                //[dict setObject:name forKey:@"name"];
                [dict setObject:name forKey:@"empname"];
                [dict setObject:pass forKey:@"empid"];
                
                //[dict setObject:deleteValue forKey:@"DELETE"];
                //[dictArray addObject:name];
                //NSLog(@"Last-%@",dict);
                [dictArray addObject:dict];
                
            }
            
            
            }
        
        else
        {
            NSLog(@"Failed");
            NSLog(@"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(database));
        }
        sqlite3_finalize(compiledStatement);
    }
    sqlite3_close(database);
    
    NSLog(@"dict-Arra-%@",dictArray);
    return dictArray;
    
}

-(BOOL)Insert : (NSString*)empnameDB : (NSString *)empidDB
{
    
    [self openDatabase];
    //BOOL result;
    const char *sqlStatement = nil;
    
    NSLog(@"Data Name-->%@",empnameDB);
        NSLog(@"Data pass-->%@",empidDB);
    sqlStatement =[[NSString stringWithFormat:@"insert into emplogin values ('%@','%@')",empnameDB,empidDB] UTF8String];
    //    NSLog(@"%@",[NSString stringWithFormat:@"update helpsettings_table set deleteValue = %d where id = '%@'",deleteValue,jid]);
    
    
    if(sqlite3_open([documentsPath UTF8String], &database) == SQLITE_OK)
    {
        if (sqlite3_exec(database, sqlStatement, NULL,NULL, NULL) == SQLITE_OK)
        {
            NSLog(@"Inserted Successfully");
            result = YES;
        }
        else
        {
            NSLog(@"Failed to insert");
            NSLog(@"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(database));
            result = NO;
        }
    }
    sqlite3_close(database);
    return result;
    
}

-(BOOL)update:(NSString*)empnameDB : (NSString *)empidDB;
{
    [self openDatabase];
    
    NSLog(@"Data Name-->%@",empnameDB);
    NSLog(@"Data pass-->%@",empidDB);
    
    BOOL result;
     const char *sqlStatement = nil;
    
        sqlStatement =[[NSString stringWithFormat:@"update emplogin set username = '%@' where empid = '%@'",empnameDB,empidDB] UTF8String];
        //    NSLog(@"%@",[NSString stringWithFormat:@"update helpsettings_table set deleteValue = %d where id = '%@'",deleteValue,jid]);
    
    
        if(sqlite3_open([documentsPath UTF8String], &database) == SQLITE_OK)
        {
            if (sqlite3_exec(database, sqlStatement, NULL,NULL, NULL) == SQLITE_OK)
            {
                NSLog(@"Updated");
                result = YES;
            }
            else
            {
                NSLog(@"Failed");
                NSLog(@"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(database));
                result = NO;
            }
        }
        sqlite3_close(database);
        return result;
    

}

-(BOOL)USerCheck:(NSString*)empidDB;
{
    [self getallRecords];
    
    NSLog(@"dictArray==>%@",dictArray);
    
    NSLog(@"nameDB-->%@",empidDB);
    
    
    
    for (  int  i  = 0; i<[dictArray count];i++) {
        
        if([[[dictArray objectAtIndex:i]valueForKey:@"empid"]isEqualToString:empidDB])
        {
            return  YES;
        }
        else
        {
            NSLog(@"Login Failed");
        }
    }
    
    return  NO;
    
}
-(BOOL)loginDB : (NSString *)empnameDB : (NSString *)empidDB{
    [self getallRecords];
    
    NSLog(@"dictArray==>%@",dictArray);
    
    NSLog(@"nameDB-->%@",empnameDB);
    NSLog(@"passDB-->%@",empidDB);
    
    
    
    for (  int  i  = 0; i<[dictArray count];i++) {
        
        if([[[dictArray objectAtIndex:i]valueForKey:@"empid"]isEqualToString:empidDB] &&  [[[dictArray objectAtIndex:i]valueForKey:@"empname"]isEqualToString:empnameDB])
        {
            return  YES;
        }
        else
        {
            NSLog(@"Login Failed");
        }
    }
    
    return  NO;

}

-(BOOL)deleteDB : (NSString *)empnameDB : (NSString *)empidDB;
{
[self openDatabase];
//BOOL result;
const char *sqlStatement = nil;

sqlStatement =[[NSString stringWithFormat:@"delete from emplogin where username = '%@' and empid = '%@'",empnameDB,empidDB] UTF8String];
//    NSLog(@"%@",[NSString stringWithFormat:@"update helpsettings_table set deleteValue = %d where id = '%@'",deleteValue,jid]);


if(sqlite3_open([documentsPath UTF8String], &database) == SQLITE_OK)
    
{
    if (sqlite3_exec(database, sqlStatement, NULL,NULL, NULL) == SQLITE_OK)
    {
        NSLog(@"Deleted Successfully");
        result = YES;
        NSLog(@"Returned");
    }
    else
    {
        NSLog(@"Failed to delete");
        NSLog(@"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(database));
        result = NO;
    }
}
sqlite3_close(database);
return result;

}


@end
