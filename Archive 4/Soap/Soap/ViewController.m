//
//  ViewController.m
//  Soap
//
//  Created by Green on 6/27/15.
//  Copyright (c) 2015 Greens. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSXMLParserDelegate,UITextFieldDelegate>
{
    NSString *soapMsg;
    NSString *soapMsg_one;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     celcius.delegate=self;
     farhenheit.delegate=self;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)convertAction:(id)sender {
    
    CGRect frame=CGRectMake(150, 170, 50, 20);
    activityIndicator=[[UIActivityIndicatorView alloc]initWithFrame:frame];
    activityIndicator.activityIndicatorViewStyle=UIActivityIndicatorViewStyleGray;
    [self.view addSubview:activityIndicator];
    [activityIndicator startAnimating];
    mut_data=[[NSMutableData alloc]init];
    NSLog(@"Complete");

    [self callServices];
   
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
 
    return YES;
}

-(void)callServices{
   
    NSLog(@"Call Services");
    if([celcius.text isEqualToString:@""]){
        
        NSLog(@"Celciuss is Nill");
        soapMsg_one=[NSString stringWithFormat: @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                     "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                     "<soap:Body>\n"
                     "<FahrenheitToCelsius xmlns=\"http://www.w3schools.com/webservices/\">\n"
                     "<Fahrenheit>%@</Fahrenheit>\n"
                     "</FahrenheitToCelsius>\n"
                     "</soap:Body>\n"
                     "</soap:Envelope>",farhenheit.text];
        
        NSString *strurl=@"http://www.w3schools.com/webservices/tempconvert.asmx";
        NSURL *url=[NSURL URLWithString:strurl];
        
        //        NSMutableURLRequest *req=[NSMutableURLRequest requestWithURL:url];
        NSMutableURLRequest *req_one=[NSMutableURLRequest requestWithURL:url];
        
        NSString *msglen=[NSString stringWithFormat:@"%ld",[soapMsg_one length]];
        
        
        [req_one addValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        [req_one addValue:msglen forHTTPHeaderField:@"Content-Type"];
        [req_one addValue:@"http://www.w3schools.com/webservices/FahrenheitToCelsius" forHTTPHeaderField:@"SOAPAction"];
        [req_one setHTTPBody:[soapMsg_one dataUsingEncoding:NSUTF8StringEncoding]];
        [req_one setHTTPMethod:@"POST"];
        
        [NSURLConnection connectionWithRequest:req_one delegate:self];
    }
    else if([farhenheit.text isEqualToString:@""]){
        
        NSLog(@"Farenheit is Nill");
        soapMsg=[NSString stringWithFormat: @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                 "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                 "<soap:Body>\n"
                 "<CelsiusToFahrenheit xmlns=\"http://www.w3schools.com/webservices/\">\n"
                 "<Celsius>%@</Celsius>\n"
                 "</CelsiusToFahrenheit>\n"
                 "</soap:Body>\n"
                 "</soap:Envelope>",celcius.text];
        
        NSString *strurl=@"http://www.w3schools.com/webservices/tempconvert.asmx";
        NSURL *url=[NSURL URLWithString:strurl];
        
        NSMutableURLRequest *req=[NSMutableURLRequest requestWithURL:url];
        //        NSMutableURLRequest *req_one=[NSMutableURLRequest requestWithURL:url];
//    Host: www.w3schools.com
//        Content-Type: text/xml; charset=utf-8
//        Content-Length: length
//    SOAPAction: "http://www.w3schools.com/webservices/CelsiusToFahrenheit"
        NSString *msglen=[NSString stringWithFormat:@"%ld",[soapMsg length]];
        [req addValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        [req addValue:msglen forHTTPHeaderField:@"Content-Type"];
        [req addValue:@"http://www.w3schools.com/webservices/CelsiusToFahrenheit" forHTTPHeaderField:@"SOAPAction"];
        [req setHTTPBody:[soapMsg dataUsingEncoding:NSUTF8StringEncoding]];
        [req setHTTPMethod:@"POST"];
        
        [NSURLConnection connectionWithRequest:req delegate:self];
        NSLog(@"Link COmpleted");
    }
    
   
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"Inside");
    [mut_data setLength:0];
    NSLog(@"Inside Completed");
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"append Data");
    [mut_data appendData:data];
    NSLog(@"append Data Comleted");

    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    xmlParser = [[NSXMLParser alloc]initWithData:mut_data];
    [xmlParser setDelegate:self];
    [xmlParser parse];
    
    [activityIndicator stopAnimating];
    
}
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    NSLog(@"Found");
    if ([farhenheit.text isEqualToString:@""]) {
            farhenheit.text = string;
    }else if ([celcius.text isEqualToString:@""]){
        celcius.text=string;
    }
    
    
}


- (void)textFieldDidBeginEditing:(UITextField *)textField;{
    if(farhenheit.text){
        celcius.text=@"";
        }
    if(celcius.text){
        farhenheit.text=@"";
        }
}

@end
