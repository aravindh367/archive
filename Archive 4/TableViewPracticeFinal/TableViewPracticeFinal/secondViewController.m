//
//  secondViewController.m
//  TableViewPracticeFinal
//
//  Created by Greens on 10/07/15.
//  Copyright (c) 2015 greens. All rights reserved.
//

#import "secondViewController.h"
#import "thirdViewController.h"
#import "ViewController.h"

@interface secondViewController ()

@end

@implementation secondViewController
@synthesize detailLabel,activestring,detailImg,activestring1,activestring2;
- (void)viewDidLoad {
    detailLabel.text=activestring;
    detailImg.image=[UIImage imageNamed:activestring1];
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

- (IBAction)barAction:(id)sender {
    thirdViewController *third;
    third = [self.storyboard instantiateViewControllerWithIdentifier:@"third"];
    [[self navigationController]pushViewController: third animated:YES];
    
}
@end
