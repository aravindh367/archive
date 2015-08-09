//
//  ViewController.m
//  XmlParserTask
//
//  Created by Greens on 6/23/15.
//  Copyright (c) 2015 greens. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"
#import "Reachability.h"
#import "APLViewController.h"

@interface ViewController ()<NSXMLParserDelegate>
{
    NSMutableDictionary  *my_dict;
    int a;
}
@property (nonatomic, weak) IBOutlet UITextField *remoteHostLabel;
@property (nonatomic, weak) IBOutlet UIImageView *remoteHostImageView;
@property (nonatomic, weak) IBOutlet UITextField *remoteHostStatusField;

@property (nonatomic, weak) IBOutlet UIImageView *internetConnectionImageView;
@property (nonatomic, weak) IBOutlet UITextField *internetConnectionStatusField;

@property (nonatomic, weak) IBOutlet UIImageView *localWiFiConnectionImageView;
@property (nonatomic, weak) IBOutlet UITextField *localWiFiConnectionStatusField;

@property (nonatomic) Reachability *hostReachability;
@property (nonatomic) Reachability *internetReachability;
@property (nonatomic) Reachability *wifiReachability;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    
    //Change the host name here to change the server you want to monitor.
//    NSString *remoteHostName = @"www.apple.com";
//    NSString *remoteHostLabelFormatString = NSLocalizedString(@"Remote Host: %@", @"Remote host label format string");
//    self.remoteHostLabel.text = [NSString stringWithFormat:remoteHostLabelFormatString, remoteHostName];
    
//    self.hostReachability = [Reachability reachabilityWithHostName:remoteHostName];
//    [self.hostReachability startNotifier];
//    [self updateInterfaceWithReachability:self.hostReachability];
    
    self.internetReachability = [Reachability reachabilityForInternetConnection];
    [self.internetReachability startNotifier];
    [self updateInterfaceWithReachability:self.internetReachability];
    
//    self.wifiReachability = [Reachability reachabilityForLocalWiFi];
//    [self.wifiReachability startNotifier];
//    [self updateInterfaceWithReachability:self.wifiReachability];
classElement = [[NSString alloc]init];
title_array=[[NSMutableArray alloc]init];
pubDate_array=[[NSMutableArray alloc]init];
link_array=[[NSMutableArray alloc]init];
description_array=[[NSMutableArray alloc]init];
my_dict=[[NSMutableDictionary alloc]init];
    
    xmlParser    =[[NSXMLParser alloc]initWithContentsOfURL:[NSURL URLWithString:@"https://www.apple.com/main/rss/hotnews/hotnews.rss"]];
    xmlParser.delegate  =self;
    [xmlParser parse];
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void) reachabilityChanged:(NSNotification *)note
{
    Reachability* curReach = [note object];
    NSParameterAssert([curReach isKindOfClass:[Reachability class]]);
    [self updateInterfaceWithReachability:curReach];
}


- (void)updateInterfaceWithReachability:(Reachability *)reachability
{
    if (reachability == self.hostReachability)
    {
        [self configureTextField:self.remoteHostStatusField imageView:self.remoteHostImageView reachability:reachability];
        NetworkStatus netStatus = [reachability currentReachabilityStatus];
        BOOL connectionRequired = [reachability connectionRequired];
        
        
        
        if (connectionRequired)
        {
            UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Alert #1" message:@"Internet Not Available" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            
//            NSLocalizedString(@"Cellular data network is available.\nInternet traffic will be routed through it after a connection is established.", @"Reachability text if a connection is required");
        }
        else
        {
            UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Alert #2" message:@"Cellular data network is active" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
//            baseLabelText = NSLocalizedString(@"Cellular data network is active.\nInternet traffic will be routed through it.", @"Reachability text if a connection is not required");
        }
        
    }
    
    if (reachability == self.internetReachability)
    {
        [self configureTextField:self.internetConnectionStatusField imageView:self.internetConnectionImageView reachability:reachability];
    }
    
//   else if (reachability == self.wifiReachability)
//    {
//        [self configureTextField:self.localWiFiConnectionStatusField imageView:self.localWiFiConnectionImageView reachability:reachability];
//    }
}


