//
//  ThirdViewController.m
//  TabbingTask
//
//  Created by Greens on 6/15/15.
//  Copyright (c) 2015 greens. All rights reserved.
//

#import "ThirdViewController.h"
#import "FourthViewController.h"

@interface ThirdViewController ()
- (IBAction)presentAction:(id)sender;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
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
//
//ThirdViewController *third=[self.storyboard instantiateViewControllerWithIdentifier:@"third"];
//[[self navigationController]pushViewController:third animated:YES];

- (IBAction)presentAction:(id)sender {
    FourthViewController *fourth=[self.storyboard instantiateViewControllerWithIdentifier:@"fourth"];
    [self presentViewController:fourth animated:YES completion:nil];
    
}
@end
