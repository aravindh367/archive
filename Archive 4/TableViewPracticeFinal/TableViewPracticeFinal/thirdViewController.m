//
//  thirdViewController.m
//  TableViewPracticeFinal
//
//  Created by Greens on 10/07/15.
//  Copyright (c) 2015 greens. All rights reserved.
//

#import "thirdViewController.h"
#import "secondViewController.h"
#import "ViewController.h"
#import "ObjectsPassing.h"
#import "SharedData.h"

@interface thirdViewController ()
{
    ObjectsPassing *obj;
    secondViewController *second;
}
@end

@implementation thirdViewController
@synthesize finalLabel,finalString;
- (void)viewDidLoad {
    
    NSLog(@"%@",[SharedData sharedConstants].tempString);
    
    finalLabel.text=[SharedData sharedConstants].tempString;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