- (void)configureTextField:(UITextField *)textField imageView:(UIImageView *)imageView reachability:(Reachability *)reachability
{
    NetworkStatus netStatus = [reachability currentReachabilityStatus];
    BOOL connectionRequired = [reachability connectionRequired];
    NSString* statusString = @"";
    
//    switch (netStatus)
    if(netStatus==NotReachable)
    {
//        case NotReachable:        {
//            statusString = NSLocalizedString(@"Access Not Available", @"Text field text for access is not available");
//            imageView.image = [UIImage imageNamed:@"stop-32.png"] ;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        UIImage *wonImage = [UIImage imageNamed:@"dhoni.jpg"];
        imageView.contentMode=UIViewContentModeCenter;
        [imageView setImage:wonImage];
            UIAlertView *alert_one=[[UIAlertView alloc]initWithTitle:@"Alert #3" message:@"Internet Not Available" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {
            [alert_one setValue:imageView forKey:@"accessoryView"];
        }else{
            [alert_one addSubview:imageView];
        }
        [alert_one show];
        
            /*
             Minor interface detail- connectionRequired may return YES even when the host is unreachable. We cover that up here...
             */
            connectionRequired = NO;
//            break;
        }
            
//        case ReachableViaWWAN:
    else if (netStatus==ReachableViaWWAN)
{
    
            UIAlertView *alert_one=[[UIAlertView alloc]initWithTitle:@"Alert #4" message:@"Reachable WWAN" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert_one show];
//            statusString = NSLocalizedString(@"Reachable WWAN", @"");
//            imageView.image = [UIImage imageNamed:@"WWAN5.png"];
//            break;
        }
//        case ReachableViaWiFi:
    else if (netStatus==ReachableViaWiFi){
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        UIImage *wonImage = [UIImage imageNamed:@"dhoni.jpg"];
        imageView.contentMode=UIViewContentModeCenter;
        [imageView setImage:wonImage];
            UIAlertView *alert_one=[[UIAlertView alloc]initWithTitle:@"Alert #5" message:@"Reachable WiFi" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {
            [alert_one setValue:imageView forKey:@"accessoryView"];
        }else{
            [alert_one addSubview:imageView];
        }
        [alert_one show];
//            statusString= NSLocalizedString(@"Reachable WiFi", @"");
//            imageView.image = [UIImage imageNamed:@"Airport.png"];
//            break;
//        }
    }
    
    if (connectionRequired)
    {
        NSString *connectionRequiredFormatString = NSLocalizedString(@"%@, Connection Required", @"Concatenation of status string with connection requirement");
        statusString= [NSString stringWithFormat:connectionRequiredFormatString, statusString];
        UIAlertView *alert_four=[[UIAlertView alloc]initWithTitle:@"Alert #6" message:statusString delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert_four show];
    }
   
//    textField.text= statusString;
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kReachabilityChangedNotification object:nil];
}


- (void)parserDidStartDocument:(NSXMLParser *)parser
{
    NSLog(@"xml parser started");
}
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    
    NSLog(@"The Elememnt is %@",elementName);
    classElement= elementName;
    if([elementName isEqualToString:@"item"])
    {
        title_str =[[NSMutableString alloc]init];
        pub_date_str=[[NSMutableString alloc]init];
        link_str=[[NSMutableString alloc]init];
        description_str=[[NSMutableString alloc]init];
//        selceted = YES;
//        a=1;
        
    }
}
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
//    NSLog(@"Found Chars");
//    if(a==1)
//    {
        if([classElement isEqualToString:@"title"])
            
            
        {
            [title_str  appendString:string];
            
            
        }
        if([classElement isEqualToString:@"pubDate"])
            
            
        {
            [pub_date_str  appendString:string];
            
            
        }
        if([classElement isEqualToString:@"link"])
            
            
        {
            [link_str  appendString:string];
            
            
        }
        if([classElement isEqualToString:@"description"])
            
            
        {
            [description_str  appendString:string];
            
            
        }

        
        
        //       NSLog(@"custom_String-->%@",custom_String);
//    }
    
}
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if([elementName isEqualToString:@"item"])
    {
        
        [title_array addObject:title_str];
        [pubDate_array addObject:pub_date_str];
        [link_array addObject:link_str];
        [description_array addObject:description_str];
//        [title setObject:@"title" forKey:title_array];
        [my_dict setValue:title_array forKey:@"title"];
        [my_dict setValue:pubDate_array forKey:@"pub_date"];
        [my_dict setValue:link_array forKey:@"link"];
        [my_dict setValue:description_array forKey:@"description"];
//        a=0;
        
    }
}
-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
    NSLog(@"I  am  errror%@",parseError);
}

- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    NSLog(@"Title ==>%@",title_array);
    NSLog(@"Pub Date ==>%@",pubDate_array);
      NSLog(@"The Link is ==>%@",link_array);
      NSLog(@"The Desc is ==>%@",description_array);
        NSLog(@"The Title is ==>%@",my_dict);
NSLog(@"The Value is%@",[[my_dict valueForKey:@"link"]objectAtIndex:1]);
    
    NSLog(@"The Title is%lu",(unsigned long)[title_array count]);
     NSLog(@"The PubDate is %lu",(unsigned long)[pubDate_array count]);
     NSLog(@"The Link is %lu",(unsigned long)[link_array count]);
     NSLog(@"The Desc is %lu",(unsigned long)[description_array count]);
    //     NSLog(@"xml parser end");
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[my_dict valueForKey:@"link"]count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomTableViewCell *cust_Cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
   
    cust_Cell.centerLabel.text=[[my_dict valueForKey:@"pub_date"]objectAtIndex:indexPath.row];
    cust_Cell.centerLabel.numberOfLines=cust_Cell.centerLabel.frame.size.width;
     cust_Cell.centerLabel.lineBreakMode =UILineBreakModeWordWrap;
    cust_Cell.leftLabel.text=[[my_dict valueForKey:@"title"]objectAtIndex:indexPath.row];
    cust_Cell.leftLabel.numberOfLines=cust_Cell.leftLabel.frame.size.width;
    cust_Cell.leftLabel.lineBreakMode =UILineBreakModeWordWrap;
    cust_Cell.rightLabel.text=[[my_dict valueForKey:@"link"]objectAtIndex:indexPath.row];
    cust_Cell.rightLabel.numberOfLines=cust_Cell.rightLabel.frame.size.width;
    cust_Cell.rightLabel.lineBreakMode =UILineBreakModeWordWrap;
    cust_Cell.descLabel.text=[[my_dict valueForKey:@"description"]objectAtIndex:indexPath.row];
    cust_Cell.descLabel.numberOfLines=cust_Cell.descLabel.frame.size.width;
    cust_Cell.descLabel.lineBreakMode =UILineBreakModeWordWrap;
    
    return  cust_Cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

