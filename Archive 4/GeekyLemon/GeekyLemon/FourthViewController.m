//
//  FourthViewController.m
//  GeekyLemon
//
//  Created by Green on 7/8/15.
//  Copyright (c) 2015 Greens. All rights reserved.
//

#import "FourthViewController.h"

@interface FourthViewController ()
{
      NSURLRequest  *request;
}
@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"Called");
    NSString  *url_String  =searchBar.text;
    
    NSURL  *url  = [NSURL URLWithString:url_String];
    
    request =[NSURLRequest requestWithURL:url];
    
    [webview loadRequest:request];
    
    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityIndicator.frame = CGRectMake(100 ,100,100, 200);
    [self.view addSubview:activityIndicator];

//    [searchBar resignFirstResponder];
//    [webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString         stringWithFormat:@"http://%@",searchBar.text]]]];
//    [webview addSubview:activityIndicator];
}
- (void)webViewDidStartLoad:(UIWebView *)webView;
{
    [activityIndicator startAnimating];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView;
{
    [activityIndicator stopAnimating];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error;
{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Data Disconnect" delegate:self cancelButtonTitle:@"Retry" otherButtonTitles:@"Cancel", nil];
    [alert show];
}


- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    searchBar.text = nil;
    [searchBar resignFirstResponder];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
