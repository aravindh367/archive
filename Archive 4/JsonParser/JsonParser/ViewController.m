//
//  ViewController.m
//  JsonParser
//
//  Created by Greens on 6/25/15.
//  Copyright (c) 2015 greens. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSMutableData *receiveData;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    
    NSString *urlbase=@"http://api.openweathermap.org/data/2.5/weather?lat=35&lon=139";
    NSURL *url=[NSURL URLWithString:urlbase];
    
    NSURLRequest *therequest=[NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    
NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:therequest delegate:self];
    receiveData = [[NSMutableData alloc]init];
    [super viewDidLoad];
 // Do any additional setup after loading the view, typically from a nib.
    [super viewDidLoad];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    
    [receiveData setLength:0];
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data

{
    [receiveData appendData:data];
    
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    NSLog(@"receive data ---> %@",receiveData);
    
    NSDictionary *dicts=[NSJSONSerialization JSONObjectWithData:receiveData options:NSJSONReadingAllowFragments error:nil];
    
    NSLog(@"Dicts---->%@",dicts);
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Error is-->%@",error);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
