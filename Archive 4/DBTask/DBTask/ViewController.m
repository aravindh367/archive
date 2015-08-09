//
//  ViewController.m
//  DBTask
//
//  Created by Green on 7/4/15.
//  Copyright (c) 2015 Greens. All rights reserved.
//

#import "ViewController.h"
#import "databasecon.h"

@interface ViewController ()
{
    databasecon *con;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
con=[[databasecon alloc]init];
    [con getallRecords];
    
    
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)insert:(id)sender {
    
    if([con USerCheck:empid.text]){
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Username Alerady exists" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        
    }else
           [con Insert:empname.text :empid.text];
}

- (IBAction)select:(id)sender {
    
    [con getallRecords];
}

- (IBAction)update:(id)sender {
    
    if([con update:empname.text :empid.text]){
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Updated Successful" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }else{
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Failed to Update" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }

    
}

- (IBAction)deelete:(id)sender {
    if([con deleteDB:empname.text :empid.text]==YES)
    {
        NSLog(@"IN");
UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Deleted Successful" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert1 show];
        NSLog(@"OUT");
        
    }else{
UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Failed to Delete" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert1 show];
        
    }
}

- (IBAction)login:(id)sender {
    
    if([con loginDB:empname.text :empid.text]){
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Login Successful" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        
    }else{
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Login Failed" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    empname.text=[empname.text uppercaseString];
    return YES;
}

@end
